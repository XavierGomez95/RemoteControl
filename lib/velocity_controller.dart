import 'package:flutter/foundation.dart';

class VelocityController extends ValueNotifier<double> {
  VelocityController(double initialValue) : super(initialValue);

  void updateVelocity(double newVelocity) {
    value = newVelocity;
    notifyListeners();

    if (newVelocity == 1.0) {
      value = 40;
    } else if (newVelocity == 2.0) {
      value = 50;
    } else if (newVelocity == 3.0) {
      value = 60;
    } else if (newVelocity == 4.0) {
      value = 70;
    } else if (newVelocity == 5.0) {
      value = 80;
    } else if (newVelocity == 6.0) {
      value = 90;
    } else if (newVelocity == 7.0) {
      value = 100;
    }
  }
}