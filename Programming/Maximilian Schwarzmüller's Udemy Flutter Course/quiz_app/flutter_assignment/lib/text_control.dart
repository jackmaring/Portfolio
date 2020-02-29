import 'package:flutter/material.dart';

import 'text.dart';



class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {  
  var _textToBeChanged = "Press the button to change the text!";

  void _changeText(String text) {
    setState(() {
      _textToBeChanged = "You changed the text!";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Press Me'),
            onPressed: () => _changeText(_textToBeChanged),
          ),
          TextToBeChanged(_textToBeChanged),
        ],
      );
  }
}