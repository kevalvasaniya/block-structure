import 'package:bloc_project_structure/main.dart';
import 'package:bloc_project_structure/presentation/widgets/app_text.dart';
import 'package:bloc_project_structure/utils/images.dart';
import 'package:bloc_project_structure/utils/styles.dart';
import 'package:flutter/material.dart';

/// Separate AppBarTitle Button Function To Access In App.
PreferredSizeWidget appBarTitle({
  required String title,
  Color? titleColor,
}) {
  return AppBar(
    backgroundColor: orange,
    elevation: 0,
    centerTitle: true,
    title: appText(
      title,
      color: titleColor ?? white,
      fontSize: fontSize18,
      fontWeight: FontWeight.bold,
    ),
  );
}

/// Separate AppBarBackAndTitle Button Function To Access In App.
PreferredSizeWidget appBarBackAndTitle({
  required String title,
  Color? titleColor,
}) {
  return AppBar(
    backgroundColor: green,
    elevation: 0,
    leading: GestureDetector(
      onTap: () => Navigator.pop(navigatorKey.currentContext!),
      child: Image.asset(
        AppImages.arrowLeft,
        color: white,
        scale: 3,
      ),
    ),
    centerTitle: true,
    title: appText(
      title,
      color: titleColor ?? white,
      fontSize: fontSize18,
      fontWeight: FontWeight.bold,
    ),
  );
}

/// Separate AppBarMenuAndTitle Button Function To Access In App.
PreferredSizeWidget appBarMenuAndTitle({
  required String title,
  Color? titleColor,
  void Function()? onTap,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: green,
    centerTitle: true,
    leading: GestureDetector(
      child: const Padding(
        padding: EdgeInsets.all(padding10),
        child: Icon(Icons.menu,size: size30,color: Colors.white),
      ),
    ),
    title: appText(
      title,
      color: titleColor ?? white,
      fontWeight: FontWeight.bold,
      fontSize: size18,
    ),
    leadingWidth: size80,
  );
}

/// Separate AppbarAll Button Function To Access In App.
PreferredSizeWidget appBarAll({
  required bool isMenuButtonShow,
  required String title,
  Color? titleColor,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: green,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () => Navigator.pop(navigatorKey.currentContext!),
      child: Image.asset(
        AppImages.arrowLeft,
        color: white,
        scale: size3,
      ),
    ),
    title: appText(
      title,
      color: titleColor ?? white,
      fontWeight: FontWeight.bold,
      fontSize: size18,
    ),
    actions: [
      GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(padding10),
          child: Icon(Icons.notifications_active_outlined,size: size30,color: white),
        ),
      ),
    ],
  );
}

