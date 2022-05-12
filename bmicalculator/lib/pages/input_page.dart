import 'package:bmicalculator/custom_widgets/bottom_button.dart';
import 'package:bmicalculator/custom_widgets/custom_slider.dart';
import 'package:bmicalculator/custom_widgets/icon_content.dart';
import 'package:bmicalculator/custom_widgets/reusable_card.dart';
import 'package:bmicalculator/custom_widgets/round_icon_button.dart';
import 'package:bmicalculator/pages/results_page.dart';
import 'package:bmicalculator/utils/bmi_calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _gender;
  int _height = 200;
  int _weight = 60;
  int _age = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _gender = Gender.male;
                      });
                    },
                    color: _gender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    child: const IconContent(
                      label: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        _gender = Gender.female;
                      });
                    },
                    color: _gender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    child: const IconContent(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                color: kactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toString(),
                          style: kleadTextStyle,
                        ),
                        const Text('cm'),
                      ],
                    ),
                    CustomSlider(
                      min: 100.0,
                      max: 300.0,
                      value: _height,
                      onChanged: (double newHeight) {
                        setState(() {
                          _height = newHeight.round();
                        });
                      },
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _weight.toString(),
                              style: kleadTextStyle,
                            ),
                            const Text('Kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _age.toString(),
                              style: kleadTextStyle,
                            ),
                            const Text('years'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPressed: () {
              BMICalculator bmiCalculator = BMICalculator(
                height: _height,
                weight: _weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: bmiCalculator.calculateBMI(),
                    bmiResult: bmiCalculator.getResult(),
                    bmiInterpretation: bmiCalculator.getInterpretetion(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
