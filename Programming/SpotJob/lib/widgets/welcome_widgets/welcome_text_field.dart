import 'package:flutter/material.dart';

class WelcomeTextField extends StatelessWidget {
  final String placeHolderText;

  WelcomeTextField(this.placeHolderText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: placeHolderText,
        contentPadding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
      ),
    );
  }
}
