// ignore_for_file: non_constant_identifier_names

import 'package:bloc_project_structure/utils/styles.dart';
import 'package:flutter/material.dart';

/// Separate CircularProgressIndicator Function To Access In App
Widget circularProgress(){
  return const Center(child: CircularProgressIndicator(color: orange,strokeWidth: 1.5),);
}

/// Separate Assets Images Function To Access In App
class AppAssetIcon extends StatefulWidget {
  final String path;
  final double height, width;
  final BoxFit? fit;

  const AppAssetIcon(this.path,
      {Key? key, this.height = 28, this.width = 28, this.fit})
      : super(key: key);

  @override
  State<AppAssetIcon> createState() => _AppAssetIconState();
}

class _AppAssetIconState extends State<AppAssetIcon> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.path,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
    );
  }
}