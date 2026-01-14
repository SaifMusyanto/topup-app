import 'package:core_ui/src/theme/custom_colors.dart';
import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  CustomColors get customColors => theme.extension<CustomColors>()!;
}
