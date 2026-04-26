import 'package:flash_cards/stores/flash_cards/flash_cards.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class NewCardPage extends StatefulWidget {
  final String deckId;
  const NewCardPage({super.key, required this.deckId});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final store = GetIt.I.get<FlashCardStore>();

  final formKey = GlobalKey<FormState>();
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  // aqui tem que ser o store do card

  Future<void> addCard() async {
    if (!formKey.currentState!.validate()) return;
    if (store.isLoading) return;

    await store.addFlashCard(
      widget.deckId,
      questionController.text.trim(),
      answerController.text.trim(),
    );

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const Key('btnvoltar'),
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Novo cartão', style: TextStyle(fontSize: 14)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: SizedBox(
            width: 360,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    key: const Key('inputPergunta'),
                    controller: questionController,
                    minLines: 1,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Pergunta'),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9B9B9B)),
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

                  TextFormField(
                    key: const Key('inputResposta'),
                    controller: answerController,
                    minLines: 2,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Resposta'),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9B9B9B)),
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
                      key: const Key('addCardQuestion'),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: addCard,
                      child: store.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Observer(
                              builder: (context) {
                                return const Text(
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
        ),
      ),
    );
  }
}
