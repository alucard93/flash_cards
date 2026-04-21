import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flash_cards/pages/new_deck/new_deck_page.dart';
import 'package:flash_cards/repositories/deck.repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

Future<void> inithive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeckAdapter());
}

void initServiceLocator() {
  GetIt.I.registerSingletonAsync<DeckRepository>(() async {
    final box = await Hive.openBox<List>("decks");
    return DeckRepository(boxDecks: box);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inithive();
  initServiceLocator();
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
        '/': (context) => const DeckPage(),
        '/new-deck': (context) => const NewDeck(),
      },
      initialRoute: '/',
    );
  }
}
