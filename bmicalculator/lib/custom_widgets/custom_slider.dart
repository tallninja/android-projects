import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double min;
  final double max;
  final int value;
  final void Function(double)? onChanged;

  const CustomSlider({
    required this.min,
    required this.max,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
        activeTrackColor: Colors.white,
        thumbColor: kcustomPink,
        overlayColor: ktcustomPink,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10.0,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 20.0,
        ),
      ),
      child: Slider(
        value: value.toDouble(),
        min: min,
        max: max,
        onChanged: onChanged,
        label: '$value',
      ),
    );
  }
}
