import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkish = ThemeData(
  //primarySwatch: mMColor,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: cHighColor,
      inversePrimary: cLightColor,
      onPrimary: cBackgroundColor,
      secondary: cHighColor,
      onSecondary: cBackgroundColor,
      tertiary: cLightColor,
      onTertiary: cBackgroundColor,
      error: cHighColor,
      onError: cBackgroundColor,
      errorContainer: cHighColor,
      onErrorContainer: cBackgroundColor,
      background: cBackgroundColor,
      onBackground: cHighColor,
      surface: cLightColor,
      inverseSurface: cHighColor,
      onInverseSurface: cBackgroundColor,
      onSurface: cBackgroundColor),
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: cBackgroundColor,
  //scrollbarTheme: ScrollbarThemeData(),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(
        color: cBackgroundColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w900,
        fontSize: 18),
    backgroundColor: cHighColor,
    elevation: 20,
    actionTextColor: cBackgroundColor,
    disabledActionTextColor: cBackgroundColor,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    displayLarge: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    displayMedium: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    titleSmall: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    bodySmall: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    labelSmall: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
  ),
  appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      //elevation: 20,
      shape: Border(bottom: BorderSide(color: cLightColor, width: 1))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: cLightColor, backgroundColor: cHighColor, textStyle:
              const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
          elevation: 7,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: cLightColor)))),
  /*elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cHighColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))))),
          dividerTheme: DividerThemeData(color: cLightColor),
          iconTheme: IconThemeData(color: cLightColor)*/
);

ThemeData lightish = ThemeData();
