import 'package:flutter/material.dart';

class QuizResultMessageWidget extends StatelessWidget {
  final int score;

  const QuizResultMessageWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Text(
      'O quiz acabou.\nVocê fez $score ponto(s)',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    );
  }
}