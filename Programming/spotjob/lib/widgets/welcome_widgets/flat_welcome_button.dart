import 'package:flutter/material.dart';

class FlatWelcomeButton extends StatelessWidget {
  final String text;
  final Function goToPage;

  FlatWelcomeButton(this.text, this.goToPage);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Hevetica',
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      onPressed: goToPage,
    );
  }
}
