import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const rounded8 = BorderRadius.all(Radius.circular(8));
  static const rounded16 = BorderRadius.all(Radius.circular(16));

  static const shapeRounded16 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
}
