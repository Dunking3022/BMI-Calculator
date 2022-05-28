import 'package:bmi_calculator/Icon_Content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Icon_Content.dart';
import 'package:bmi_calculator/Reusable_Card.dart';

enum Gender { Male, Female }
const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB15555);
Gender selectedCard = null;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(Gender gender) {
    if (gender == Gender.Male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
        selectedCard = Gender.Male;
      } else {
        maleCardColour = inactiveCardColour;
        selectedCard = null;
      }
    }
    if (gender == Gender.Female) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
        selectedCard = Gender.Female;
      } else {
        femaleCardColour = inactiveCardColour;
        selectedCard = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
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
                        ? activeCardColour
                        : inactiveCardColour,
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
                      ? activeCardColour
                      : inactiveCardColour,
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
                Expanded(child: ReusableCard()),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard()),
                Expanded(child: ReusableCard()),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
