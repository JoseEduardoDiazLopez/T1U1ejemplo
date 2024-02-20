import 'package:flutter/material.dart';
import 'dart:math';
import 'app01.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina la Palabra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App01(title: 'Adivina la Palabra'), // Asegúrate de pasar el título aquí
    );
  }
}

