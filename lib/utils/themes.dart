import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Default Android And IOS Themes Class.
class Themes {
  static ThemeData defaultTheme() => ThemeData(
        primaryColor: const Color.fromRGBO(132, 216, 16, 1),
        disabledColor: const Color.fromRGBO(185, 185, 185, 1),
        fontFamily: FontFamilies.sfProText,
        primaryTextTheme: const TextTheme(
          headline3: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          headline5: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          button: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      );

  static CupertinoThemeData cupertinoTheme() => CupertinoThemeData(
      primaryColor: defaultTheme().primaryColor,
      textTheme: const CupertinoTextThemeData());

  static ThemeData materialTheme() => defaultTheme();
}

/// Separate Font Family Class.
class FontFamilies {
  static const String sfProText = 'SFProText';

  static const String galanoClassic = 'GalanoClassic';

  static const String sfUIText = 'SFUIText';

  static const String sourceSansPro = 'SourceSansPro';
}
