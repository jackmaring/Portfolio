import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/styles/custom_colors.dart';

class FlightClassDropDownButton extends StatefulWidget {
  @override
  _FlightClassDropDownButtonState createState() =>
      _FlightClassDropDownButtonState();
}

class _FlightClassDropDownButtonState extends State<FlightClassDropDownButton> {
  final List<String> options = ['Economy', 'Business', 'First Class'];

  @override
  Widget build(BuildContext context) {
    final calculations = Provider.of<Calculations>(context);
    String _flightClassValue = calculations.flightClass;
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        // color: Theme.of(context).accentColor,
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
                    style: Theme.of(context).textTheme.button,
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
    );
  }
}
