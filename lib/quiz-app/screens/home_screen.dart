
import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.psychology_alt_rounded,
                  size: 100,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Test Your Knowledge!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Challenge yourself with fun questions.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Start Quiz button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                  child: const Text('Start Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
