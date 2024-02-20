import 'package:flutter/material.dart';
import 'dart:math';

class App01 extends StatefulWidget {
  const App01({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _App01State createState() => _App01State();
}

class _App01State extends State<App01> {
  late String wordToGuess;
  late List<bool> guessedLetters;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    NuevoJuego();
  }

  void NuevoJuego() {

    List<String> words = ['ONEPIECE', 'MANZANA', 'WIDGET', 'AMIGO', 'ESPADA'];

 
    wordToGuess = words[Random().nextInt(words.length)];

    guessedLetters = List.generate(wordToGuess.length, (index) => false);

    controller = TextEditingController();
  }

  void guessLetter(String letter) {
    setState(() {
      for (int i = 0; i < wordToGuess.length; i++) {
        if (wordToGuess[i] == letter) {
          guessedLetters[i] = true;
        }
      }
      controller.clear();
    });
  }

  bool isWordGuessed() {
    return !guessedLetters.contains(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina la Palabra'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Adivina la palabra:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                wordToGuess.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    guessedLetters[index] ? wordToGuess[index] : '_',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  guessLetter(value.toUpperCase());
                }
              },
              decoration: InputDecoration(
                hintText: 'Ingresa una letra',
              ),
            ),
            SizedBox(height: 20),
            isWordGuessed()
                ? Text(
                    '¡Has adivinado la palabra!',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  )
                : SizedBox(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            NuevoJuego();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

