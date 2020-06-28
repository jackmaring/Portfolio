import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/co2_calculator.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/distance_calculator.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/flight_details.dart';

class FlightCalculationData {
  FlightCalculationData({this.distanceKm, this.co2e});
  final double distanceKm;
  final double co2e;
}

FlightCalculationData _calculate(FlightDetails flightDetails) {
  double distanceKm;
  double co2e;
  Airport departure = flightDetails.departure;
  Airport arrival = flightDetails.arrival;
  if (departure != null && arrival != null) {
    double multiplier =
        flightDetails.flightType == FlightType.oneWay ? 1.0 : 2.0;
    distanceKm = DistanceCalculator.distanceInKmBetween(
        departure.location, arrival.location);
    distanceKm = CO2Calculator.correctedDistanceKm(distanceKm);
    co2e =
        CO2Calculator.calculateCO2e(distanceKm, flightDetails.flightClass) *
            multiplier;
  }
  return FlightCalculationData(distanceKm: distanceKm, co2e: co2e);
}