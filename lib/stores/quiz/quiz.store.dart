import 'package:flash_cards/models/flash_cards/flash_card.model.dart';
import 'package:mobx/mobx.dart';
part 'quiz.store.g.dart';

class QuizStore = _QuizStoreBase with _$QuizStore;

abstract class _QuizStoreBase with Store {
  @observable
  ObservableList<FlashCard> cards = <FlashCard>[].asObservable();

  @observable
  int currentIndex = 0;

  @observable
  int score = 0;

  @observable
  bool showAnswer = false;

  @observable
  bool finished = false;

  @observable
  String deckName = '';

  @computed
  FlashCard? get currentCard {
    if (cards.isEmpty || currentIndex >= cards.length) return null;
    return cards[currentIndex];
  }

  @computed
  String get progressText {
    if (cards.isEmpty) return '0/0';
    return '${currentIndex + 1}/${cards.length}';
  }

  @computed
  int get totalQuestions => cards.length;

  @computed
  bool get hasCards => cards.isNotEmpty;

  @action
  void startQuiz({
    required String deckName,
    required List<FlashCard> flashCards,
  }) {
    this.deckName = deckName;
    cards = flashCards.asObservable();
    currentIndex = 0;
    score = 0;
    showAnswer = false;
    finished = false;
  }

  @action
  void revealAnswer() {
    showAnswer = true;
  }

  @action
  void answerCorrect() {
    score++;
    _nextQuestion();
  }

  @action
  void answerWrong() {
    _nextQuestion();
  }

  @action
  void resetQuiz() {
    cards = <FlashCard>[].asObservable();
    currentIndex = 0;
    score = 0;
    showAnswer = false;
    finished = false;
    deckName = '';
  }

  @action
  void _nextQuestion() {
    if (currentIndex >= cards.length - 1) {
      finished = true;
      return;
    }

    currentIndex++;
    showAnswer = false;
  }
}
