import 'dart:math';

class Calculator_Brain{

  Calculator_Brain({this.height, this.weight});

  final double height;
  final double weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
}
  String getResult() {
    if (_bmi >= 25){
      return("Overweight");
    }
    else if (_bmi >18.5){
      return("Normal");
    }
    else{
      return("Underweight");
    }
  }
  String getInterpretation(){
    if (_bmi >= 25){
      return("You have higher than normal body weight. HIT THE JIM!");
    }
    else if (_bmi >18.5){
      return("You have normal body weight. KEEP GOING!");
    }
    else{
      return("You have a lower than normal body weight. EAT MORE MA DOOD!");
    }

  }
}