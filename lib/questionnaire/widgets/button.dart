import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  final bool isPrimary;

  Button.primary({
    @required this.buttonLabel,
    @required this.onPressed,
  }) : isPrimary = true;

  Button.accent({
    @required this.buttonLabel,
    @required this.onPressed,
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: isPrimary ? Theme.of(context).primaryColor :Color(0xFF767676),
      shape: isPrimary
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFF767676),
              ),
            ),
      child: Text(
        buttonLabel,
        style: isPrimary
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color:Color(0xFF17262A),
              )
            : TextStyle(
                fontWeight: FontWeight.w700,
              ),
      ),
      onPressed: onPressed,
    );
  }
}
