import 'package:flutter/material.dart';

class QuizAnswerWidget extends StatelessWidget {
  final bool showAnswer;
  final String answer;
  final VoidCallback onReveal;

  const QuizAnswerWidget({
    super.key,
    required this.showAnswer,
    required this.answer,
    required this.onReveal,
  });

  @override
  Widget build(BuildContext context) {
    if (showAnswer) {
      return Text(
        answer,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, color: Colors.black87),
      );
    }

    return TextButton(
      onPressed: onReveal,
      child: const Text(
        'Visualizar resposta',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}