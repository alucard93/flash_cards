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

    final repository = GetIt.I.get<DeckRepository>();

    decks = (await repository.getAllDecks()).asObservable();
    isLoading = false;
  }

  @action
  Future<void> addDeck(String name) async {
    isLoading = true;

    try {
      final repository = GetIt.I.get<DeckRepository>();

      await repository.addDeck(
        Deck(id: DateTime.now().millisecond.toString(), name: name),
      );
    } finally {
      isLoading = false;
    }

    isLoading = false;
  }
}
