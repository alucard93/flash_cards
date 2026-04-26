import 'package:flutter/material.dart';

class QuizProgressWidget extends StatelessWidget {
  final String progressText;

  const QuizProgressWidget({super.key, required this.progressText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(progressText, style: const TextStyle(fontSize: 18)),
    );
  }
}