import 'package:bloc_project_structure/presentation/widgets/app_text.dart';
import 'package:bloc_project_structure/presentation/widgets/space_widget.dart';
import 'package:bloc_project_structure/utils/styles.dart';
import 'package:flutter/material.dart';

/// Separate BigButton Function To Access In App.
Widget appButtonBig({
  required String text,
  required Function() onTap,
  bool isOnlyBorder = false,
  String? image,
  Color? iconColor,
  Color? color,
  double? width,
  double? height,
  double? textSize,
  FontWeight? textWidget,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? size64,
      width: width ?? size327,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isOnlyBorder ? white : color ?? orange,
        borderRadius: BorderRadius.circular(size32),
        border: isOnlyBorder
            ? Border.all(
                width: 1.5,
                color: green,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Row(
              children: [
                Image.asset(
                  image,
                  color: iconColor,
                  height: size33,
                ),
                const HorizontalSpace(space: size10),
              ],
            ),
          appText(
            text.toUpperCase(),
            style: isOnlyBorder
                ? defaultAppTextStyle(
                    color: green,
                    fontSize: textSize ?? fontSize16,
                    fontWeight: textWidget ?? titleTextWeight600,
                  )
                : defaultAppTextStyle(
                    color: white,
                    fontSize: textSize ?? fontSize16,
                    fontWeight: textWidget ?? titleTextWeight600),
          ),
        ],
      ),
    ),
  );
}

/// Separate SmallButton Function To Access In App.
Widget appButton({
  required String title,
  required Function() onTap,
  double? width,
  double? height,
  double? textSize,
  FontWeight? textWidget,
  bool isBorderOnly = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width ?? size92,
      height: height ?? size28,
      decoration: BoxDecoration(
        color: isBorderOnly ? white : green,
        borderRadius: BorderRadius.circular(size5),
        border: isBorderOnly
            ? Border.all(
                color: green,
                width: size1,
              )
            : null,
      ),
      child: Center(
        child: appText(
          title,
          style: isBorderOnly
              ? defaultAppTextStyle(
                  color: green,
                  fontSize: textSize ?? fontSize12,
                  fontWeight: textWidget ?? mediumTextWeight500,
                )
              : defaultAppTextStyle(
                  color: Colors.white,
                  fontSize: textSize ?? fontSize12,
                  fontWeight: textWidget ?? mediumTextWeight500,
                ),
        ),
      ),
    ),
  );
}
