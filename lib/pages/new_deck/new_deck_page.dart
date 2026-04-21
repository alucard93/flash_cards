import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NewDeck extends StatefulWidget {
  const NewDeck({super.key});

  @override
  State<NewDeck> createState() => _NewDeckState();
}

class _NewDeckState extends State<NewDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Deck'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
