import 'package:bloc_project_structure/utils/styles.dart';
import 'package:bloc_project_structure/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appText(
  String data, {
  TextStyle? style,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextAlign? textAlign,
  TextDecorationStyle? decorationStyle,
  int? maxLines,
  bool shadows = false,
}) {
  return Text(
    data,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    style: style ??
        TextStyle(
          color: color ?? black,
          fontFamily: FontFamilies.galanoClassic,
          fontWeight: fontWeight,
          fontSize: fontSize ?? fontSize14,
          decorationStyle: decorationStyle,
        ),
  );
}

TextStyle defaultAppTextStyle({
  TextStyle? style,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextDecorationStyle? decorationStyle,
}) {
  return TextStyle(
    color: color,
    fontFamily: FontFamilies.galanoClassic,
    fontWeight: fontWeight,
    fontSize: fontSize,
    decorationStyle: decorationStyle,
  );
}
