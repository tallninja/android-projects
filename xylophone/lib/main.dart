import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/widgets/bar.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Xylophone",
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: XylophonePage(),
          ),
        ));
  }
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({Key? key}) : super(key: key);

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final player = AudioCache();

  _XylophonePageState() {
    player.loadAll([
      'note1.wav',
      'note2.wav',
      'note3.wav',
      'note4.wav',
      'note5.wav',
      'note6.wav',
      'note7.wav',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Bar(
          player: player,
          file: 'note1.wav',
          color: Colors.purple,
        ),
        Bar(
          player: player,
          file: 'note2.wav',
          color: Colors.blue,
        ),
        Bar(
          player: player,
          file: 'note3.wav',
          color: Colors.teal,
        ),
        Bar(
          player: player,
          file: 'note4.wav',
          color: Colors.green,
        ),
        Bar(
          player: player,
          file: 'note5.wav',
          color: Colors.yellow,
        ),
        Bar(
          player: player,
          file: 'note6.wav',
          color: Colors.orange,
        ),
        Bar(
          player: player,
          file: 'note7.wav',
          color: Colors.red,
        ),
      ],
    );
  }
}
