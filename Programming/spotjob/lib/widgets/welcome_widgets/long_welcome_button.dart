import 'package:flutter/material.dart';

class LongWelcomeButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final Function goToPage;

  LongWelcomeButton(this.icon, this.name, this.goToPage);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
