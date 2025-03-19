import '../models/quiz_question.dart';

final List<QuizQuestion> mediumQuestions2 = [
  // Advanced Gesture Detection
  QuizQuestion(
    question:
        'How can you detect a specific drag direction in GestureDetector?',
    options: [
      'Using dragDirection property',
      'Using onVerticalDragUpdate or onHorizontalDragUpdate',
      'Using dragAxis property',
      'Using directionFilter property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'onVerticalDragUpdate and onHorizontalDragUpdate callbacks allow you to handle specific drag directions.',
  ),
  QuizQuestion(
    question: 'What\'s the difference between onPanUpdate and onDragUpdate?',
    options: [
      'No difference',
      'onPanUpdate handles multi-touch, onDragUpdate single-touch',
      'onPanUpdate handles all directions, onDragUpdate is direction-specific',
      'onPanUpdate is faster than onDragUpdate',
    ],
    correctAnswerIndex: 2,
    explanation:
        'onPanUpdate handles movement in any direction, while onDragUpdate is specific to vertical or horizontal movement.',
  ),

  // Theme and Styling
  QuizQuestion(
    question:
        'How do you override a specific theme color for a widget subtree?',
    options: [
      'Using ColorScheme directly',
      'Using Theme.of(context).copyWith()',
      'Using Theme(data: ..., child: ...)',
      'Changing MaterialApp theme',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Theme widget allows you to override theme data for a specific widget subtree without affecting the rest of the app.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to access theme data in a widget?',
    options: [
      'GlobalKey<ThemeState>',
      'Theme.of(context)',
      'MaterialApp.theme',
      'BuildContext.theme',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Theme.of(context) is the recommended way to access theme data as it maintains the widget tree hierarchy.',
  ),

  // Navigator and Routing
  QuizQuestion(
    question:
        'What\'s the difference between pushReplacement and pushAndRemoveUntil?',
    options: [
      'No difference',
      'pushReplacement removes one route, pushAndRemoveUntil can remove multiple',
      'pushReplacement is faster',
      'pushAndRemoveUntil only works with named routes',
    ],
    correctAnswerIndex: 1,
    explanation:
        'pushReplacement replaces the current route, while pushAndRemoveUntil can remove multiple routes based on a predicate.',
  ),
  QuizQuestion(
    question: 'How do you pass data back when popping a route?',
    options: [
      'Using Navigator.pop(data)',
      'Using return statement',
      'Using Navigator.pushResult()',
      'Using a global variable',
    ],
    correctAnswerIndex: 0,
    explanation:
        'Navigator.pop() can take an optional argument that will be returned to the previous route.',
  ),

  // Layout Constraints
  QuizQuestion(
    question: 'What happens when you wrap a widget with LayoutBuilder?',
    options: [
      'Widget becomes scrollable',
      'Widget gets parent\'s constraints',
      'Widget size becomes fixed',
      'Widget becomes responsive',
    ],
    correctAnswerIndex: 1,
    explanation:
        'LayoutBuilder provides the parent\'s constraints to its child builder function.',
  ),
  QuizQuestion(
    question: 'How can you force a widget to ignore its parent\'s constraints?',
    options: [
      'Using IgnoreConstraints widget',
      'Using UnconstrainedBox',
      'Using SizedBox.shrink()',
      'Using Expanded widget',
    ],
    correctAnswerIndex: 1,
    explanation:
        'UnconstrainedBox allows its child to render without regard to the parent\'s constraints.',
  ),

  // Inherited Widget
  QuizQuestion(
    question: 'When should you use InheritedWidget over Provider?',
    options: [
      'Always',
      'Never',
      'For simple data sharing without state management',
      'For complex state management',
    ],
    correctAnswerIndex: 2,
    explanation:
        'InheritedWidget is good for simple data sharing down the widget tree without need for state management.',
  ),
  QuizQuestion(
    question: 'What method must be implemented in InheritedWidget?',
    options: [
      'build()',
      'createState()',
      'updateShouldNotify()',
      'didChangeDependencies()',
    ],
    correctAnswerIndex: 2,
    explanation:
        'updateShouldNotify() determines whether dependent widgets should rebuild when the inherited widget updates.',
  ),

  // Async UI Updates
  QuizQuestion(
    question: 'What\'s the best practice for showing loading states?',
    options: [
      'Using sleep()',
      'Using FutureBuilder',
      'Using Timer',
      'Using setState directly',
    ],
    correctAnswerIndex: 1,
    explanation:
        'FutureBuilder handles the async operation states (loading, error, data) in a clean and efficient way.',
  ),
  QuizQuestion(
    question: 'How do you handle errors in StreamBuilder?',
    options: [
      'Using try-catch',
      'Using onError callback',
      'In the builder\'s snapshot.error',
      'Using errorHandler property',
    ],
    correctAnswerIndex: 2,
    explanation:
        'StreamBuilder\'s builder provides an AsyncSnapshot that contains error information when available.',
  ),
];
