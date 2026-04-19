import 'package:flash_cards/pages/deck/deck_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de listagem de produtos',
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const DeckPage()},
      initialRoute: '/',
      home: Container(),
    );
  }
}
