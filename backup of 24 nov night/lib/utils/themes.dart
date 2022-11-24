import 'package:flutter/cupertino.dart';
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
  snackBarTheme: SnackBarThemeData(
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
  textTheme: TextTheme(
    button: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline1: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline2: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline4: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline5: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    headline6: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    subtitle1: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    subtitle2: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    bodyText1: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    caption: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    overline: TextStyle(
        color: cLightColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
  ),
  appBarTheme: AppBarTheme(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      //elevation: 20,
      shape: Border(bottom: BorderSide(color: cLightColor, width: 1))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
          primary: cHighColor,
          onPrimary: cLightColor,
          elevation: 7,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: cLightColor)))),
  /*elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cHighColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))))),
          dividerTheme: DividerThemeData(color: cLightColor),
          iconTheme: IconThemeData(color: cLightColor)*/
);

ThemeData lightish = ThemeData();
