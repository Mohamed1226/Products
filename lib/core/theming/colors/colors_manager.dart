import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

abstract class ColorsManager {
  static final DarkColors _dark = DarkColors();
  static final LightColors _light = LightColors();

  static bool get isDarkMode => false;

  static ColorsManager get defaultInstance => isDarkMode ? _dark : _light;

  static ColorsManager instance(BuildContext context) =>
      isDarkMode ? _dark : _light;

  late Color primaryColor;
  late Color buttonColor;
}

class AppFixedColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color transparent = Colors.transparent;
  static const Color openGreen = Colors.green;
  static const Color openYellow = Colors.yellow;
  static const Color darkGrey2 = Colors.grey;
  static const Color primaryColor = const Color(0xff005239);

  static const Color secondaryColor1 = const Color(0xffB7CFC7);

  static const Color secondaryColor2 = const Color(0xffE5EEEB);

  static const Color secondaryColor3 = const Color(0xffB7CFC7);

  static const Color cardBG = Color(0xffE5EEEB);
}
