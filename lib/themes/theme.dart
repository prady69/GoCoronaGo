import 'package:flutter/material.dart';

import 'dark_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData darkTheme = ThemeData(
    backgroundColor: DarkColor.background,
    fontFamily: 'OpenSans',
    primaryColor: DarkColor.background,
    cardTheme: CardTheme(color: DarkColor.boxColor),
    bottomAppBarColor: DarkColor.boxColor,
    dividerColor: DarkColor.divider,
  );

  static TextStyle titleStyle = const TextStyle(
      color: DarkColor.titleTextColor, fontSize: 25, fontFamily: 'OpenSans');

  static TextStyle headlineTitle = const TextStyle(
      color: DarkColor.titleTextColor,
      fontSize: 15,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w600);

  static TextStyle headlineSource = const TextStyle(
      fontSize: 13,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: DarkColor.background);

  static TextStyle headlineDate = const TextStyle(
      fontSize: 10,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: DarkColor.background);

  static TextStyle statsCountNumber = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
  );

  static TextStyle legendsStyle = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.normal, color: DarkColor.background);

  static TextStyle totalConfirmedCasesLabel =
      const TextStyle(fontSize: 10, color: DarkColor.confirmedCasesBox);

  static TextStyle countryTextStyle =
      const TextStyle(fontSize: 16, color: DarkColor.countryText);

  static TextStyle subTitleStyle = const TextStyle(
      color: DarkColor.subTitleTextColor, fontSize: 18, fontFamily: 'OpenSans');
  static TextStyle smallDescriptionTextStyle = const TextStyle(
      color: DarkColor.subTitleTextColor, fontSize: 14, fontFamily: 'OpenSans');
  static TextStyle bigTitleTextStyle = const TextStyle(
      color: DarkColor.subTitleTextColor, fontSize: 40, fontFamily: 'OpenSans');

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
