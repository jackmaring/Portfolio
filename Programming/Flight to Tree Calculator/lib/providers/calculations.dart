import 'package:flutter/material.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_search_delegate.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/co2_calculator.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/distance_calculator.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/flight_class.dart';

enum Direction {
  departure,
  arrival,
}

enum FlightType {
  oneWay,
  roundTrip,
}

class Calculations with ChangeNotifier {
  Airport departure;
  Airport arrival;
  String flightType = 'One Way';
  String flightClass = 'Economy';
  String numOfYears = '100';
  int treeNum = 0;

  // converts string to FlightClass type
  FlightClass stringToFlightClass() {
    if (this.flightClass == 'Economy') {
      return FlightClass.economy;
    } else if (this.flightClass == 'Business') {
      return FlightClass.business;
    } else {
      return FlightClass.first;
    }
  }

  // makes sure depature and arrival aren't equal to null
  bool checkAirplanes() {
    if ((this.departure != null) && (this.arrival != null)) {
      return true;
    }
    return false;
  }

  // save an arrival or departure after a user selects it from the lookup screen
  selectAirplane(BuildContext context, AirportLookup airportLookup,
      Direction direction) async {
    Airport result = await showSearch(
      context: context,
      delegate: AirportSearchDelegate(airportLookup: airportLookup),
    );
    if (direction == Direction.departure) {
      this.departure = result;
    } else {
      this.arrival = result;
    }
    notifyListeners();
  }

  // calculates the distance between 2 airports
  double calculateDistance(Airport departure, Airport arrival) {
    double distance = DistanceCalculator.distanceInKmBetween(
        departure.location, arrival.location);
    return distance;
  }

  // calculates the distance in miles between 2 airports
  int calculateMiles(Airport departure, Airport arrival) {
    return (calculateDistance(departure, arrival) * 0.621371).round();
  }

  // calculates the tons of co2 emmitted from an airport using the distance and flight class of the passenger
  double calculateTonsCO2(double distance, FlightClass flightClass) {
    double tonsC02 = CO2Calculator.calculateCO2e(distance, flightClass) / 1000;
    return tonsC02;
  }

  // calculates the trees needed from tons of co2
  // going off the metric that it takes 4 trees per ton of CO2 per 100 years
  int calculateTrees(double tonsCo2) {
    return (tonsCo2 * 4).round();
  }

  // calculates the trees needed straight from using the airports and flight class
  int calculateAirportsToTrees(
      Airport departure, Airport arrival, FlightClass flightClass) {
    double distance = calculateDistance(departure, arrival);
    double tonsCo2 = calculateTonsCO2(distance, flightClass);
    return calculateTrees(tonsCo2);
  }

  // updates tree number displayed on home and profile page
  updateTreeNumber() {
    double doubleNumOfYears = double.parse(this.numOfYears);
    double multiplier = 100 / doubleNumOfYears;
    if ((departure != null) && (arrival != null)) {
      int treeCount =
          (calculateAirportsToTrees(departure, arrival, stringToFlightClass()) *
                  multiplier)
              .round();
      if (this.flightType == 'Round Trip') {
        treeCount *= 2;
      }
      if (treeCount == 0) {
        treeNum = 1;
      } else {
        treeNum = treeCount;
      }
    } else {
      treeNum = 0;
    }
    notifyListeners();
  }

  resetStats() {
    this.departure = null;
    this.arrival = null;
    this.flightType = 'One Way';
    this.flightClass = 'Economy';
    this.numOfYears = '100';
    this.treeNum = 0;
    notifyListeners();
  }
}
