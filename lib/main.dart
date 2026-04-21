import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flutter/material.dart';

void main() {
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
