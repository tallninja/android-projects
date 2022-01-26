import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
    required this.player,
    required this.file,
    required this.color,
  }) : super(key: key);

  final AudioCache player;
  final Color color;
  final String file;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          player.play(file);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color,
        ),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
