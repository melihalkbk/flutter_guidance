import '../models/quiz_question.dart';

final List<QuizQuestion> easyQuestions2 = [
  // Scaffold Widget Questions
  QuizQuestion(
    question: 'What is the main purpose of the Scaffold widget?',
    options: [
      'To create scrollable lists',
      'To implement material design visual layout structure',
      'To handle user input',
      'To display images',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Scaffold implements the basic material design visual layout structure, providing features like AppBar, Drawer, BottomNavigationBar, etc.',
  ),
  QuizQuestion(
    question: 'Which property of Scaffold is used to add a top app bar?',
    options: ['topBar', 'header', 'appBar', 'navigationBar'],
    correctAnswerIndex: 2,
    explanation:
        'The appBar property is used to add an AppBar widget at the top of the Scaffold.',
  ),

  // Column and Row Questions
  QuizQuestion(
    question: 'What is the main difference between Row and Column widgets?',
    options: [
      'Row is faster than Column',
      'Column arranges children horizontally, Row vertically',
      'Row arranges children horizontally, Column vertically',
      'There is no difference',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Row arranges its children in a horizontal line, while Column arranges them in a vertical line.',
  ),
  QuizQuestion(
    question: 'Which property is used to align children in a Row or Column?',
    options: ['mainAxisAlignment', 'alignment', 'position', 'arrange'],
    correctAnswerIndex: 0,
    explanation:
        'mainAxisAlignment determines how children are positioned along the main axis (horizontal for Row, vertical for Column).',
  ),

  // Center Widget Questions
  QuizQuestion(
    question: 'What does the Center widget do?',
    options: [
      'Makes text bold',
      'Centers its child within itself',
      'Creates a circular shape',
      'Adds padding around widgets',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The Center widget centers its child within itself, both horizontally and vertically.',
  ),
  QuizQuestion(
    question: 'Can Center widget have multiple children?',
    options: [
      'Yes, unlimited children',
      'Yes, up to 3 children',
      'No, only one child',
      'Yes, if wrapped in Row',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Center widget can only have one child. To center multiple widgets, wrap them in a container or layout widget first.',
  ),

  // Padding Widget Questions
  QuizQuestion(
    question: 'What is the purpose of the Padding widget?',
    options: [
      'To add space around its child',
      'To add color to widgets',
      'To create borders',
      'To align widgets',
    ],
    correctAnswerIndex: 0,
    explanation:
        'Padding widget adds empty space (padding) around its child widget.',
  ),
  QuizQuestion(
    question: 'Which property is required for a Padding widget?',
    options: ['color', 'padding', 'margin', 'space'],
    correctAnswerIndex: 1,
    explanation:
        'The padding property is required to specify how much space to add around the child.',
  ),

  // SizedBox Widget Questions
  QuizQuestion(
    question: 'What is the main use of SizedBox?',
    options: [
      'To create animations',
      'To specify exact dimensions',
      'To handle user input',
      'To add color to widgets',
    ],
    correctAnswerIndex: 1,
    explanation:
        'SizedBox is used to give its child specific width and/or height, or to create empty space with specific dimensions.',
  ),
  QuizQuestion(
    question: 'What happens if you use SizedBox without any dimensions?',
    options: [
      'It takes all available space',
      'It takes no space',
      'It causes an error',
      'It uses default dimensions',
    ],
    correctAnswerIndex: 1,
    explanation:
        'A SizedBox without width or height specifications takes up no space unless it has a child.',
  ),

  // Expanded Widget Questions
  QuizQuestion(
    question: 'In what context is Expanded widget typically used?',
    options: [
      'Inside Center widget',
      'Inside Row or Column',
      'Inside Container only',
      'Inside Stack widget',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Expanded is typically used inside Row or Column to make its child fill the available space.',
  ),
  QuizQuestion(
    question: 'What does the flex property do in Expanded?',
    options: [
      'Adds flexibility to widget movement',
      'Determines how much space child gets relative to other Expanded widgets',
      'Controls animation speed',
      'Sets widget opacity',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The flex property determines how much space the Expanded widget\'s child gets compared to other Expanded widgets.',
  ),
];
