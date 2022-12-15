import 'dart:async';

import 'package:flutter/material.dart';
import 'package:light/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const sensorPage(),
    );
  }
}
class sensorPage extends StatefulWidget {
  const sensorPage({Key? key}) : super(key: key);

  @override
  State<sensorPage> createState() => _sensorPageState();
}

class _sensorPageState extends State<sensorPage> {

  String luzString = "Aguardade";
  late Light light;
  late StreamSubscription subscription;

  void onData(int luxValue) async {
    print("Luminosidade: $luxValue");
    setState(() {
      luzString = "$luxValue";
    });
  }

  void startListening() {
    light = new Light();
    try {
      subscription = light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
    }
  }
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sensor pro romulo"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Lux value: $luzString\n'),")
          ],
        ),
      ),
    );
  }
}
