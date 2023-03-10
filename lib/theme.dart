import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static const Color _lightOnPrimaryColor = Colors.white;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static const Color _lightSecondaryColor = Color.fromRGBO(168, 0, 56, 1);
  static const Color _lightOnSecondaryColor = Color.fromRGBO(26, 147, 111, 1);
  static const Color _lightOnErrorColor = Color.fromRGBO(253, 0, 84, 1);
  static const Color _lightTextColorPrimary = Color.fromRGBO(43, 32, 36, 1);
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary, fontSize: 20, fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyLargeText =
      TextStyle(color: _lightTextColorPrimary, fontSize: 12);

  static const TextStyle _lightButtonText = TextStyle(
      color: _lightTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16);

  static const TextStyle _lightTitleLargeText = TextStyle(
      color: _lightTextColorPrimary, fontWeight: FontWeight.w900, fontSize: 12);

  static const TextTheme _lightTextTheme = TextTheme(
      bodyLarge: _lightBodyLargeText,
      displayLarge: _lightHeadingText,
      labelLarge: _lightButtonText,
      titleLarge: _lightTitleLargeText);

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyLargeText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyeTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
        color: _appbarColorLight, iconTheme: IconThemeData(color: _iconColor)),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: _lightSecondaryColor,
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1, color: _lightOnErrorColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1, color: _lightOnErrorColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(width: 1.5, color: _lightSecondaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(width: 1, color: _lightTextColorPrimary)),
      disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1, color: _lightOnPrimaryColor)),
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      // primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onSecondary: _lightOnSecondaryColor,
      onError: _lightOnErrorColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      fontFamily: "Montserrat",
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _accentColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark));
}
