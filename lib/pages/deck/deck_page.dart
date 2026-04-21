import 'package:flash_cards/stores/decks.store.dart';
import 'package:flutter/material.dart';

class DeckPage extends StatelessWidget {
  final store = DeckStore();
  DeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decks', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                key: Key("image"),
                'assets/images/no_decks.png',
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),

            OutlinedButton(
              key: Key("btnOutlineAdicionar"),
              onPressed: () {
                Navigator.pushNamed(context, '/new-deck');
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFE1E1E1), width: 1),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Adicionar Deck',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton.extended(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text(
              'Adicionar',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(160),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
