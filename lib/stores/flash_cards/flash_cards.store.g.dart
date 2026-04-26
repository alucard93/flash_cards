// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_cards.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlashCardStore on _FlashCardStoreBase, Store {
  late final _$flashCardsAtom =
      Atom(name: '_FlashCardStoreBase.flashCards', context: context);

  @override
  ObservableList<FlashCard> get flashCards {
    _$flashCardsAtom.reportRead();
    return super.flashCards;
  }

  @override
  set flashCards(ObservableList<FlashCard> value) {
    _$flashCardsAtom.reportWrite(value, super.flashCards, () {
      super.flashCards = value;
    });
  }

  late final _$flashCardCountByDeckAtom =
      Atom(name: '_FlashCardStoreBase.flashCardCountByDeck', context: context);

  @override
  ObservableMap<String, int> get flashCardCountByDeck {
    _$flashCardCountByDeckAtom.reportRead();
    return super.flashCardCountByDeck;
  }

  @override
  set flashCardCountByDeck(ObservableMap<String, int> value) {
    _$flashCardCountByDeckAtom.reportWrite(value, super.flashCardCountByDeck,
        () {
      super.flashCardCountByDeck = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FlashCardStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getFlashCardsAsyncAction =
      AsyncAction('_FlashCardStoreBase.getFlashCards', context: context);

  @override
  Future<void> getFlashCards(String deckId) {
    return _$getFlashCardsAsyncAction.run(() => super.getFlashCards(deckId));
  }

  late final _$getFlashCardCountsAsyncAction =
      AsyncAction('_FlashCardStoreBase.getFlashCardCounts', context: context);

  @override
  Future<void> getFlashCardCounts(Iterable<String> deckIds) {
    return _$getFlashCardCountsAsyncAction
        .run(() => super.getFlashCardCounts(deckIds));
  }

  late final _$addFlashCardAsyncAction =
      AsyncAction('_FlashCardStoreBase.addFlashCard', context: context);

  @override
  Future<void> addFlashCard(String deckId, String question, String answer) {
    return _$addFlashCardAsyncAction
        .run(() => super.addFlashCard(deckId, question, answer));
  }

  @override
  String toString() {
    return '''
flashCards: ${flashCards},
flashCardCountByDeck: ${flashCardCountByDeck},
isLoading: ${isLoading}
    ''';
  }
}
