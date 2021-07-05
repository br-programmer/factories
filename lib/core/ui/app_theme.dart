import 'package:factories/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

/// The `AppTheme` class is in charge of the application themes.
class AppTheme {
  /// `Light Theme` of the application.
  static ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.green,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.green,
    ),
  );
}
