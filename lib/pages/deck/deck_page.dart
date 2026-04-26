import 'package:flash_cards/pages/deck_detail/deck_detail_page.dart';
import 'package:flash_cards/stores/deck/decks.store.dart';
import 'package:flash_cards/stores/flash_cards/flash_cards.store.dart';
import 'package:flash_cards/widgets/deck_empty.widget.dart';
import 'package:flash_cards/widgets/deck_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DeckPage extends StatelessWidget {
  final store = GetIt.I.get<DeckStore>();
  final flashCardStore = GetIt.I.get<FlashCardStore>();
  DeckPage({super.key}) {
    flashCardStore.getFlashCardCounts(store.decks.map((deck) => deck.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decks', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.decks.isEmpty) {
            return const DeckEmptyWidget();
          }

          return ListView.builder(
            itemCount: store.decks.length,
            itemBuilder: (context, index) {
              final deck = store.decks[index];
              return Dismissible(
                key: ValueKey(deck.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return store.removeDeck(deck.id);
                },
                background: Center(
                  child: Container(
                    height: 140,
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                child: Observer(
                  builder: (_) {
                    return DeckItemWidget(
                      deck: deck,
                      cardCount:
                          flashCardStore.flashCardCountByDeck[deck.id] ?? 0,
                      onOpenDeck: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DeckDetailPage(deck: deck),
                          ),
                        );
                      },
                      onRemoveDeck: () async {
                        await store.removeDeck(deck.id);
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton.extended(
          label: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Adicionar',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(160),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/new-deck');
          },
          key: const Key('btnAdicionar'),
        ),
      ),
    );
  }
}
