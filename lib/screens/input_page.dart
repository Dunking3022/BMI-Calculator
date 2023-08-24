import 'package:bmi_calculator/components/Icon_Content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Icon_Content.dart';
import 'package:bmi_calculator/components/Reusable_Card.dart';
import 'package:bmi_calculator/components/constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../screens/results_page.dart';

import '../components/calculator_brain.dart';

Gender selectedCard = null;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  double sliderHeight = 180.0;
  double buttonWeight = 60.0;
  double buttonAge = 19.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    gestureOnTap: () {
                      setState(() {
                        selectedCard = Gender.Male;
                      });
                    },
                    colour: (selectedCard == Gender.Male)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: cardContent(
                      iconData: FontAwesomeIcons.mars,
                      iconString: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  gestureOnTap: () {
                    setState(() {
                      selectedCard = Gender.Female;
                    });
                  },
                  colour: (selectedCard == Gender.Female)
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: cardContent(
                    iconData: FontAwesomeIcons.venus,
                    iconString: 'FEMALE',
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT", style: labelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            sliderHeight.toInt().toString(),
                            style: kSliderTextStyle,
                          ),
                          Text("cm", style: labelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kBottomContainerColour,
                          overlayColor: Color(0x22EB15555),
                          thumbColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          min: 120.0,
                          max: 220.0,
                          value: sliderHeight,
                          onChanged: (newSliderValue) {
                            setState(() {
                              sliderHeight = newSliderValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(buttonWeight.toInt().toString(),
                              style: kSliderTextStyle),
                          Text(
                            "Kg",
                            style: labelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                buttonWeight++;
                              });
                            },
                            iconChild: Icon(FontAwesomeIcons.plus),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                buttonWeight--;
                              });
                              ;
                            },
                            iconChild: Icon(FontAwesomeIcons.minus),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(buttonAge.toInt().toString(),
                              style: kSliderTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                buttonAge++;
                              });
                            },
                            iconChild: Icon(FontAwesomeIcons.plus),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                buttonAge--;
                              });
                              ;
                            },
                            iconChild: Icon(FontAwesomeIcons.minus),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {

              Calculator_Brain calc = Calculator_Brain(height: sliderHeight, weight: buttonWeight);
              print(calc.calculateBMI()+" "+calc.getResult());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calc.calculateBMI(),          // Replace with your calculated value
                    resultText: calc.getResult(),   // Replace with your calculated value
                    interpretation: calc.getInterpretation(),  // Replace with your calculated value
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