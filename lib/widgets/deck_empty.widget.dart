import 'package:flutter/material.dart';

class DeckEmptyWidget extends StatelessWidget {
  const DeckEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }
}
