import '../models/quiz_question.dart';

final List<QuizQuestion> easyQuestions4 = [
  // ListView Questions
  QuizQuestion(
    question: 'What is the main purpose of ListView?',
    options: [
      'To display a single item',
      'To show a scrollable list of widgets',
      'To create animations',
      'To handle user input',
    ],
    correctAnswerIndex: 1,
    explanation:
        'ListView creates a scrollable list of widgets arranged linearly.',
  ),
  QuizQuestion(
    question: 'Which ListView constructor is best for a small number of items?',
    options: [
      'ListView.builder',
      'ListView.separated',
      'ListView.custom',
      'ListView default constructor',
    ],
    correctAnswerIndex: 3,
    explanation:
        'The default ListView constructor is best for a small, fixed number of items as it builds all children at once.',
  ),

  // GridView Questions
  QuizQuestion(
    question: 'What type of layout does GridView create?',
    options: [
      'Linear layout',
      'Random layout',
      'Grid layout',
      'Circular layout',
    ],
    correctAnswerIndex: 2,
    explanation:
        'GridView arranges items in a 2D array of cells in a scrollable grid.',
  ),
  QuizQuestion(
    question: 'What property determines number of columns in GridView.count?',
    options: ['itemCount', 'crossAxisCount', 'columnCount', 'gridCount'],
    correctAnswerIndex: 1,
    explanation:
        'crossAxisCount determines how many columns appear in a GridView.count.',
  ),

  // MediaQuery Questions
  QuizQuestion(
    question: 'What information can MediaQuery provide?',
    options: [
      'Only screen size',
      'Only device orientation',
      'Various device and platform information',
      'Only text scale factor',
    ],
    correctAnswerIndex: 2,
    explanation:
        'MediaQuery provides various device and platform information including size, orientation, padding, etc.',
  ),
  QuizQuestion(
    question: 'How do you get the screen width using MediaQuery?',
    options: [
      'MediaQuery.width(context)',
      'MediaQuery.of(context).size.width',
      'MediaQuery.screenWidth',
      'MediaQuery.getWidth()',
    ],
    correctAnswerIndex: 1,
    explanation: 'MediaQuery.of(context).size.width returns the screen width.',
  ),

  // InkWell Questions
  QuizQuestion(
    question: 'What is the difference between InkWell and GestureDetector?',
    options: [
      'InkWell only handles taps',
      'InkWell adds splash effect on interaction',
      'InkWell is faster',
      'There is no difference',
    ],
    correctAnswerIndex: 1,
    explanation:
        'InkWell provides a Material Design splash effect when interacted with, while GestureDetector does not.',
  ),
  QuizQuestion(
    question: 'What widget must be an ancestor of InkWell?',
    options: ['Container', 'Material', 'Column', 'Center'],
    correctAnswerIndex: 1,
    explanation:
        'InkWell needs a Material widget ancestor to show its splash effect properly.',
  ),

  // Image Questions
  QuizQuestion(
    question: 'Which widget is used to display network images?',
    options: ['NetworkImage', 'Image.network', 'WebImage', 'URLImage'],
    correctAnswerIndex: 1,
    explanation: 'Image.network widget is used to display images from a URL.',
  ),
  QuizQuestion(
    question: 'What property is used to maintain aspect ratio of an image?',
    options: ['aspectRatio', 'fit', 'scale', 'ratio'],
    correctAnswerIndex: 1,
    explanation:
        'The fit property (BoxFit) controls how the image should be inscribed into its box.',
  ),

  // AlertDialog Questions
  QuizQuestion(
    question: 'How is an AlertDialog typically shown?',
    options: [
      'Using AlertDialog.show()',
      'Using showDialog()',
      'Using Navigator.push()',
      'Using AlertDialog.display()',
    ],
    correctAnswerIndex: 1,
    explanation:
        'AlertDialog is typically shown using the showDialog() function.',
  ),
  QuizQuestion(
    question: 'What happens when tapping outside an AlertDialog by default?',
    options: ['Nothing', 'App closes', 'Dialog closes', 'Screen refreshes'],
    correctAnswerIndex: 2,
    explanation: 'By default, tapping outside an AlertDialog dismisses it.',
  ),
];
