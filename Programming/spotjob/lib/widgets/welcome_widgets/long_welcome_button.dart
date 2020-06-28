import 'package:flutter/material.dart';

class LongWelcomeButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final Function function;

  LongWelcomeButton(this.icon, this.name, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
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
        onPressed: function,
      ),
    );
  }
}
