import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/custom_widgets/bottom_button.dart';
import 'package:bmicalculator/custom_widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmi;
  final String bmiInterpretation;

  const ResultsPage({
    required this.bmi,
    required this.bmiResult,
    required this.bmiInterpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: ktitleTextStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: kinactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      bmiResult,
                      style: kresultsTextStyle,
                    ),
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      bmiInterpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
