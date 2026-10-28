
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool answerSubmitted = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which language is used with Flutter?',
      'options': ['Java', 'Dart', 'Python', 'C++'],
      'answer': 'Dart',
    },
    {
      'question': 'Which company developed Flutter?',
      'options': ['Google', 'Microsoft', 'Apple', 'Meta'],
      'answer': 'Google',
    },
    {
      'question': 'Which widget arranges children vertically?',
      'options': ['Row', 'Stack', 'Column', 'Container'],
      'answer': 'Column',
    },
  ];

  void submitAnswer() {
    if (selectedAnswer == null || answerSubmitted) return;

    setState(() {
      answerSubmitted = true;

      if (selectedAnswer == questions[currentQuestionIndex]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (!answerSubmitted) return;

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        answerSubmitted = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final options = currentQuestion['options'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Questions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              minHeight: 6,
              backgroundColor: Colors.deepPurple.shade100,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),

            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              currentQuestion['question'] as String,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            ...options.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedAnswer,
                onChanged: answerSubmitted
                    ? null
                    : (value) {
                  setState(() {
                    selectedAnswer = value;
                  });
                },
              );
            }),

            if (answerSubmitted)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  selectedAnswer == currentQuestion['answer']
                      ? 'Correct answer! 🎉'
                      : 'Incorrect! Correct answer: ${currentQuestion['answer']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedAnswer == currentQuestion['answer']
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),

            const Spacer(),

            ElevatedButton(
              onPressed: selectedAnswer == null || answerSubmitted
                  ? null
                  : submitAnswer,
              child: const Text('Submit Answer'),
            ),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: answerSubmitted ? nextQuestion : null,
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'See Results'
                    : 'Next Question',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                size: 100,
                color: Colors.amber,
              ),
              const SizedBox(height: 24),

              const Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Your score: $score / $totalQuestions',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
