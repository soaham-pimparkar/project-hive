//colours:

import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 255, 203, 116);
const lightColor = Color.fromARGB(255, 246, 246, 246);
const darkColor = Color.fromARGB(255, 47, 47, 47);

Map<int, Color> mColor = {
  50: const Color.fromRGBO(255, 203, 116, .1),
  100: const Color.fromRGBO(255, 203, 116, .2),
  200: const Color.fromRGBO(255, 203, 116, .3),
  300: const Color.fromRGBO(255, 203, 116, .4),
  400: const Color.fromRGBO(255, 203, 116, .5),
  500: const Color.fromRGBO(255, 203, 116, .6),
  600: const Color.fromRGBO(255, 203, 116, .7),
  700: const Color.fromRGBO(255, 203, 116, .8),
  800: const Color.fromRGBO(255, 203, 116, .9),
  900: const Color.fromRGBO(255, 203, 116, 1),
};

MaterialColor mMColor = MaterialColor(0xFFFFCB74, mColor);
