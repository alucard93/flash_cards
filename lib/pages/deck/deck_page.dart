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

          return ListView.builder(
            itemCount: store.decks.length,
            itemBuilder: (context, index) {
              final deck = store.decks[index];
              return ListTile(title: Text(deck.name));
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton.extended(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text(
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
        ),
      ),
    );
  }
}
