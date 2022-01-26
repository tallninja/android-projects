import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const BottomButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kcustomPink,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: klargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
