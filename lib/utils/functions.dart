import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KMFunctions {

  /// Changes the status bar icons color
  static void changeStatusBarIconsColor(bool isLight, {Color? barColor}) {
    if (isLight) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: barColor ?? Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: barColor ?? Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark));
    }
  }
}
