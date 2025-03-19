import '../models/quiz_question.dart';

final List<QuizQuestion> easyQuestions = [
  // Transform Widget Questions
  QuizQuestion(
    question: 'What does the Transform widget primarily do in Flutter?',
    options: [
      'Changes the color of widgets',
      'Applies geometric transformations to its child widget',
      'Handles user input events',
      'Creates animations',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The Transform widget applies geometric transformations like rotation, scaling, and translation to its child widget.',
  ),
  QuizQuestion(
    question: 'Which property is used to rotate a Transform widget?',
    options: ['rotate', 'angle', 'transform', 'rotation'],
    correctAnswerIndex: 2,
    explanation:
        'The transform property with Matrix4.rotationZ() is used to rotate a Transform widget.',
  ),
  QuizQuestion(
    question: 'What is the default origin point for Transform rotation?',
    options: [
      'Top-left corner',
      'Center of the widget',
      'Bottom-right corner',
      'Top-right corner',
    ],
    correctAnswerIndex: 1,
    explanation:
        'By default, Transform widget rotates around its center point unless specified otherwise.',
  ),

  // Container Widget Questions
  QuizQuestion(
    question: 'What is the main purpose of a Container widget?',
    options: [
      'Only for holding text',
      'For navigation between screens',
      'A convenience widget that combines painting, positioning, and sizing',
      'For handling user gestures',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Container is a convenience widget that combines common painting, positioning, and sizing widgets.',
  ),
  QuizQuestion(
    question: 'Which property is used to add padding inside a Container?',
    options: ['margin', 'padding', 'inset', 'spacing'],
    correctAnswerIndex: 1,
    explanation:
        'The padding property adds space inside the container, between its edges and its child.',
  ),

  // AnimatedContainer Questions
  QuizQuestion(
    question:
        'What makes AnimatedContainer different from a regular Container?',
    options: [
      'It can only contain images',
      'It automatically animates changes to its properties',
      'It has more decoration options',
      'It uses less memory',
    ],
    correctAnswerIndex: 1,
    explanation:
        'AnimatedContainer automatically animates changes to its properties over a duration that you specify.',
  ),
  QuizQuestion(
    question: 'Which property is required for AnimatedContainer animations?',
    options: ['color', 'curve', 'duration', 'width'],
    correctAnswerIndex: 2,
    explanation:
        'The duration property is required as it specifies how long the animation should take.',
  ),

  // ClipRRect Widget Questions
  QuizQuestion(
    question: 'What does ClipRRect do in Flutter?',
    options: [
      'Clips its child using a rectangle with rounded corners',
      'Creates a rectangular container',
      'Rotates the widget',
      'Adds a border to the widget',
    ],
    correctAnswerIndex: 0,
    explanation:
        'ClipRRect clips its child using a rectangle with rounded corners.',
  ),
  QuizQuestion(
    question: 'Which property determines the corner radius in ClipRRect?',
    options: ['radius', 'borderRadius', 'cornerRadius', 'roundness'],
    correctAnswerIndex: 1,
    explanation:
        'The borderRadius property is used to specify how rounded the corners should be.',
  ),

  // GestureDetector Questions
  QuizQuestion(
    question: 'What is the primary use of GestureDetector?',
    options: [
      'To detect only tap gestures',
      'To detect various user gestures on its child widget',
      'To create animations',
      'To change widget colors',
    ],
    correctAnswerIndex: 1,
    explanation:
        'GestureDetector detects various user gestures like taps, drags, and scales on its child widget.',
  ),
  QuizQuestion(
    question: 'Which gesture is NOT handled by GestureDetector?',
    options: ['onTap', 'onDoubleTap', 'onVoiceCommand', 'onLongPress'],
    correctAnswerIndex: 2,
    explanation:
        'Voice commands are not part of gesture detection. GestureDetector handles touch-based interactions.',
  ),

  // Stack Widget Questions
  QuizQuestion(
    question: 'What does the Stack widget do?',
    options: [
      'Arranges widgets vertically',
      'Arranges widgets horizontally',
      'Positions widgets on top of each other',
      'Creates a scrollable list',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Stack allows you to position widgets on top of each other, layering them in a z-index order.',
  ),
  QuizQuestion(
    question: 'Which property is used to position a widget within a Stack?',
    options: ['position', 'alignment', 'Positioned', 'place'],
    correctAnswerIndex: 2,
    explanation:
        'The Positioned widget is used to position a child within a Stack at a specific location.',
  ),
];
