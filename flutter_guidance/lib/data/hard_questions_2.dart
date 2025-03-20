import '../models/quiz_question.dart';

final List<QuizQuestion> hardQuestions2 = [
  QuizQuestion(
    question: 'What\'s the difference between RepaintBoundary and CustomPaint?',
    options: [
      'They serve the same purpose',
      'RepaintBoundary optimizes painting, CustomPaint enables custom drawing',
      'CustomPaint is more efficient',
      'RepaintBoundary is deprecated',
    ],
    correctAnswerIndex: 1,
    explanation:
        'RepaintBoundary creates a new layer to optimize repainting, while CustomPaint allows custom drawing operations.',
  ),
  QuizQuestion(
    question: 'How do you properly implement custom gesture recognition?',
    options: [
      'Override GestureDetector',
      'Use RawGestureDetector with custom recognizer',
      'Modify Flutter\'s gesture system',
      'Use only built-in gestures',
    ],
    correctAnswerIndex: 1,
    explanation:
        'RawGestureDetector with custom GestureRecognizer allows implementing custom gesture detection logic.',
  ),
  QuizQuestion(
    question: 'What\'s the best way to handle widget tree deep updates?',
    options: [
      'Use setState at root',
      'Implement InheritedWidget',
      'Use Provider/Riverpod with selective rebuilds',
      'Update all widgets manually',
    ],
    correctAnswerIndex: 2,
    explanation:
        'State management solutions like Provider/Riverpod enable efficient selective rebuilds for deep widget trees.',
  ),
  QuizQuestion(
    question: 'How do you optimize heavy computations in Flutter?',
    options: [
      'Use async/await',
      'Implement compute function',
      'Run in main thread',
      'Use BuildContext',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The compute function runs heavy computations in a separate isolate to prevent UI freezes.',
  ),
  QuizQuestion(
    question: 'What\'s the correct approach for custom painting with Canvas?',
    options: [
      'Paint in build method',
      'Use CustomPainter with proper lifecycle',
      'Paint directly on widget',
      'Use Image widget',
    ],
    correctAnswerIndex: 1,
    explanation:
        'CustomPainter with proper shouldRepaint implementation ensures efficient custom painting.',
  ),
  QuizQuestion(
    question: 'How do you handle widget key conflicts?',
    options: [
      'Ignore key warnings',
      'Use unique keys for each widget',
      'Remove all keys',
      'Use same key everywhere',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Each widget requiring a key should have a unique key to prevent conflicts and unexpected behavior.',
  ),
  QuizQuestion(
    question: 'What\'s the impact of excessive rebuilds?',
    options: [
      'No impact on performance',
      'Minor UI glitches',
      'Increased memory and CPU usage',
      'App crashes',
    ],
    correctAnswerIndex: 2,
    explanation:
        'Excessive rebuilds can significantly impact performance by increasing memory and CPU usage.',
  ),
  QuizQuestion(
    question: 'How do you properly implement custom ScrollPhysics?',
    options: [
      'Modify ScrollController',
      'Extend ScrollPhysics and override methods',
      'Use GestureDetector',
      'Implement ScrollDelegate',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Custom scroll physics require extending ScrollPhysics and overriding necessary methods.',
  ),
  QuizQuestion(
    question: 'What\'s the best practice for handling widget disposal?',
    options: [
      'Let garbage collector handle it',
      'Dispose controllers and cancel streams',
      'Keep everything alive',
      'Restart app regularly',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Proper disposal of controllers and cancellation of streams prevents memory leaks.',
  ),
  QuizQuestion(
    question: 'How do you handle complex animations efficiently?',
    options: [
      'Use multiple Timer widgets',
      'Implement custom Ticker',
      'Use AnimationController with multiple Tweens',
      'Use multiple setState calls',
    ],
    correctAnswerIndex: 2,
    explanation:
        'AnimationController with multiple Tweens provides efficient control over complex animations.',
  ),
  QuizQuestion(
    question: 'What\'s the proper way to handle async state updates?',
    options: [
      'Use global variables',
      'Implement proper state management with mounted checks',
      'Ignore async results',
      'Always use setState',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Proper state management with mounted checks prevents updating disposed widgets.',
  ),
  QuizQuestion(
    question: 'How do you optimize image loading in lists?',
    options: [
      'Load all images at once',
      'Use lazy loading with caching',
      'Disable images in lists',
      'Use low-res images',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Lazy loading with proper caching optimizes memory usage and loading performance in lists.',
  ),
];
