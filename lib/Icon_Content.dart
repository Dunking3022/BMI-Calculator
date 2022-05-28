import 'package:flutter/material.dart';
class cardContent extends StatelessWidget {
  final IconData iconData;
  final String iconString;
  const cardContent({this.iconData,this.iconString});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            iconData,
            size:80
        ),
        SizedBox(
          height: 15.0,
        ),
        Text("$iconString",style: TextStyle(
          color: Color(0xFF808E98),
        ),)
      ],
    );
  }
}