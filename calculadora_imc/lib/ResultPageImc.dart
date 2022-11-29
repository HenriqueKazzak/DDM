import 'dart:html';

import 'package:calculadora_imc/ImcBloc.dart';
import 'package:flutter/material.dart';

class ResultPageImc extends StatelessWidget {
  const ResultPageImc({Key? key, required this.imcBloc}) : super(key: key);
  final ImcBloc imcBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Resultado do seu IMC")
        ),
        body:
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nome"
                ),
                readOnly: true,
                initialValue: imcBloc.nomeController.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Altura em CM"
                ),
                readOnly: true,
                initialValue: imcBloc.alturaController.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Peso em KG"
                ),
                readOnly: true,
                initialValue: imcBloc.pesoController.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: Text(imcBloc.resultado),
            )
          ],
        )
    );
  }
}
