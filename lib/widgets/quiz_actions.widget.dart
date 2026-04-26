import 'package:flutter/material.dart';

class QuizActionsWidget extends StatelessWidget {
  final VoidCallback onCorrect;
  final VoidCallback onWrong;

  const QuizActionsWidget({
    super.key,
    required this.onCorrect,
    required this.onWrong,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 48,
          child: ElevatedButton(
            key: const Key('btnAcertei'),
            onPressed: onCorrect,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Acertei :)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            key: const Key('btnErrei'),
            onPressed: onWrong,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'Errei :(',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
