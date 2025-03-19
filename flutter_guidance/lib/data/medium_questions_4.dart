import '../models/quiz_question.dart';

final List<QuizQuestion> mediumQuestions4 = [
  // SingleChildScrollView Advanced
  QuizQuestion(
    question: 'How can you optimize SingleChildScrollView for large content?',
    options: [
      'Use ListView instead',
      'Enable caching with cache property',
      'Wrap children with RepaintBoundary',
      'Use smaller widgets',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Wrapping children with RepaintBoundary can optimize performance by preventing unnecessary repaints of static content.',
  ),
  QuizQuestion(
    question:
        'What\'s the difference between physics and scrollBehavior in SingleChildScrollView?',
    options: [
      'No difference',
      'physics controls bounce effect, scrollBehavior controls drag effect',
      'scrollBehavior is platform-specific, physics is custom behavior',
      'physics is for touch handling, scrollBehavior is for mouse/keyboard',
    ],
    correctAnswerIndex: 3,
    explanation:
        'physics handles touch-based scrolling behavior, while scrollBehavior handles mouse and keyboard scrolling.',
  ),

  // Divider Advanced
  QuizQuestion(
    question: 'How can you create a gradient Divider?',
    options: [
      'Use gradientColor property',
      'Use Container with gradient decoration',
      'Not possible with Divider',
      'Use LinearGradient property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'To create a gradient divider, use a Container with height 1 and gradient decoration instead of the Divider widget.',
  ),
  QuizQuestion(
    question:
        'What\'s the best way to create a vertical divider with custom spacing?',
    options: [
      'Use VerticalDivider with indent property',
      'Rotate Divider by 90 degrees',
      'Use Container with custom width',
      'Use SizedBox with Divider',
    ],
    correctAnswerIndex: 0,
    explanation:
        'VerticalDivider with indent and endIndent properties provides the most flexible way to create custom-spaced vertical dividers.',
  ),

  // CircleAvatar Advanced
  QuizQuestion(
    question: 'How can you handle image loading errors in CircleAvatar?',
    options: [
      'Use onError property',
      'Use errorBuilder with NetworkImage',
      'Wrap with ErrorWidget',
      'Use try-catch block',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Using NetworkImage with errorBuilder allows you to provide a fallback when the image fails to load.',
  ),
  QuizQuestion(
    question:
        'What happens when CircleAvatar child and backgroundImage are both provided?',
    options: [
      'Child is shown on top of background',
      'Background is shown on top of child',
      'Only child is shown',
      'Only background is shown',
    ],
    correctAnswerIndex: 0,
    explanation:
        'When both are provided, the child widget is displayed on top of the backgroundImage.',
  ),

  // Card Advanced
  QuizQuestion(
    question: 'How can you create a dismissible Card?',
    options: [
      'Use dismissible property',
      'Wrap with Dismissible widget',
      'Use GestureDetector',
      'Use slideable property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Wrapping a Card with Dismissible widget enables swipe-to-dismiss functionality.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to handle Card tap animations?',
    options: [
      'Use onTap property',
      'Use AnimatedContainer as child',
      'Wrap with InkWell',
      'Use GestureDetector',
    ],
    correctAnswerIndex: 2,
    explanation:
        'InkWell provides Material Design splash effects and handles tap animations seamlessly with Cards.',
  ),

  // Text Advanced
  QuizQuestion(
    question: 'How can you create a gradient text effect?',
    options: [
      'Use gradientText property',
      'Use ShaderMask with gradient',
      'Use TextStyle with gradient',
      'Use LinearGradient directly',
    ],
    correctAnswerIndex: 1,
    explanation:
        'ShaderMask with a gradient can be used to create text with gradient colors.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to handle text overflow in multiple lines?',
    options: [
      'Use overflow property',
      'Use maxLines with ellipsis',
      'Use Expanded widget',
      'Use Flexible widget',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Combining maxLines with TextOverflow.ellipsis provides the best control over multi-line text overflow.',
  ),

  // Icon Advanced
  QuizQuestion(
    question: 'How can you create an animated icon transition?',
    options: [
      'Use IconTransition',
      'Use AnimatedIcon',
      'Use IconAnimation',
      'Use animated property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'AnimatedIcon widget provides built-in support for morphing animations between different icon states.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to create a custom-colored icon set?',
    options: [
      'Use IconTheme',
      'Set color property individually',
      'Use Theme.of(context)',
      'Use ColorFiltered widget',
    ],
    correctAnswerIndex: 0,
    explanation:
        'IconTheme widget allows you to set default colors for all icons in its subtree efficiently.',
  ),
];
