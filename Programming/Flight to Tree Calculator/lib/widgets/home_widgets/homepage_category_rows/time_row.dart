import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainibility_project/providers/calculations.dart';

import 'package:sustainibility_project/styles/custom_colors.dart';

class TimeRow extends StatefulWidget {
  @override
  _TimeRowState createState() => _TimeRowState();
}

class _TimeRowState extends State<TimeRow> {
  List<String> options = [
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100'
  ];

  @override
  Widget build(BuildContext context) {
    final calculations = Provider.of<Calculations>(context);
    String _timeValue = calculations.numOfYears;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Time:',
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
                value: _timeValue,
                onChanged: (String value) {
                  setState(() {
                    calculations.numOfYears = value;
                    calculations.updateTreeNumber();
                  });
                },
                selectedItemBuilder: (context) {
                  return options.map((value) {
                    return Center(
                      child: Text(
                        '$_timeValue Years',
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
