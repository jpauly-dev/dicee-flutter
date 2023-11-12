import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  int randomFace() {
    return Random().nextInt(6) + 1;
  }

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = randomFace();
      rightDiceNumber = randomFace();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Dice(
            faceNumber: leftDiceNumber,
            onPressed: () {
              changeDiceFace();
              print("left dice clicked");
            },
          ),
          Dice(
            faceNumber: rightDiceNumber,
            onPressed: () {
              changeDiceFace();
              print("right dice clicked");
            },
          ),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final void Function() onPressed;
  final int faceNumber;

  const Dice({super.key, required this.onPressed, required this.faceNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Image.asset('images/dice$faceNumber.png'),
      ),
    );
  }
}
