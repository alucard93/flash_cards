// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on _QuizStoreBase, Store {
  Computed<FlashCard?>? _$currentCardComputed;

  @override
  FlashCard? get currentCard =>
      (_$currentCardComputed ??= Computed<FlashCard?>(() => super.currentCard,
              name: '_QuizStoreBase.currentCard'))
          .value;
  Computed<String>? _$progressTextComputed;

  @override
  String get progressText =>
      (_$progressTextComputed ??= Computed<String>(() => super.progressText,
              name: '_QuizStoreBase.progressText'))
          .value;
  Computed<int>? _$totalQuestionsComputed;

  @override
  int get totalQuestions =>
      (_$totalQuestionsComputed ??= Computed<int>(() => super.totalQuestions,
              name: '_QuizStoreBase.totalQuestions'))
          .value;
  Computed<bool>? _$hasCardsComputed;

  @override
  bool get hasCards => (_$hasCardsComputed ??=
          Computed<bool>(() => super.hasCards, name: '_QuizStoreBase.hasCards'))
      .value;

  late final _$cardsAtom = Atom(name: '_QuizStoreBase.cards', context: context);

  @override
  ObservableList<FlashCard> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<FlashCard> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_QuizStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$scoreAtom = Atom(name: '_QuizStoreBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$showAnswerAtom =
      Atom(name: '_QuizStoreBase.showAnswer', context: context);

  @override
  bool get showAnswer {
    _$showAnswerAtom.reportRead();
    return super.showAnswer;
  }

  @override
  set showAnswer(bool value) {
    _$showAnswerAtom.reportWrite(value, super.showAnswer, () {
      super.showAnswer = value;
    });
  }

  late final _$finishedAtom =
      Atom(name: '_QuizStoreBase.finished', context: context);

  @override
  bool get finished {
    _$finishedAtom.reportRead();
    return super.finished;
  }

  @override
  set finished(bool value) {
    _$finishedAtom.reportWrite(value, super.finished, () {
      super.finished = value;
    });
  }

  late final _$deckNameAtom =
      Atom(name: '_QuizStoreBase.deckName', context: context);

  @override
  String get deckName {
    _$deckNameAtom.reportRead();
    return super.deckName;
  }

  @override
  set deckName(String value) {
    _$deckNameAtom.reportWrite(value, super.deckName, () {
      super.deckName = value;
    });
  }

  late final _$_QuizStoreBaseActionController =
      ActionController(name: '_QuizStoreBase', context: context);

  @override
  void startQuiz(
      {required String deckName, required List<FlashCard> flashCards}) {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase.startQuiz');
    try {
      return super.startQuiz(deckName: deckName, flashCards: flashCards);
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void revealAnswer() {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase.revealAnswer');
    try {
      return super.revealAnswer();
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void answerCorrect() {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase.answerCorrect');
    try {
      return super.answerCorrect();
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void answerWrong() {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase.answerWrong');
    try {
      return super.answerWrong();
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetQuiz() {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase.resetQuiz');
    try {
      return super.resetQuiz();
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _nextQuestion() {
    final _$actionInfo = _$_QuizStoreBaseActionController.startAction(
        name: '_QuizStoreBase._nextQuestion');
    try {
      return super._nextQuestion();
    } finally {
      _$_QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards},
currentIndex: ${currentIndex},
score: ${score},
showAnswer: ${showAnswer},
finished: ${finished},
deckName: ${deckName},
currentCard: ${currentCard},
progressText: ${progressText},
totalQuestions: ${totalQuestions},
hasCards: ${hasCards}
    ''';
  }
}
