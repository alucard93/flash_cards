import 'package:flash_cards/stores/decks.store.dart';
import 'package:flash_cards/widgets/deck_empty.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DeckPage extends StatelessWidget {
  final store = GetIt.I.get<DeckStore>();
  DeckPage({super.key});

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

          return store.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: store.decks.length,
                  itemBuilder: (context, index) {
                    final deck = store.decks[index];
                    return Dismissible(
                      key: ValueKey(deck.id.toString()),
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
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.black26),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                deck.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '0 cartões',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
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
          key: const Key("btnAdicionar"),
        ),
      ),
    );
  }
}
