import 'dart:math';

import 'package:flutter/material.dart';

class ImcBloc{
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  var resultado = "Digite seu peso e sua altura para calcular";

  calculaImc(){
    double altura = double.parse(alturaController.text)/100;
    double peso = double.parse(pesoController.text);

    var imc = peso/(altura*altura);

    resultado = ("${nomeController.text} seu IMC é de ${imc.toStringAsFixed(2)}");
}


}