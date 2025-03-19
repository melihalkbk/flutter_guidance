import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../data/easy_questions.dart';
import '../data/easy_questions_2.dart';
import '../data/easy_questions_3.dart';
import '../data/easy_questions_4.dart';
import 'quiz_page.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Flutter Component Exercises',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Component Exercises!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'After exploring and learning about the Flutter components in the Home page, you can test your knowledge with our interactive quizzes. Each quiz focuses on the specific components you\'ve learned about, helping you reinforce your understanding of Flutter widgets.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuizButton(context, easyQuestions, 'Easy Quiz 1'),
                      _buildQuizButton(context, easyQuestions2, 'Easy Quiz 2'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuizButton(context, easyQuestions3, 'Easy Quiz 3'),
                      _buildQuizButton(context, easyQuestions4, 'Easy Quiz 4'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizButton(
    BuildContext context,
    List<QuizQuestion> questions,
    String title,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => QuizPage(questions: questions, difficulty: title),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Start $title',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
