import 'package:flutter/material.dart';

import 'welcome_text_field.dart';

class LogInTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            WelcomeTextField('username'),
            WelcomeTextField('password'),
          ],
        ),
      ),
    );
  }
}
