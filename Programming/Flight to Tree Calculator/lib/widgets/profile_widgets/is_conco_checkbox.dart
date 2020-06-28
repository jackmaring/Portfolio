import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/providers/profile.dart';

class IsConcoCheckBox extends StatefulWidget {
  @override
  _IsConcoCheckBoxState createState() => _IsConcoCheckBoxState();
}

class _IsConcoCheckBoxState extends State<IsConcoCheckBox> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    return Checkbox(
      activeColor: Theme.of(context).accentColor,
      checkColor: Colors.white,
      value: profile.isConco,
      onChanged: (val) {
        setState(() {
          profile.isConco = val;
        });
      },
    );
  }
}
