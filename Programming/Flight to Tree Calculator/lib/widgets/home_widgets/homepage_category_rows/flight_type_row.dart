import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustainibility_project/providers/calculations.dart';

import 'package:sustainibility_project/styles/custom_colors.dart';

class FlightTypeRow extends StatefulWidget {

  @override
  _FlightTypeRowState createState() => _FlightTypeRowState();
}

class _FlightTypeRowState extends State<FlightTypeRow> {
  List<String> options = ['One Way', 'Round Trip'];

  @override
  Widget build(BuildContext context) {
    final calculations = Provider.of<Calculations>(context);
    String _flightTypeValue = calculations.flightType;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Flight Type:',
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
                value: _flightTypeValue,
                onChanged: (String value) {
                  setState(() {
                    calculations.flightType = value;
                    calculations.updateTreeNumber();
                  });
                },
                selectedItemBuilder: (context) {
                  return options.map((value) {
                    return Center(
                      child: Text(
                        _flightTypeValue,
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
