import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:flutter/material.dart';

class Thememodel {
  final ligtmode = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: ColorValueManager.kBlueColor),
    ),
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorValueManager.kSecendryColorThemeLight,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorValueManager.kPrimaryColorThemeLight),
    scaffoldBackgroundColor: ColorValueManager.kPrimaryColorThemeLight,
    primaryColor: ColorValueManager.kSecendryColorThemeLight,
    primaryColorDark: ColorValueManager.kWhiteColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: FontSizeValueManager.fontZV16,
        color: ColorValueManager.kSecendryColorThemeLight,
      ),
      titleMedium: TextStyle(
        fontSize: FontSizeValueManager.fontZV16,
        color: ColorValueManager.kWhiteColor,
      ),
    ),
  );
  final darkmode = ThemeData(
    useMaterial3: false,
    primaryColor: ColorValueManager.kSecendryColorThemeDark,
    primaryColorDark: ColorValueManager.kWhiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorValueManager.kSecendryColorThemeDark,
    ),
    scaffoldBackgroundColor: ColorValueManager.kPrimaryColorThemeDark,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorValueManager.kSecendryColorThemeDark,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorValueManager.kSecendryColorThemeDark,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: FontSizeValueManager.fontZV16,
        color: ColorValueManager.kSecendryColorThemeDark,
      ),
      titleMedium: TextStyle(
        fontSize: FontSizeValueManager.fontZV16,
        color: ColorValueManager.kWhiteColor,
      ),
    ),
  );
}
