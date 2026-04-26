import 'package:flash_cards/models/flash_cards/flash_card.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlashCardRepository {
  final Box<List> flashCardsBox;

  // Construtor para injetar a dependência do Hive Box
  FlashCardRepository({required this.flashCardsBox});

  Future<List<FlashCard>> getAllFlashCards(String deckId) async {
    await Future.delayed(const Duration(seconds: 1));
    final flashCards = flashCardsBox.get(
      "flashCards:$deckId",
      defaultValue: [],
    );
    return List<FlashCard>.from(flashCards!);
  }

  Future<void> addNewFlashCard({
    required String deckId,
    required FlashCard flashCard,
  }) async {
    final flashCards = await getAllFlashCards(deckId);
    flashCards.add(flashCard);
    await flashCardsBox.put("flashCards:$deckId", flashCards);
  }

  Future<int> getFlashCardCount(String deckId) async {
    final flashCards = flashCardsBox.get(
      'flashCards:$deckId',
      defaultValue: [],
    );

    return flashCards?.length ?? 0;
  }
}
