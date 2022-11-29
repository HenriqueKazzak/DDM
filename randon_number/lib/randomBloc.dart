import 'dart:math';

import 'package:flutter/material.dart';

class randomBloc{
  var minController = TextEditingController();
  var maxController = TextEditingController();
  var result = "Digite o numero minimo e maximo para sortear";
  getRandom(){
    var minInt = int.parse(minController.text);
    var maxInt = int.parse(maxController.text);
    result = (minInt + Random(DateTime.now().hashCode).nextInt(maxInt - minInt)).toString();
  }
}