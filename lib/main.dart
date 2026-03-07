import 'package:flutter/material.dart';
import 'package:topup_app/dependency_injection.dart' as dependency_injection;
import 'app/app.dart';

void main() async {
  await dependency_injection.init();
  runApp(App());
}
