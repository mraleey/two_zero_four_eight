import 'package:flutter/material.dart';

class ResponsiveSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late Orientation orientation;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    orientation = _mediaQueryData.orientation;

    if (orientation == Orientation.portrait) {
      screenHeight = _mediaQueryData.size.height;
      screenWidth = _mediaQueryData.size.width;
    } else {
      screenHeight = _mediaQueryData.size.width;
      screenWidth = _mediaQueryData.size.height;
    }

    screenW = screenWidth;
    screenH = screenHeight;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}

double getScreenHeight(double inputHeight) {
  return (inputHeight / 812) * ResponsiveSize.screenHeight;
}

double getScreenWidth(double inputWidth) {
  return (inputWidth / 375) * ResponsiveSize.screenWidth;
}

double getTextSize(double inputSize) {
  return (inputSize / 812) * ResponsiveSize.screenHeight;
}

Widget getVerticalSpace(double height) {
  return SizedBox(height: getScreenHeight(height));
}

Widget getHorizontalSpace(double width) {
  return SizedBox(width: getScreenWidth(width));
}
