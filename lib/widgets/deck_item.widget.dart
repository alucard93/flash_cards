import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flutter/material.dart';

class DeckItemWidget extends StatelessWidget {
  final Deck deck;
  final VoidCallback onRemoveDeck;
  final VoidCallback onOpenDeck;

  const DeckItemWidget({
    super.key,
    required this.deck,
    required this.onOpenDeck,
    required this.onRemoveDeck,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onOpenDeck,
        onLongPress: onRemoveDeck,
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black26)),
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
                  '0 cartoes',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
