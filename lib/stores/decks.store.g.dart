// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeckStore on _DeckStoreBase, Store {
  late final _$decksAtom = Atom(name: '_DeckStoreBase.decks', context: context);

  @override
  ObservableList<Deck> get decks {
    _$decksAtom.reportRead();
    return super.decks;
  }

  @override
  set decks(ObservableList<Deck> value) {
    _$decksAtom.reportWrite(value, super.decks, () {
      super.decks = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DeckStoreBase.isLoading', context: context);

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

  late final _$getDecksAsyncAction =
      AsyncAction('_DeckStoreBase.getDecks', context: context);

  @override
  Future<void> getDecks() {
    return _$getDecksAsyncAction.run(() => super.getDecks());
  }

  late final _$addDeckAsyncAction =
      AsyncAction('_DeckStoreBase.addDeck', context: context);

  @override
  Future<void> addDeck(String name) {
    return _$addDeckAsyncAction.run(() => super.addDeck(name));
  }

  @override
  String toString() {
    return '''
decks: ${decks},
isLoading: ${isLoading}
    ''';
  }
}
