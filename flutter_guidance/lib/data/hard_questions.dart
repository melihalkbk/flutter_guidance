import '../models/quiz_question.dart';

final List<QuizQuestion> hardQuestions = [
  // State Management
  QuizQuestion(
    question:
        'What\'s the difference between ValueListenableBuilder and StreamBuilder?',
    options: [
      'ValueListenableBuilder is synchronous, StreamBuilder is asynchronous',
      'StreamBuilder can handle multiple values, ValueListenableBuilder only one',
      'ValueListenableBuilder is more performant for single value changes',
      'All of the above',
    ],
    correctAnswerIndex: 3,
    explanation:
        'All statements are correct. ValueListenableBuilder is synchronous and optimized for single value changes, while StreamBuilder handles asynchronous streams of multiple values.',
  ),

  // Custom Rendering
  QuizQuestion(
    question:
        'When implementing a CustomPainter, what\'s the correct order of operations?',
    options: [
      'clipPath, drawPath, save, restore',
      'save, clipPath, drawPath, restore',
      'drawPath, save, clipPath, restore',
      'save, restore, clipPath, drawPath',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The correct order is: save (save current state), clipPath (apply clipping), drawPath (draw content), restore (restore to previous state).',
  ),

  // Widget Lifecycle
  QuizQuestion(
    question: 'What happens when you call setState() in didUpdateWidget?',
    options: [
      'Nothing unusual, it\'s a common pattern',
      'Potential infinite loop',
      'Build method won\'t be called',
      'Widget will be disposed',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Calling setState in didUpdateWidget can cause an infinite loop as didUpdateWidget is called when the widget updates, potentially triggering another update.',
  ),

  // Keys
  QuizQuestion(
    question:
        'When using GlobalKey<FormState>, what happens if multiple Forms use the same key?',
    options: [
      'Both forms work independently',
      'Only the first form works',
      'Runtime exception occurs',
      'Latest form overrides previous',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Using the same GlobalKey for multiple widgets causes a runtime exception as GlobalKeys must be unique across the entire widget tree.',
  ),

  // Performance
  QuizQuestion(
    question: 'What\'s the impact of using too many RepaintBoundary widgets?',
    options: [
      'No impact, they\'re always beneficial',
      'Increased memory usage',
      'Decreased touch responsiveness',
      'Both B and C',
    ],
    correctAnswerIndex: 3,
    explanation:
        'Excessive RepaintBoundary usage increases memory usage by creating separate layers and can affect touch responsiveness due to layer complexity.',
  ),

  // Platform Channels
  QuizQuestion(
    question: 'What\'s the best practice for handling platform channel errors?',
    options: [
      'Global try-catch block',
      'Ignore errors as they\'re rare',
      'Try-catch with PlatformException handling',
      'Let the app crash and restart',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Platform channel calls should be wrapped in try-catch blocks specifically handling PlatformException to manage platform-specific errors gracefully.',
  ),

  // Inheritance
  QuizQuestion(
    question:
        'What\'s the difference between InheritedWidget and InheritedModel?',
    options: [
      'No difference',
      'InheritedModel allows partial updates',
      'InheritedWidget is more performant',
      'InheritedModel is deprecated',
    ],
    correctAnswerIndex: 1,
    explanation:
        'InheritedModel extends InheritedWidget to allow more granular rebuild control by specifying which aspects of the inherited data have changed.',
  ),

  // Gestures
  QuizQuestion(
    question:
        'How do you handle competing gesture detectors in nested widgets?',
    options: [
      'They automatically work together',
      'Use gesture arena with custom behavior',
      'Only outer gesture detector works',
      'Only inner gesture detector works',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Flutter\'s gesture arena system allows you to customize how competing gesture detectors interact by setting behavior and handling callbacks appropriately.',
  ),

  // Layout
  QuizQuestion(
    question: 'What causes layout overflow in CustomMultiChildLayout?',
    options: [
      'Too many children',
      'Incorrect delegate implementation',
      'Missing performLayout override',
      'All of the above',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Layout overflow in CustomMultiChildLayout typically occurs when the delegate doesn\'t properly position and size children within available constraints.',
  ),

  // Animations
  QuizQuestion(
    question:
        'What\'s the difference between Interval and Curve in animations?',
    options: [
      'They\'re the same thing',
      'Interval controls timing, Curve controls progress',
      'Curve controls timing, Interval controls progress',
      'Neither affects animation timing',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Interval determines when an animation occurs within a timeline (timing), while Curve determines how the animation progresses between values.',
  ),

  // BuildContext
  QuizQuestion(
    question: 'Why might BuildContext.mounted be false?',
    options: [
      'Widget is loading',
      'State object is disposed',
      'Build is in progress',
      'Widget is invisible',
    ],
    correctAnswerIndex: 1,
    explanation:
        'BuildContext.mounted becomes false when the State object is disposed, typically when the widget is permanently removed from the tree.',
  ),

  // Memory Management
  QuizQuestion(
    question: 'What\'s the best way to handle large image caching?',
    options: [
      'Always use NetworkImage',
      'Implement custom ImageProvider',
      'Use CachedNetworkImage with maxNrOfCacheObjects',
      'Disable caching completely',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Using CachedNetworkImage with maxNrOfCacheObjects allows control over memory usage while maintaining performance benefits of caching.',
  ),
];
