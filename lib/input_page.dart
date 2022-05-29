import 'package:bmi_calculator/Icon_Content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Icon_Content.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:bmi_calculator/constants.dart';

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
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/results');
            },
            child: Container(
              color: kBottomContainerColour,
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(child: Text("CALCULATE",style: TextStyle(
                color: Colors.white,
                fontSize:17,
              ),)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final Widget iconChild;
  const RoundIconButton({@required this.onPressed, @required this.iconChild});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: iconChild,
        shape: CircleBorder(),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        fillColor: FABcol,
        onPressed: onPressed);
  }
}
