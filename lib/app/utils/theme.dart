import 'package:flutter/material.dart';
import 'package:testprojetc/app/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeData() {
  Color primaryColor = AppColors.primaryColor;
  Color contrastColor = AppColors.contrastColor;
  Color backgroundColor = AppColors.backgroundColor;

  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: createMaterialColor(primaryColor),
    focusColor: createMaterialColor(primaryColor)[900],
    dividerColor: getTextColor(primaryColor),
    highlightColor: contrastColor,
    backgroundColor: backgroundColor,
    indicatorColor: createMaterialColor(primaryColor)[200],
    primaryColor: primaryColor,
    textTheme: TextTheme(
      button: TextStyle(
          color: getTextColor(primaryColor), fontWeight: FontWeight.bold),
      headline1: TextStyle(color: getTextColor(primaryColor)),
      headline2: TextStyle(color: getTextColor(primaryColor)),
      headline3: TextStyle(
        color: primaryColor,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

MaterialColor getTextColor(Color color) {
  int d = 0;
  double luminance = color.computeLuminance();
  if (luminance > 0.5) {
    d = 0;
  } else {
    d = 255;
  }
  return createMaterialColor(
    Color.fromARGB(color.alpha, d, d, d),
  );
}