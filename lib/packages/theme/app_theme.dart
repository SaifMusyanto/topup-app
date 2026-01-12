import 'package:flutter/material.dart';
import 'package:topup_app/packages/theme/app_style.dart';
import '../constants/color_values.dart';
import 'custom_colors.dart';

/// Centralized theme class for the application.
///
/// This class consumes the static palette from `AppColors` and maps it
/// to the dynamic `ThemeData` for both light and dark modes. It correctly
/// populates the standard `ColorScheme` and the app-specific `CustomColors`
/// theme extension.
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  /// The primary seed color derived from the brand palette.
  static const _seedColor = AppColors.primary50;

  /// Light theme custom color palette.
  static const _lightCustomColors = CustomColors(
    success: AppColors.success50,
    onSuccess: AppColors.white,
    successContainer: AppColors.success10,
    onSuccessContainer: AppColors.success90,
    danger: AppColors.danger50,
    onDanger: AppColors.white,
    dangerContainer: AppColors.danger10,
    onDangerContainer: AppColors.danger90,
    infoContainer: AppColors.info10,
    onInfoContainer: AppColors.grey70,
  );

  /// --- Light Theme ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primary50,
          onPrimary: AppColors.white,
          surface: AppColors.grey05,
          onSurface: AppColors.text50,
          error: AppColors.danger50,
          onError: AppColors.white,
          outline: AppColors.grey10,
        ),
    extensions: const <ThemeExtension<dynamic>>[_lightCustomColors],
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.grey05,
      foregroundColor: AppColors.text50,
    ),
    textTheme: AppStyles.textTheme.apply(
      bodyColor: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ).onSurface,
      displayColor: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ).onSurface,
    ),
  );
}
