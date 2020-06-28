import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Accept the SpotJob Terms and Conditions.',
          style: TextStyle(
            fontFamily: 'Hevetica',
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
      ],
    );
  }
}
