import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flash_cards/pages/new_card/new_card_page.dart';
import 'package:flash_cards/pages/new_deck/new_deck_page.dart';
import 'package:flash_cards/repositories/deck.repository.dart';
import 'package:flash_cards/stores/decks.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> inithive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeckAdapter());
}

Future<void> initServiceLocator() async {
  final box = await Hive.openBox<List>('decks');
  GetIt.I.registerSingleton<DeckRepository>(DeckRepository(boxDecks: box));

  final deckStore = DeckStore();
  await deckStore.getDecks();
  GetIt.I.registerSingleton<DeckStore>(deckStore);
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
        '/new-card': (context) => const NewCardPage(),
      },
      initialRoute: '/',
    );
  }
}
