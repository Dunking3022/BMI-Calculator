import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  Function gestureOnTap;
  ReusableCard({@required this.colour = const Color(0xFF1D1E33),this.cardChild,this.gestureOnTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureOnTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
        child: cardChild,
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}

