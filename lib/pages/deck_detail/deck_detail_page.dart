import 'package:flash_cards/models/decks/deck.model.dart';
import 'package:flash_cards/pages/new_card/new_card_page.dart';
import 'package:flash_cards/pages/quiz/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/stores/flash_cards/flash_cards.store.dart';
import 'package:flash_cards/stores/quiz/quiz.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DeckDetailPage extends StatelessWidget {
  final Deck deck;
  final flashCardStore = GetIt.I.get<FlashCardStore>();

  DeckDetailPage({super.key, required this.deck}) {
    GetIt.I.allReady().then((_) => flashCardStore.getFlashCards(deck.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          key: const Key('btnvoltar'),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(deck.name, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: 360,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            deck.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Observer(
                            builder: (_) {
                              return Text(
                                '${flashCardStore.flashCards.length} cartoes',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24),
                              );
                            },
                          ),

                          const SizedBox(height: 96),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48),
                            child: SizedBox(
                              height: 60,
                              child: OutlinedButton(
                                key: Key("addCard"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NewCardPage(deckId: deck.id),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'Add Cartao',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48),
                            child: SizedBox(
                              height: 60,
                              child: FilledButton(
                                key: Key("startQuiz"),
                                onPressed: () {
                                  if (flashCardStore.flashCards.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Adicione ao menos um cartao para iniciar o quiz.',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  final quizStore = GetIt.I.get<QuizStore>();
                                  quizStore.startQuiz(
                                    deckName: deck.name,
                                    flashCards:
                                        flashCardStore.flashCards.toList(),
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => QuizPage(store: quizStore),
                                    ),
                                  );
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'Iniciar Quiz',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
