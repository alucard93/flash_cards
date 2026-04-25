import 'package:flash_cards/stores/decks.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class NewDeck extends StatefulWidget {
  const NewDeck({super.key});

  @override
  State<NewDeck> createState() => _NewDeckState();
}

class _NewDeckState extends State<NewDeck> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final store = GetIt.I.get<DeckStore>();

  Future<void> addDeck() async {
    if (!formKey.currentState!.validate()) return;
    if (store.isLoading) return;

    await store.addDeck(nameController.text);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Deck', style: TextStyle(fontSize: 14)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              24,
              24,
              24,
              MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 48,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Qual é o título\n do seu novo\n deck?',
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      key: Key("tituloDeck"),
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Título do deck'),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    Align(
                      child: OutlinedButton(
                        key: Key("btnAdicionarDeck"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: addDeck,
                        child: Observer(
                          builder: (context) {
                            return store.isLoading
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Text(
                                    'Adicionar',
                                    style: TextStyle(color: Colors.white),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
