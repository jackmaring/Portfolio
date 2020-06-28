import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/providers/calculations.dart';

class LookupButton extends StatelessWidget {
  final double height;
  final double width;
  final Text text;
  final TextStyle aiportNameStyle;
  final AirportLookup airportLookup;
  final Direction direction;

  LookupButton({
    this.height,
    this.width,
    this.text,
    this.aiportNameStyle,
    this.airportLookup,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    final calculations = Provider.of<Calculations>(context);
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Center(
            child: direction == Direction.departure
                ? calculations.departure != null
                    ? Text(
                        '${calculations.departure.iata}',
                        style: aiportNameStyle,
                      )
                    : text
                : calculations.arrival != null
                    ? Text(
                        '${calculations.arrival.iata}',
                        style: aiportNameStyle,
                      )
                    : text),
      ),
      onTap: () => calculations.selectAirplane(
        context,
        airportLookup,
        direction,
      ),
    );
  }
}
