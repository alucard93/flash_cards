import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flash_cards/repositories/deck.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'decks.store.g.dart';

class DeckStore = _DeckStoreBase with _$DeckStore;

abstract class _DeckStoreBase with Store {
  @observable
  ObservableList<Deck> decks = <Deck>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> getDecks() async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<DeckRepository>();
      decks = (await repository.getAllDecks()).asObservable();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addDeck(String name) async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<DeckRepository>();
      final deck = Deck(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
      );

      await repository.addDeck(deck);
      decks.add(deck);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> removeDeck(String id) async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<DeckRepository>();
      await repository.removeDeck(id);
      decks.removeWhere((deck) => deck.id == id);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
