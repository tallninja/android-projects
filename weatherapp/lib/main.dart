// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loading_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: LoadingScreen(),
    );
  }
}
