import 'package:flutter/material.dart';

class RaisedBlueButtonWhiteText extends StatelessWidget {
  final String name;
  final Function function;

  RaisedBlueButtonWhiteText(this.name, this.function);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        name,
        style: Theme.of(context).textTheme.button.merge(
              TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      onPressed: function,
    );
  }
}
