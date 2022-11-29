import 'package:calculadora_imc/ImcBloc.dart';
import 'package:calculadora_imc/ResultPageImc.dart';
import 'package:flutter/material.dart';

class HomePageImc extends StatefulWidget {

  const HomePageImc({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePageImc> createState() => _HomePageImcState();
}

class _HomePageImcState extends State<HomePageImc> {
  ImcBloc imcBloc = ImcBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
        ),
      body:
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Qual seu nome?"
                ),
                keyboardType: TextInputType.name,
                controller: imcBloc.nomeController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Altura em CM"
                ),
                keyboardType: TextInputType.number,
                controller: imcBloc.alturaController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Peso em KG"
                ),
                keyboardType: TextInputType.number,
                controller: imcBloc.pesoController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: TextButton(
                onPressed: () {
                  imcBloc.calculaImc();
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ResultPageImc(imcBloc: imcBloc)));
                },
                child: const Text(
                  'Calcular IMC'
                ),
              ),
            )
          ],
        )
    );
  }
}
