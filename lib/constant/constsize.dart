import 'package:flutter/material.dart';

double figmaHeight = 956; // Base Figma design height
double figmaWidth = 440;  // Base Figma design width

double getHeight(BuildContext context) {
double screenHeight = MediaQuery.of(context).size.height;
   
    // Scaling factors
return screenHeight;
}



double getWidth(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;


  return screenWidth;
}

double getWidthScale(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth / figmaWidth;
}

double getHeightScale(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight / figmaHeight;
}

