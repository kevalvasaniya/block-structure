import 'package:flutter/foundation.dart';

/// An abstract class allows you to create functionality that subclasses can implement or override.
/// This class is only for define.
abstract class HomeAbstraction {
  @protected
  Future<dynamic> getHomeAPIData();
}
