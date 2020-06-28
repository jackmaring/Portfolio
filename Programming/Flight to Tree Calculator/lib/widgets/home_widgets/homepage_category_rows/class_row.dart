import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainibility_project/providers/calculations.dart';

import 'package:sustainibility_project/styles/custom_colors.dart';

class ClassRow extends StatefulWidget {

  @override
  _ClassRowState createState() => _ClassRowState();
}

class _ClassRowState extends State<ClassRow> {
  final List<String> options = ['Economy', 'Business', 'First Class'];
  
  @override
  Widget build(BuildContext context) {
    final calculations = Provider.of<Calculations>(context);
    String _flightClassValue = calculations.flightClass;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Class:',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(width: 60),
        Container(
          height: 65,
          width: 235,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: CustomColors.brown,
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _flightClassValue,
                onChanged: (String value) {
                  setState(() {
                    calculations.flightClass = value;
                    calculations.updateTreeNumber();
                  });
                },
                selectedItemBuilder: (context) {
                  return options.map((value) {
                    return Center(
                      child: Text(
                        _flightClassValue,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList();
                },
                items: options.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                icon: Container(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
