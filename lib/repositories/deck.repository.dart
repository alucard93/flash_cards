import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeckRepository {
  final Box<List> boxDecks;

  DeckRepository(this.boxDecks);

  Future<List<Deck>> getAllDecks() async {
    final decks = boxDecks.get('decks', defaultValue: []);
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    return List<Deck>.from(decks!);
  }

}
