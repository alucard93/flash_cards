import 'package:flash_cards/pages/quiz_result/quiz_result_page.dart';
import 'package:flash_cards/stores/quiz/quiz.store.dart';
import 'package:flash_cards/widgets/quiz_actions.widget.dart';
import 'package:flash_cards/widgets/quiz_answer.widget.dart';
import 'package:flash_cards/widgets/quiz_progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuizPage extends StatelessWidget {
  final QuizStore store;

  const QuizPage({super.key, required this.store});

  void _goToResult(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultPage(
          deckName: store.deckName,
          score: store.score,
          total: store.totalQuestions,
        ),
      ),
    );
  }

  void _answer(BuildContext context, {required bool correct}) {
    if (correct) {
      store.answerCorrect();
    } else {
      store.answerWrong();
    }

    if (store.finished) {
      _goToResult(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final currentCard = store.currentCard;

        if (!store.hasCards || currentCard == null) {
          return const Scaffold(
            body: Center(child: Text('Sem cartoes para o quiz')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Quiz: ${store.deckName}',
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuizProgressWidget(progressText: store.progressText),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 48),
                          Text(
                            currentCard.front,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          QuizAnswerWidget(
                            showAnswer: store.showAnswer,
                            answer: currentCard.back,
                            onReveal: store.revealAnswer,
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  QuizActionsWidget(
                    onCorrect: () => _answer(context, correct: true),
                    onWrong: () => _answer(context, correct: false),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
