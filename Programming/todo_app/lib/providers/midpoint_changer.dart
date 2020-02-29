import 'package:flutter/material.dart';

enum Midpoint {
  High,
  MidHigh,
  Mid,
  MidLow,
  Low,
}

class MidpointChanger with ChangeNotifier {
  Midpoint midpoint;

  Midpoint get currentMidpoint {
    return midpoint;
  }

  void setMidpoint(Midpoint newMidpoint) {
    midpoint = newMidpoint;
  }

  void goUp() {
    switch (midpoint) {
      case Midpoint.Low:
        midpoint = Midpoint.MidLow;
        break;
      case Midpoint.MidLow:
        midpoint = Midpoint.Mid;
        break;
      case Midpoint.Mid:
        midpoint = Midpoint.MidHigh;
        break;
      case Midpoint.MidHigh:
        midpoint = Midpoint.High;
        break;
      case Midpoint.High:
        midpoint = Midpoint.High;
        break;
    }
    notifyListeners();
    print('midpoint is now ' + midpoint.toString());
  }

  void goDown() {
    switch (midpoint) {
      case Midpoint.Low:
        midpoint = Midpoint.Low;
        break;
      case Midpoint.MidLow:
        midpoint = Midpoint.Low;
        break;
      case Midpoint.Mid:
        midpoint = Midpoint.MidLow;
        break;
      case Midpoint.MidHigh:
        midpoint = Midpoint.Mid;
        break;
      case Midpoint.High:
        midpoint = Midpoint.MidHigh;
        break;
    }
    notifyListeners();
    print('midpoint is now ' + midpoint.toString());
  }

  double calculateToDoHeight(BoxConstraints constraints) {
    double height;
    switch (midpoint) {
      case Midpoint.Low:
        height = constraints.maxHeight * 1 - 150;
        break;
      case Midpoint.MidLow:
        height = constraints.maxHeight * 0.75 - 100;
        break;
      case Midpoint.Mid:
        height = constraints.maxHeight * 0.5 - 75;
        break;
      case Midpoint.MidHigh:
        height = constraints.maxHeight * 0.25 - 50;
        break;
      case Midpoint.High:
        height = constraints.maxHeight * 0;
        break;
    }
    notifyListeners();
    print('to do height is: $height');
    return height;
  }

  double calculateGoalsHeight(BoxConstraints constraints) {
    double height;
    switch (midpoint) {
      case Midpoint.Low:
        height = constraints.maxHeight * 0;
        break;
      case Midpoint.MidLow:
        height = constraints.maxHeight * 0.25 - 50;
        break;
      case Midpoint.Mid:
        height = constraints.maxHeight * 0.5 - 75;
        break;
      case Midpoint.MidHigh:
        height = constraints.maxHeight * 0.75 - 100;
        break;
      case Midpoint.High:
        height = constraints.maxHeight * 1 - 150;
        break;
    }
    notifyListeners();
    print('goals height is: $height');
    return height;
  }
}
