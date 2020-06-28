import 'package:flutter/material.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_lookup.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/airport_search_delegate.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/flight_class.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/profile.dart';

class AdminDataTableEntry {
  String id;
  String name;
  String jobTitle;
  Airport departure;
  Airport arrival;
  String flightClass;

  AdminDataTableEntry({
    this.id,
    this.name,
    this.jobTitle,
    this.departure,
    this.arrival,
    this.flightClass,
  });

  AdminDataTableEntry.fromMap(Map<String, dynamic> data)
      : this(
          id: data['id'],
          name: data['name'],
          jobTitle: data['jobTitle'],
          departure: Airport.fromMap(data['departure']),
          arrival: Airport.fromMap(data['arrival']),
          flightClass: data['flightClass'],
        );

  Map<String, dynamic> toMap(String id) => {
        'id': id,
        'name': this.name,
        'jobTitle': this.jobTitle,
        'departure': {
          'name': this.departure.name,
          'city': this.departure.city,
          'country': this.departure.country,
          'iata': this.departure.iata,
          'location': {
            'lat': this.departure.location.latitude,
            'lon': this.departure.location.longitude,
          }
        },
        'arrival': {
          'name': this.arrival.name,
          'city': this.arrival.city,
          'country': this.arrival.country,
          'iata': this.arrival.iata,
          'location': {
            'lat': this.arrival.location.latitude,
            'lon': this.arrival.location.longitude,
          }
        },
        'flightClass': this.flightClass,
      };
}

class Admin with ChangeNotifier {
  Calculations calculations = Calculations();
  Profile profile = Profile();

  Airport departure;
  Airport arrival;
  String flightClass = 'Economy';
  String numOfYears = '100';
  bool adminOnly = true;
  bool studentTableIsVisible = false;
  bool concoDeleteisVisible = false;
  bool studentDeleteisVisible = false;

  List<AdminDataTableEntry> adminDatatableEntries = [];

  double totalMiles = 0;
  double totalCo2 = 0;
  int totalTrees = 0;
  int totalFlights = 0;
  double multiplier = 1;

  // converts string to FlightClass type
  FlightClass stringToFlightClass(String flightClass) {
    if (this.flightClass == 'Economy') {
      return FlightClass.economy;
    } else if (this.flightClass == 'Business') {
      return FlightClass.business;
    } else {
      return FlightClass.first;
    }
  }

  void makeAdminOnlyTrue() {
    adminOnly = true;
  }

  void makeAdminOnlyFalse() {
    adminOnly = false;
  }

  void updateStudentTableIsVisible() {
    studentTableIsVisible = !studentTableIsVisible;
    notifyListeners();
  }

  void updateConcoDeleteIsVisible() {
    concoDeleteisVisible = !concoDeleteisVisible;
    notifyListeners();
  }

  void updateStudentDeleteIsVisible() {
    studentDeleteisVisible = !studentDeleteisVisible;
    notifyListeners();
  }

  // adjusts multiplier for tree count number when years is modified
  adjustAdminMultiplier() {
    double doubleNumOfYears = double.parse(numOfYears);
    multiplier = 100 / doubleNumOfYears;
    notifyListeners();
  }

  // save an arrival or departure after a user selects it from the lookup screen
  selectAdminAirplane(BuildContext context, AirportLookup airportLookup,
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

  // calculates total admin flights or total admin and conco associated flights
  void calculateTotalAdminFlights(List<AdminDataTableEntry> adminEntries,
      List<ProfileDataTableEntry> profileEntries, bool adminOnly) {
    if (adminOnly) {
      totalFlights = adminEntries.length;
    } else {
      totalFlights = adminEntries.length +
          profileEntries.where((entry) => entry.isConco == true).length;
    }
    notifyListeners();
  }

  // calculates total admin miles or total admin and conco associated miles
  void calculateTotalAdminMiles(List<AdminDataTableEntry> adminEntries,
      List<ProfileDataTableEntry> profileEntries, bool adminOnly) {
    totalMiles = 0;
    if (adminOnly) {
      for (AdminDataTableEntry entry in adminEntries) {
        totalMiles +=
            calculations.calculateMiles(entry.departure, entry.arrival);
      }
    } else {
      for (AdminDataTableEntry entry in adminEntries) {
        totalMiles +=
            calculations.calculateMiles(entry.departure, entry.arrival);
      }
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.isConco == true)) {
        totalMiles +=
            calculations.calculateMiles(entry.departure, entry.arrival);
      }
    }
    notifyListeners();
  }

  // calculates total tons of co2 in admin flights or in admin and conco associated flights
  void calculateTotalAdminTonsCo2(List<AdminDataTableEntry> adminEntries,
      List<ProfileDataTableEntry> profileEntries, bool adminOnly) {
    totalCo2 = 0;
    if (adminOnly) {
      for (AdminDataTableEntry entry in adminEntries) {
        double distance =
            calculations.calculateDistance(entry.departure, entry.arrival);
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalCo2 += calculations.calculateTonsCO2(distance, flightClass);
      }
    } else {
      for (AdminDataTableEntry entry in adminEntries) {
        double distance =
            calculations.calculateDistance(entry.departure, entry.arrival);
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalCo2 += calculations.calculateTonsCO2(distance, flightClass);
      }
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.isConco == true)) {
        double distance =
            calculations.calculateDistance(entry.departure, entry.arrival);
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalCo2 += calculations.calculateTonsCO2(distance, flightClass);
      }
    }
    notifyListeners();
  }

  // calculates total trees for admin flights or for admin and conco associated flights
  void calculateTotalAdminTrees(List<AdminDataTableEntry> adminEntries,
      List<ProfileDataTableEntry> profileEntries, bool adminOnly) {
    totalTrees = 0;
    if (adminOnly) {
      for (AdminDataTableEntry entry in adminEntries) {
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalTrees += calculations.calculateAirportsToTrees(
            entry.departure, entry.arrival, flightClass);
      }
    } else {
      for (AdminDataTableEntry entry in adminEntries) {
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalTrees += calculations.calculateAirportsToTrees(
            entry.departure, entry.arrival, flightClass);
      }
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.isConco == true)) {
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalTrees += calculations.calculateAirportsToTrees(
            entry.departure, entry.arrival, flightClass);
      }
    }

    notifyListeners();
  }

  // calculate all the totals at once
  void calculateAdminTotals(List<AdminDataTableEntry> adminEntries,
      List<ProfileDataTableEntry> profileEntries, bool adminOnly) {
    calculateTotalAdminFlights(adminEntries, profileEntries, adminOnly);
    calculateTotalAdminMiles(adminEntries, profileEntries, adminOnly);
    calculateTotalAdminTonsCo2(adminEntries, profileEntries, adminOnly);
    calculateTotalAdminTrees(adminEntries, profileEntries, adminOnly);
    notifyListeners();
  }

  void resetAdminStats() {
    departure = null;
    arrival = null;
    flightClass = 'Economy';
  }
}
