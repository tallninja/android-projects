import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'Page1/page1.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.pink);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Page1': (context) => Page1(),
        // '/Page2': (context) => Page2(),
      },
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
