import 'package:flutter/material.dart';

class CustomCardContent extends StatelessWidget {
  final String sexText;
  final Icon icon;
  CustomCardContent({this.sexText, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(height: 15),
        Text(
          sexText,
          style: TextStyle(color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
