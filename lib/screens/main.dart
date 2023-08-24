import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';
import 'main.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/input':(context) => InputPage(),
        '/results':(context) => ResultsPage(),
      },
      initialRoute: '/input',
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF0C0C15)
          ),
          primaryColor: Color(0xFF0C0C15),
          scaffoldBackgroundColor: Color(0xFF0C0C15),
          accentColor: Colors.greenAccent,
          ),
    );
  }
}

