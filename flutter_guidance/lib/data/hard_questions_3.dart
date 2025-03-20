import '../models/quiz_question.dart';

final List<QuizQuestion> hardQuestions3 = [
  QuizQuestion(
    question: 'How do you implement custom shader effects in Flutter?',
    options: [
      'Use ShaderMask widget',
      'Use FragmentShader with CustomPainter',
      'Both A and B are correct',
      'Use ColorFilter only',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Both ShaderMask widget and FragmentShader with CustomPainter can be used to create custom shader effects, depending on the use case.',
  ),
  QuizQuestion(
    question:
        'What\'s the best way to implement complex shared element transitions?',
    options: [
      'Use Hero widget with custom flight shuttle builder',
      'Manually animate with Transform',
      'Use PageRouteBuilder only',
      'Use Navigator.push',
    ],
    correctAnswerIndex: 0,
    explanation:
        'Hero widget with custom flightShuttleBuilder provides the most flexible way to implement complex shared element transitions.',
  ),
  QuizQuestion(
    question: 'How do you optimize Flutter app startup time?',
    options: [
      'Reduce app size only',
      'Use deferred components and optimize asset loading',
      'Increase compile time',
      'Remove all animations',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Using deferred components and optimizing asset loading helps reduce initial bundle size and improve startup performance.',
  ),
  QuizQuestion(
    question: 'What\'s the correct way to implement custom mouse cursors?',
    options: [
      'Use SystemMouseCursors only',
      'Implement MouseRegion with custom cursor',
      'Override default cursor',
      'Mouse cursors cannot be customized',
    ],
    correctAnswerIndex: 1,
    explanation:
        'MouseRegion widget with custom cursor definitions allows for proper cursor management based on interaction states.',
  ),
  QuizQuestion(
    question: 'How do you handle deep linking with complex navigation?',
    options: [
      'Use basic URL handling',
      'Implement custom RouteInformationParser and RouterDelegate',
      'Use only Navigator 1.0',
      'Deep linking isn\'t possible with complex navigation',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Custom RouteInformationParser and RouterDelegate provide complete control over deep linking in complex navigation scenarios.',
  ),
  QuizQuestion(
    question:
        'What\'s the best practice for implementing custom clipper paths?',
    options: [
      'Use basic shapes only',
      'Cache path calculations and implement shouldReclip',
      'Recalculate path every frame',
      'Avoid custom clippers',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Caching path calculations and properly implementing shouldReclip ensures efficient custom shape rendering.',
  ),
  QuizQuestion(
    question: 'How do you implement custom keyboard shortcuts?',
    options: [
      'Use RawKeyboardListener only',
      'Implement Shortcuts and Actions widgets with custom intents',
      'Handle in build method',
      'Keyboard shortcuts aren\'t supported',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Shortcuts and Actions widgets with custom intents provide a maintainable way to handle keyboard shortcuts.',
  ),
  QuizQuestion(
    question: 'What\'s the proper way to handle platform-specific code?',
    options: [
      'Use if-else statements',
      'Implement MethodChannel with platform-specific implementations',
      'Ignore platform differences',
      'Create separate apps',
    ],
    correctAnswerIndex: 1,
    explanation:
        'MethodChannel with proper platform-specific implementations allows clean integration of native functionality.',
  ),
  QuizQuestion(
    question: 'How do you implement custom text selection controls?',
    options: [
      'Override TextSelectionControls',
      'Use basic TextSelection',
      'Disable text selection',
      'Not possible to customize',
    ],
    correctAnswerIndex: 0,
    explanation:
        'Overriding TextSelectionControls allows customization of text selection handles and toolbar.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to handle complex form validation?',
    options: [
      'Use simple if statements',
      'Implement FormField with custom validation logic',
      'Avoid validation',
      'Use only built-in validators',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Custom FormField implementations with validation logic provide flexible and maintainable form validation.',
  ),
  QuizQuestion(
    question: 'How do you implement custom scroll physics with bounce effects?',
    options: [
      'Use built-in physics only',
      'Extend BouncingScrollPhysics and override methods',
      'Disable scroll physics',
      'Use basic ScrollController',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Extending BouncingScrollPhysics and overriding specific methods allows custom bounce effects while maintaining natural scrolling.',
  ),
  QuizQuestion(
    question: 'What\'s the correct way to implement custom hit testing?',
    options: [
      'Use GestureDetector only',
      'Implement custom RenderBox with hitTest method',
      'Avoid hit testing',
      'Use basic touch handling',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Implementing custom RenderBox with hitTest method provides precise control over hit testing behavior.',
  ),
];
