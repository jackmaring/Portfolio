import 'package:flutter/material.dart';

class TextToBeChanged extends StatelessWidget {
  final String text;

  TextToBeChanged(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}