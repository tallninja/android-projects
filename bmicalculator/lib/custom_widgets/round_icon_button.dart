import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget? child;
  final void Function() onPressed;
  final void Function()? onLongPress;

  const RoundIconButton(
      {required this.onPressed, this.onLongPress, this.child});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: child,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: const Color(0xFF4C4F5E),
      elevation: 6.0,
    );
  }
}
