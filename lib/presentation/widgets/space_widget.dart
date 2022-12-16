import 'package:flutter/material.dart';

/// Separate VerticalSpace Class To Access In App.
class VerticalSpace extends StatelessWidget {
  final double space;

  const VerticalSpace({Key? key, this.space = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

/// Separate HorizontalSpace Class To Access In App.
class HorizontalSpace extends StatelessWidget {
  final double space;

  const HorizontalSpace({Key? key, this.space = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
