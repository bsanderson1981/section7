import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(), // ✅ Move DicePage here
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int numberleft = 1;
  int numberright = 1;

  void rollDice() {
    setState(() {
      numberleft = Random().nextInt(5) + 1;
      numberright = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  numberleft = Random().nextInt(6) + 1;
                  print('left button $numberleft');
                  numberright = Random().nextInt(6) + 1;
                  print('right button $numberright');

                });
              },
              child: Image.asset('images/dice$numberleft.png'),

            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  numberright = Random().nextInt(6) + 1;
                  print('right button $numberright');
                  numberleft = Random().nextInt(6) + 1;
                  print('left button $numberleft');


                });
              },
              child: Image.asset('images/dice$numberright.png'),
            ),
          ),
        ],
      ),
    );
  }
}
