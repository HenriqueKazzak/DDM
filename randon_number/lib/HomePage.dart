import 'dart:math';

import 'randomBloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new randomBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sorteio de Número"),
        ),
        body: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: ListTile(
                      title: Text('De'),
                      subtitle: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: bloc.minController,
                        decoration:
                            const InputDecoration(hintText: 'Sorteio de'),
                      ),
                    )),
                    Expanded(
                        child: ListTile(
                      title: Text('Ate'),
                      subtitle: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: bloc.maxController,
                        decoration: const InputDecoration(hintText: 'ate'),
                      ),
                    )),
                  ],
                ),
                Center(
                    child: Text(
                        bloc.result,
                    style: const TextStyle(
                      fontSize: 30
                    ),)
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.amber),
                        onPressed: () {
                          setState(() {
                            bloc.getRandom();
                          });
                        },
                        child: const Text(
                          'Sortear',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )))
              ],
            )));
  }
}
