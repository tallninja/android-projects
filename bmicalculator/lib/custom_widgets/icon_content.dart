// ignore_for_file: use_key_in_widget_constructors

import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  const IconContent({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(label, style: klabelTextStyle),
      ],
    );
  }
}
