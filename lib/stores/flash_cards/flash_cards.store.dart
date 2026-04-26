import 'package:flash_cards/models/flash_cards/flash_card.model.dart';
import 'package:flash_cards/repositories/flash_card.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'flash_cards.store.g.dart';

class FlashCardStore = _FlashCardStoreBase with _$FlashCardStore;

abstract class _FlashCardStoreBase with Store {
  @observable
  ObservableList<FlashCard> flashCards = <FlashCard>[].asObservable();

  @observable
  ObservableMap<String, int> flashCardCountByDeck = ObservableMap<String, int>();

  @observable
  bool isLoading = false;

  String? currentDeckId;

  @action
  Future<void> getFlashCards(String deckId) async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<FlashCardRepository>();
      final flashCardsTemp = await repository.getAllFlashCards(deckId);
      currentDeckId = deckId;
      flashCards = flashCardsTemp.asObservable();
      flashCardCountByDeck[deckId] = flashCards.length;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getFlashCardCounts(Iterable<String> deckIds) async {
    final repository = GetIt.I.get<FlashCardRepository>();

    for (final deckId in deckIds) {
      final count = await repository.getFlashCardCount(deckId);
      flashCardCountByDeck[deckId] = count;
    }
  }

  @action
  Future<void> addFlashCard(
    String deckId,
    String question,
    String answer,
  ) async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<FlashCardRepository>();
      final flashCard = FlashCard(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        front: question,
        back: answer,
      );

      await repository.addNewFlashCard(deckId: deckId, flashCard: flashCard);

      if (currentDeckId == deckId) {
        flashCards.add(flashCard);
        flashCardCountByDeck[deckId] = flashCards.length;
      } else {
        final count = await repository.getFlashCardCount(deckId);
        flashCardCountByDeck[deckId] = count;
      }
    } finally {
      isLoading = false;
    }
  }
}
