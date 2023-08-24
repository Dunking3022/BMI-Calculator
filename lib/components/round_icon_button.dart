import 'package:flutter/material.dart';
import 'constants.dart';
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
