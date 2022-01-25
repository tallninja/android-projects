import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[800],
        appBar: AppBar(
          title: const Text("Dicee"),
          backgroundColor: Colors.red[900],
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                rollDice();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                rollDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// class DicePage extends StatelessWidget {
//   const DicePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     int leftDiceNumber = 3;
//     int rightDiceNumber = 6;

//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             child: TextButton(
//               onPressed: () {
//                 leftDiceNumber++;
//               },
//               child: Image.asset('images/dice$leftDiceNumber.png'),
//             ),
//           ),
//           Expanded(
//             child: TextButton(
//               onPressed: () {
//                 rightDiceNumber++;
//               },
//               child: Image.asset('images/dice$rightDiceNumber.png'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
