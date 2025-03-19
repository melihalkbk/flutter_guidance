import 'package:flutter/material.dart';
import '../models/quiz_question.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String difficulty;

  const QuizPage({
    super.key,
    required this.questions,
    required this.difficulty,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  int? _selectedAnswerIndex;

  Color _getOptionBackgroundColor(int optionIndex) {
    if (!_hasAnswered) return Colors.white;

    if (optionIndex ==
        widget.questions[_currentQuestionIndex].correctAnswerIndex) {
      return Colors.green.shade50;
    }

    if (optionIndex == _selectedAnswerIndex) {
      return Colors.red.shade50;
    }

    return Colors.white;
  }

  Color _getOptionBorderColor(int optionIndex) {
    if (!_hasAnswered) return Colors.blue.withOpacity(0.5);

    if (optionIndex ==
        widget.questions[_currentQuestionIndex].correctAnswerIndex) {
      return Colors.green;
    }

    if (optionIndex == _selectedAnswerIndex) {
      return Colors.red;
    }

    return Colors.blue.withOpacity(0.5);
  }

  void _checkAnswer(int selectedIndex) {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      _selectedAnswerIndex = selectedIndex;
      if (selectedIndex ==
          widget.questions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _hasAnswered = false;
      _selectedAnswerIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.difficulty} Quiz'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / widget.questions.length,
                backgroundColor: Colors.blue.shade100,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 24),
              Text(
                'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ...List.generate(
                question.options.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getOptionBackgroundColor(index),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: _getOptionBorderColor(index),
                          width: 2,
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _hasAnswered ? null : () => _checkAnswer(index),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        question.options[index],
                        style: TextStyle(
                          color:
                              _hasAnswered
                                  ? _getOptionBorderColor(index)
                                  : Colors.blue,
                          fontSize: 16,
                          fontWeight:
                              _hasAnswered &&
                                      (index == _selectedAnswerIndex ||
                                          index == question.correctAnswerIndex)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_hasAnswered) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    question.explanation,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                if (_currentQuestionIndex < widget.questions.length - 1)
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Next Question',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Quiz completed! Score: $_score/${widget.questions.length}',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Finish Quiz',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(int index) {
    if (!_hasAnswered) return Colors.white;
    if (index == widget.questions[_currentQuestionIndex].correctAnswerIndex) {
      return Colors.green;
    }
    if (index == _selectedAnswerIndex) {
      return Colors.red;
    }
    return Colors.white;
  }
}
