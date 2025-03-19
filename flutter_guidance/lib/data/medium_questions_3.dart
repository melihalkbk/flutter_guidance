import '../models/quiz_question.dart';

final List<QuizQuestion> mediumQuestions3 = [
  // Advanced Container Usage
  QuizQuestion(
    question: 'How can you create a gradient border for a Container?',
    options: [
      'Using gradientBorder property',
      'Using BoxDecoration with gradient and border properties',
      'Using ShaderMask with a Container',
      'Using CustomPainter with Container',
    ],
    correctAnswerIndex: 2,
    explanation:
        'ShaderMask widget can be used with a Container to create gradient borders by applying a gradient shader.',
  ),
  QuizQuestion(
    question:
        'What happens when both decoration and color properties are used in Container?',
    options: [
      'Color overrides decoration',
      'Decoration overrides color',
      'They combine together',
      'Throws an error',
    ],
    correctAnswerIndex: 3,
    explanation:
        'Using both decoration and color properties in a Container will throw an error. Color should be defined within decoration.',
  ),

  // Advanced Transform Usage
  QuizQuestion(
    question: 'How can you apply multiple transformations in a specific order?',
    options: [
      'Using Transform.combine()',
      'Nesting multiple Transform widgets',
      'Using Matrix4.compose()',
      'Using Transform.sequence()',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Nesting Transform widgets allows you to apply transformations in a specific order, from innermost to outermost.',
  ),
  QuizQuestion(
    question:
        'What\'s the difference between Transform and Transform.translate?',
    options: [
      'No difference',
      'Transform.translate is more efficient for translations',
      'Transform supports only translation',
      'Transform.translate affects layout, Transform doesn\'t',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Transform.translate is optimized for translations and can be more efficient than using a general Transform widget.',
  ),

  // Advanced AnimatedContainer
  QuizQuestion(
    question: 'How can you customize the animation curve in AnimatedContainer?',
    options: [
      'Using animationCurve property',
      'Using curve property',
      'Using customCurve property',
      'Using transition property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The curve property in AnimatedContainer allows you to specify different animation curves like ease-in, ease-out, etc.',
  ),
  QuizQuestion(
    question:
        'What happens if you change multiple properties of AnimatedContainer simultaneously?',
    options: [
      'Only the first property animates',
      'Properties animate one after another',
      'All properties animate together',
      'Animation fails',
    ],
    correctAnswerIndex: 2,
    explanation:
        'When multiple properties change, AnimatedContainer animates all of them simultaneously over the specified duration.',
  ),

  // ClipRRect Advanced
  QuizQuestion(
    question:
        'How can you create different corner radii for each corner in ClipRRect?',
    options: [
      'Using cornerRadius property',
      'Using BorderRadius.only()',
      'Using customRadius property',
      'Not possible with ClipRRect',
    ],
    correctAnswerIndex: 1,
    explanation:
        'BorderRadius.only() allows you to specify different radii for each corner in ClipRRect.',
  ),
  QuizQuestion(
    question: 'What\'s the performance impact of using ClipRRect?',
    options: [
      'No impact',
      'Minor impact due to clipping operations',
      'Major impact on all devices',
      'Only impacts old devices',
    ],
    correctAnswerIndex: 1,
    explanation:
        'ClipRRect has a minor performance impact because it requires additional clipping operations during rendering.',
  ),

  // GestureDetector Advanced
  QuizQuestion(
    question:
        'How can you prevent gesture conflicts in nested GestureDetectors?',
    options: [
      'Using preventConflicts property',
      'Using behavior property',
      'Not possible to prevent',
      'Using exclusive property',
    ],
    correctAnswerIndex: 1,
    explanation:
        'The behavior property in GestureDetector can be used to control how gestures are handled in nested scenarios.',
  ),
  QuizQuestion(
    question: 'What\'s the difference between onTapDown and onTapUp?',
    options: [
      'No difference',
      'onTapDown triggers first, onTapUp triggers when finger is lifted',
      'onTapUp triggers first, onTapDown triggers when finger is lifted',
      'They trigger simultaneously',
    ],
    correctAnswerIndex: 1,
    explanation:
        'onTapDown triggers when the finger touches the screen, onTapUp triggers when the finger is lifted off the screen.',
  ),

  // Stack Advanced
  QuizQuestion(
    question: 'How can you make a widget in Stack ignore pointer events?',
    options: [
      'Using ignore property',
      'Using IgnorePointer widget',
      'Using pointer: none',
      'Using Stack.nonInteractive',
    ],
    correctAnswerIndex: 1,
    explanation:
        'Wrap the widget with IgnorePointer to make it ignore all pointer events while still being visible.',
  ),
  QuizQuestion(
    question: 'What happens to a Positioned widget if Stack size changes?',
    options: [
      'Maintains absolute position',
      'Scales proportionally',
      'Repositions based on constraints',
      'Becomes invisible',
    ],
    correctAnswerIndex: 2,
    explanation:
        'A Positioned widget recalculates its position based on the Stack\'s new constraints when the Stack size changes.',
  ),
];
