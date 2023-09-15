import 'package:flutter/material.dart';

const cBackgroundColor = Color.fromARGB(255, 46, 46, 46);
const cHighColor = Color.fromARGB(255, 247, 98, 54);
const cLightColor = Color.fromARGB(255, 255, 230, 215);

Map<int, Color> mColor = {
  50: const Color.fromRGBO(247, 98, 54, .1),
  100: const Color.fromRGBO(247, 98, 54, .2),
  200: const Color.fromRGBO(247, 98, 54, .3),
  300: const Color.fromRGBO(247, 98, 54, .4),
  400: const Color.fromRGBO(247, 98, 54, .5),
  500: const Color.fromRGBO(247, 98, 54, .6),
  600: const Color.fromRGBO(247, 98, 54, .7),
  700: const Color.fromRGBO(247, 98, 54, .8),
  800: const Color.fromRGBO(247, 98, 54, .9),
  900: const Color.fromRGBO(247, 98, 54, 1),
};

MaterialColor mMColor = MaterialColor(0xFFF76236, mColor);
