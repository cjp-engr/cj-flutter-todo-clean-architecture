import 'package:flutter/material.dart';

class SizeConfig {
  static double screenSize(
    BuildContext context,
    double small,
    double medium,
    double large,
  ) {
    if (MediaQuery.of(context).size.width < 800) {
      return small;
    } else if (MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1000) {
      return medium;
    } else {
      return large;
    }
  }
}
