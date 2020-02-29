import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final Function goToPage;

  WelcomeButton(this.icon, this.name, this.goToPage);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          icon,
          Text(
            name,
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
      onPressed: goToPage,
    );
  }
}
