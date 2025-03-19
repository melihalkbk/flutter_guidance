import '../models/quiz_question.dart';

final List<QuizQuestion> mediumQuestions = [
  // Advanced Transform Questions
  QuizQuestion(
    question:
        'Which Matrix4 method would you use to apply both rotation and scaling together?',
    options: [
      'Matrix4.combined()',
      'Matrix4.rotateAndScale()',
      'Matrix4.diagonal3Values()',
      'Matrix4.compose()',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Matrix4.diagonal3Values() allows you to specify scaling factors for x, y, and z axes while maintaining rotation.',
  ),
  QuizQuestion(
    question:
        'How can you maintain the original position of a widget while applying Transform?',
    options: [
      'Use Transform.translate after transformation',
      'Set origin parameter to widget center',
      'Use Alignment.center',
      'Apply reverse translation after transformation',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Setting the origin parameter to the widget\'s center point helps maintain its position during transformation.',
  ),

  // Layout Constraints Questions
  QuizQuestion(
    question:
        'What happens when a child widget is larger than its parent\'s constraints?',
    options: [
      'Child automatically shrinks',
      'Parent expands',
      'Overflow error occurs',
      'Child gets clipped',
    ],
    correctAnswerIndex: 2,
    explanation:
        'When a child exceeds its parent\'s constraints, Flutter throws an overflow error in debug mode.',
  ),
  QuizQuestion(
    question:
        'How can you make a widget take exactly half of its parent\'s width?',
    options: [
      'width: 50%',
      'width: parent.width / 2',
      'FractionalBox(widthFactor: 0.5)',
      'LayoutBuilder with BoxConstraints',
    ],
    correctAnswerIndex: 2,
    explanation:
        'FractionalBox with widthFactor: 0.5 makes the child take exactly half of the available width.',
  ),

  // Custom Paint Questions
  QuizQuestion(
    question: 'Which method is called first in a CustomPainter?',
    options: ['paint()', 'shouldRepaint()', 'build()', 'draw()'],
    correctAnswerIndex: 0,
    explanation:
        'The paint() method is called first when a CustomPainter begins drawing.',
  ),
  QuizQuestion(
    question: 'How do you optimize CustomPainter performance?',
    options: [
      'Use smaller canvas size',
      'Implement shouldRepaint() correctly',
      'Use less colors',
      'Reduce opacity',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Properly implementing shouldRepaint() helps avoid unnecessary repaints and improves performance.',
  ),

  // Animation Controller Questions
  QuizQuestion(
    question: 'What is the purpose of vsync in AnimationController?',
    options: [
      'Control animation speed',
      'Sync with frame rendering',
      'Manage animation state',
      'Handle user input',
    ],
    correctAnswerIndex: 1,
    explanation:
        'vsync synchronizes the animation with the device\'s screen refresh rate for smooth animations.',
  ),
  QuizQuestion(
    question: 'How do you reverse an AnimationController?',
    options: [
      'controller.reverse()',
      'controller.direction = reverse',
      'controller.value = 0',
      'controller.reset(reverse: true)',
    ],
    correctAnswerIndex: 0,
    explanation:
        'controller.reverse() plays the animation backwards from its current position.',
  ),

  // State Management Questions
  QuizQuestion(
    question: 'When should you use GlobalKey to access widget state?',
    options: [
      'Always',
      'Never',
      'Only when other methods aren\'t possible',
      'For every StatefulWidget',
    ],
    correctAnswerIndex: 2,
    explanation:
        'GlobalKey should be used sparingly, only when other state management solutions aren\'t feasible.',
  ),
  QuizQuestion(
    question: 'What happens to widget state when its key changes?',
    options: [
      'State is preserved',
      'State is reset',
      'Widget rebuilds with old state',
      'App crashes',
    ],
    correctAnswerIndex: 1,
    explanation:
        'When a widget\'s key changes, Flutter treats it as a new widget and creates new state.',
  ),

  // BuildContext Questions
  QuizQuestion(
    question: 'What information does BuildContext contain?',
    options: [
      'Only widget location',
      'Only widget type',
      'Widget\'s position in the tree and its ancestors',
      'Only widget size',
    ],
    correctAnswerIndex: 2,
    explanation:
        'BuildContext contains information about the widget\'s position in the widget tree and access to its ancestors.',
  ),
  QuizQuestion(
    question: 'When might BuildContext be invalid?',
    options: [
      'Never',
      'After widget disposal',
      'During build',
      'Before initState',
    ],
    correctAnswerIndex: 1,
    explanation:
        'BuildContext becomes invalid after the widget is disposed, leading to errors if used.',
  ),
];
