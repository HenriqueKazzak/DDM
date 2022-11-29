import 'package:calculadora_imc/HomePageIMC.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePageImc(title: "Calculadora de IMC"),
    );
  }
}

