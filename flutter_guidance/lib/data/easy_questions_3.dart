import '../models/quiz_question.dart';

final List<QuizQuestion> easyQuestions3 = [
  // SingleChildScrollView Questions
  QuizQuestion(
    question: 'What is the main purpose of SingleChildScrollView?',
    options: [
      'To display multiple images',
      'To make content scrollable when it exceeds screen size',
      'To create animations',
      'To handle user input',
    ],
    correctAnswerIndex: 1,
    explanation:
        'SingleChildScrollView makes its content scrollable when it exceeds the available space.',
  ),
  QuizQuestion(
    question:
        'Which scroll direction is the default for SingleChildScrollView?',
    options: [
      'Horizontal',
      'Vertical',
      'Both directions',
      'No default direction',
    ],
    correctAnswerIndex: 1,
    explanation:
        'SingleChildScrollView scrolls vertically by default unless specified otherwise.',
  ),

  // Divider Widget Questions
  QuizQuestion(
    question: 'What does the Divider widget create?',
    options: [
      'A vertical line',
      'A horizontal line',
      'A space between widgets',
      'A border around widgets',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Divider creates a horizontal line with configurable thickness and color.',
  ),
  QuizQuestion(
    question: 'Which property controls the thickness of a Divider?',
    options: ['width', 'height', 'thickness', 'size'],
    correctAnswerIndex: 2,
    explanation:
        'The thickness property determines how thick the divider line appears.',
  ),

  // CircleAvatar Questions
  QuizQuestion(
    question: 'What shape does CircleAvatar create?',
    options: ['Square', 'Circle', 'Rectangle', 'Triangle'],
    correctAnswerIndex: 1,
    explanation:
        'CircleAvatar creates a circular widget often used for profile pictures or icons.',
  ),
  QuizQuestion(
    question: 'Which property sets the size of a CircleAvatar?',
    options: ['size', 'radius', 'diameter', 'width'],
    correctAnswerIndex: 1,
    explanation: 'The radius property determines the size of the CircleAvatar.',
  ),

  // Card Widget Questions
  QuizQuestion(
    question: 'What is the default appearance of a Card widget?',
    options: [
      'Rounded corners with elevation',
      'Sharp corners without elevation',
      'Circular shape',
      'No visual styling',
    ],
    correctAnswerIndex: 0,
    explanation:
        'Card widget by default has rounded corners and a slight elevation shadow.',
  ),
  QuizQuestion(
    question: 'Which property is used to add space inside a Card?',
    options: ['margin', 'padding', 'insets', 'spacing'],
    correctAnswerIndex: 0,
    explanation:
        'The margin property adds space around the outside of the Card.',
  ),

  // Text Widget Questions
  QuizQuestion(
    question: 'How can you make Text wrap to multiple lines?',
    options: [
      'Using wrap property',
      'Using softWrap property',
      'Using multiline property',
      'Using newLine property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The softWrap property allows text to wrap to multiple lines when true.',
  ),
  QuizQuestion(
    question: 'Which property controls text alignment?',
    options: ['position', 'alignment', 'textAlign', 'direction'],
    correctAnswerIndex: 2,
    explanation:
        'The textAlign property controls how text is aligned within its parent widget.',
  ),

  // Icon Widget Questions
  QuizQuestion(
    question: 'What package provides the default icons in Flutter?',
    options: ['material_icons', 'flutter_icons', 'material', 'icon_pack'],
    correctAnswerIndex: 2,
    explanation:
        'The material package provides the default set of Material Design icons.',
  ),
  QuizQuestion(
    question: 'Which property changes the size of an Icon?',
    options: ['size', 'scale', 'dimension', 'iconSize'],
    correctAnswerIndex: 0,
    explanation:
        'The size property determines the dimensions of the Icon widget.',
  ),
];
