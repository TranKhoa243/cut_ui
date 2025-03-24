import 'package:flutter/material.dart';

bool isSceneLargerThanIphone5({required BuildContext context}) {
  return MediaQuery.of(context).size.width > 320;
}

bool isScreenLarge({required BuildContext context}){
  return MediaQuery.of(context).size.width > 360;
}

const double baseHeight = 860.0;
const double baseWidth = 375.0;

double screenAwareSizeHeight(double height, BuildContext context) {
  double drawingHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return height * drawingHeight / baseHeight;
}

double screenAwareSizeWidth(double width, BuildContext context) {
  double drawingWidth = MediaQuery.of(context).size.width;
  return width * drawingWidth / baseWidth;
}
