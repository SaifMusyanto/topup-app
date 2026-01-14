import 'package:core_ui/src/constants/color.dart';
import 'package:core_ui/src/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'custom_colors.dart';

class AppTheme {
  AppTheme._();

  static const _seedColor = ColorValues.primary50;

  static const _lightCustomColors = CustomColors(
    success: ColorValues.success50,
    onSuccess: ColorValues.white,
    successContainer: ColorValues.success10,
    onSuccessContainer: ColorValues.success90,
    danger: ColorValues.danger50,
    onDanger: ColorValues.white,
    dangerContainer: ColorValues.danger10,
    onDangerContainer: ColorValues.danger90,
    infoContainer: ColorValues.info,
    onInfoContainer: ColorValues.grey70,
    formBackground: ColorValues.neutral30,
    formBorder: ColorValues.secondary10,
    formIcon: ColorValues.grey50,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorValues.neutral30,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ).copyWith(
          primary: ColorValues.primary50,
          onPrimary: ColorValues.white,
          surface: ColorValues.grey05,
          onSurface: ColorValues.text50,
          error: ColorValues.danger50,
          onError: ColorValues.white,
          outline: ColorValues.grey10,
          outlineVariant: ColorValues.grey100,
          secondary: ColorValues.secondary50,
        ),
    extensions: const <ThemeExtension<dynamic>>[_lightCustomColors],
    iconTheme: IconThemeData(color: ColorValues.grey50),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorValues.grey05,
      foregroundColor: ColorValues.text50,
      scrolledUnderElevation: 0,
    ),
    dividerColor: ColorValues.grey100,
    dividerTheme: DividerThemeData(color: ColorValues.grey100, thickness: 2),
    textTheme: TextStyles.textTheme.apply(
      bodyColor: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ).onSurface,
      displayColor: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ).onSurface,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorValues.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty<IconThemeData>.fromMap({
        WidgetState.selected: IconThemeData(
          color: ColorValues.primary50,
          size: 20,
        ),
        WidgetState.focused: IconThemeData(
          color: ColorValues.primary50,
          size: 20,
        ),
        WidgetState.any: IconThemeData(color: ColorValues.grey30, size: 20),
      }),
      labelTextStyle: WidgetStateProperty<TextStyle>.fromMap({
        WidgetState.selected: TextStyles.textTheme.titleMedium!,
        WidgetState.focused: TextStyles.textTheme.titleMedium!,
        WidgetState.any: TextStyles.textTheme.titleMedium!.copyWith(
          color: ColorValues.grey30,
          fontWeight: FontWeight.w500,
        ),
      }),
    ),
  );
}
