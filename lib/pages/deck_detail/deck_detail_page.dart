import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flutter/material.dart';

class DeckDetailPage extends StatelessWidget {
  final Deck deck;

  const DeckDetailPage({super.key, required this.deck});

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
        title: Text(deck.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                deck.name,
                style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
              ),
              Text('0 Cartões', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
