import 'package:flutter/material.dart';

import 'package:sustainibility_project/C02_flight_calculator_plugin/airport.dart';
import 'package:sustainibility_project/C02_flight_calculator_plugin/flight_class.dart';
import 'package:sustainibility_project/providers/calculations.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';

class ProfileDataTableEntry {
  String id;
  String uid;
  Airport departure;
  Airport arrival;
  String flightClass;
  bool isConco;

  ProfileDataTableEntry({
    this.id,
    this.uid,
    this.departure,
    this.arrival,
    this.flightClass,
    this.isConco,
  });

  ProfileDataTableEntry.fromMap(Map<String, dynamic> data)
      : this(
          id: data['id'],
          uid: data['uid'],
          departure: Airport.fromMap(data['departure']),
          arrival: Airport.fromMap(data['arrival']),
          flightClass: data['flightClass'],
          isConco: data['isConco'],
        );

  Map<String, dynamic> toMap(String id) => {
        'id': id,
        'uid': this.uid,
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
        'isConco': this.isConco,
      };
}

class Profile with ChangeNotifier {
  ProfileCRUDModel crud = ProfileCRUDModel();
  Calculations calculations = Calculations();
  String numOfYears = '100';
  bool isConco = false;
  bool concoOnly = false;
  bool deleteIsVisible = false;

  double totalMiles = 0;
  double totalCo2 = 0;
  int totalTrees = 0;
  int totalFlights = 0;
  double multiplier = 1;

  // takes a FlightClass type and converts it into a string
  String flightClassToString(FlightClass flightClass) {
    if (flightClass == FlightClass.economy) {
      return 'Economy';
    } else if (flightClass == FlightClass.business) {
      return 'Business';
    } else {
      return 'First';
    }
  }

  // takes a string and converts it into a FlightClass type
  FlightClass stringToFlightClass(String flightClass) {
    if (flightClass == 'Economy') {
      return FlightClass.economy;
    } else if (flightClass == 'Business') {
      return FlightClass.business;
    } else {
      return FlightClass.first;
    }
  }

  void updateIsConco() {
    isConco = !isConco;
  }

  void makeConcoOnlyTrue() {
    concoOnly = true;
    notifyListeners();
  }

  void makeConcoOnlyFalse() {
    concoOnly = false;
    notifyListeners();
  }

  void updateDeleteIsVisible() {
    deleteIsVisible = !deleteIsVisible;
    notifyListeners();
  }

  adjustMultiplier() {
    double doubleNumOfYears = double.parse(numOfYears);
    multiplier = 100 / doubleNumOfYears;
    notifyListeners();
  }

  // calculates all user flights or only conco associated user flights
  void calculateTotalProfileFlights(
      List<ProfileDataTableEntry> profileEntries, bool concoOnly, String uid) {
    if (concoOnly) {
      totalFlights = profileEntries
          .where((entry) => entry.isConco == true && uid == entry.uid)
          .length;
    } else {
      totalFlights = profileEntries.where((entry) => uid == entry.uid).length;
    }
    notifyListeners();
  }

  // calculates all user flight miles or only conco associated user flight miles
  void calculateTotalProfileMiles(
      List<ProfileDataTableEntry> profileEntries, bool concoOnly, String uid) {
    totalMiles = 0;
    if (concoOnly) {
      for (ProfileDataTableEntry entry in profileEntries
          .where((entry) => entry.isConco == true && entry.uid == uid)) {
        totalMiles +=
            calculations.calculateMiles(entry.departure, entry.arrival);
      }
    } else {
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.uid == uid)) {
        totalMiles +=
            calculations.calculateMiles(entry.departure, entry.arrival);
      }
    }
    notifyListeners();
  }

  // calculates all user flight tons of co2 or only conco associated user flight tons of co2
  void calculateTotalProfileTonsCo2(
      List<ProfileDataTableEntry> profileEntries, bool concoOnly, String uid) {
    totalCo2 = 0;
    if (concoOnly) {
      for (ProfileDataTableEntry entry in profileEntries
          .where((entry) => entry.isConco == true && entry.uid == uid)) {
        double distance =
            calculations.calculateDistance(entry.departure, entry.arrival);
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalCo2 += calculations.calculateTonsCO2(distance, flightClass);
      }
    } else {
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.uid == uid)) {
        double distance =
            calculations.calculateDistance(entry.departure, entry.arrival);
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalCo2 += calculations.calculateTonsCO2(distance, flightClass);
      }
    }
    notifyListeners();
  }

  // calculates the total amount of trees for user flights or only the trees for conco associated user flights
  void calculateTotalProfileTrees(
      List<ProfileDataTableEntry> profileEntries, bool concoOnly, String uid) {
    totalTrees = 0;
    if (concoOnly) {
      for (ProfileDataTableEntry entry in profileEntries
          .where((entry) => entry.isConco == true && entry.uid == uid)) {
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalTrees += calculations.calculateAirportsToTrees(
            entry.departure, entry.arrival, flightClass);
      }
    } else {
      for (ProfileDataTableEntry entry
          in profileEntries.where((entry) => entry.uid == uid)) {
        FlightClass flightClass = stringToFlightClass(entry.flightClass);
        totalTrees += calculations.calculateAirportsToTrees(
            entry.departure, entry.arrival, flightClass);
      }
    }
    notifyListeners();
  }

  // calculates all profile totals at once
  void calculateProfileTotals(
      List<ProfileDataTableEntry> profileEntries, bool concoOnly, String uid) {
    calculateTotalProfileFlights(profileEntries, concoOnly, uid);
    calculateTotalProfileMiles(profileEntries, concoOnly, uid);
    calculateTotalProfileTonsCo2(profileEntries, concoOnly, uid);
    calculateTotalProfileTrees(profileEntries, concoOnly, uid);
    notifyListeners();
  }
}
