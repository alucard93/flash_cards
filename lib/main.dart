import 'package:flash_cards/model/decks/deck.model.dart';
import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> inithive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeckAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inithive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de listagem de decks',
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const DeckPage()},
      initialRoute: '/',
    );
  }
}
