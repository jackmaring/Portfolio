import 'package:flutter/services.dart' show rootBundle;
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';

class AirportDataReader {
  static Future<List<Airport>> load(String path) async {
    final data = await rootBundle.loadString(path);
    return data.split('\n')
        .map((line) => Airport.fromLine(line))
        .where((airport) => airport != null)
        .toList();
  }
}
