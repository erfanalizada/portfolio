import 'package:flutter/material.dart';

class ScreenSize {
  /// Returns the screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the full Size object (width & height)
  static Size getScreenWidthHeightSizes(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
