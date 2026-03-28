import 'package:flutter/material.dart';

class Responsive {
  static int columns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 900) return 3; // desktop
    if (width >= 600) return 2; // tablet
    return 1; // mobile
  }
}
