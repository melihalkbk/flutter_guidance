import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../data/easy_questions.dart';
import '../data/easy_questions_2.dart';
import '../data/easy_questions_3.dart';
import '../data/easy_questions_4.dart';
import '../data/medium_questions.dart';
import '../data/medium_questions_2.dart';
import '../data/medium_questions_3.dart';
import '../data/medium_questions_4.dart';
import '../data/hard_questions.dart';
import '../data/hard_questions_2.dart';
import 'quiz_page.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade100, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue.shade400, Colors.blue.shade600],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Flutter Exercises',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.widgets_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'After exploring and learning about the Flutter components in the Home page, you can test your knowledge with our interactive quizzes. Each quiz focuses on the specific components you\'ve learned about, helping you reinforce your understanding of Flutter widgets.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      _buildCategorySection(
                        'Basic Level',
                        'Master the fundamentals',
                        Colors.green,
                        [
                          _buildQuizCard(
                            context,
                            easyQuestions,
                            'Basic Quiz 1',
                            'Transform & Container',
                          ),
                          _buildQuizCard(
                            context,
                            easyQuestions2,
                            'Basic Quiz 2',
                            'Layout & Widgets',
                          ),
                          _buildQuizCard(
                            context,
                            easyQuestions3,
                            'Basic Quiz 3',
                            'Navigation & State',
                          ),
                          _buildQuizCard(
                            context,
                            easyQuestions4,
                            'Basic Quiz 4',
                            'UI Components',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildCategorySection(
                        'Advanced Level',
                        'Challenge yourself',
                        Colors.orange,
                        [
                          _buildQuizCard(
                            context,
                            mediumQuestions,
                            'Advanced Quiz 1',
                            'Advanced Layouts',
                          ),
                          _buildQuizCard(
                            context,
                            mediumQuestions2,
                            'Advanced Quiz 2',
                            'Gestures & Animations',
                          ),
                          _buildQuizCard(
                            context,
                            mediumQuestions3,
                            'Advanced Quiz 3',
                            'Complex Widgets',
                          ),
                          _buildQuizCard(
                            context,
                            mediumQuestions4,
                            'Advanced Quiz 4',
                            'Advanced Components',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildCategorySection(
                        'Expert Level',
                        'Push your limits',
                        Colors.red,
                        [
                          _buildQuizCard(
                            context,
                            hardQuestions,
                            'Expert Quiz 1',
                            'Advanced Concepts & Best Practices',
                          ),
                          _buildQuizCard(
                            context,
                            hardQuestions2,
                            'Expert Quiz 2',
                            'Performance & Custom Implementations',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection(
    String title,
    String subtitle,
    Color color,
    List<Widget> quizCards,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 24,
              width: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...quizCards,
      ],
    );
  }

  Widget _buildQuizCard(
    BuildContext context,
    List<QuizQuestion> questions,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        QuizPage(questions: questions, difficulty: title),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.quiz,
                    color: Colors.blue.shade700,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
