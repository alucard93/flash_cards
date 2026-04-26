import 'package:flash_cards/models/decks/deck.model.dart';
import 'package:flash_cards/models/flash_cards/flash_card.model.dart';
import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flash_cards/pages/new_deck/new_deck_page.dart';
import 'package:flash_cards/repositories/deck.repository.dart';
import 'package:flash_cards/repositories/flash_card.repository.dart';
import 'package:flash_cards/stores/deck/decks.store.dart';
import 'package:flash_cards/stores/flash_cards/flash_cards.store.dart';
import 'package:flash_cards/stores/quiz/quiz.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> inithive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeckAdapter());
  Hive.registerAdapter(FlashCardAdapter());
}

Future<void> initServiceLocator() async {
  final box = await Hive.openBox<List>('decks');
  final flashCardsBox = await Hive.openBox<List>('flash_cards');

  GetIt.I.registerSingleton<DeckRepository>(DeckRepository(boxDecks: box));
  GetIt.I.registerSingleton<FlashCardRepository>(
    FlashCardRepository(flashCardsBox: flashCardsBox),
  );

  final deckStore = DeckStore();
  await deckStore.getDecks();
  GetIt.I.registerSingleton<DeckStore>(deckStore);

  final flashCardStore = FlashCardStore();
  GetIt.I.registerSingleton<FlashCardStore>(flashCardStore);

  GetIt.I.registerFactory<QuizStore>(() => QuizStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inithive();
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de listagem de decks',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DeckPage(),
        '/new-deck': (context) => const NewDeck(),
      },
      initialRoute: '/',
    );
  }
}
