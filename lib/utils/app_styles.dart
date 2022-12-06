import 'package:flutter/material.dart';

class StylesApp {
  // Color section
  static Color primaryColor = const Color(0xffE38B29);
  static Color container1Color = const Color(0xFFF8F9FD); //Color(0xFFE8F9FD);
  static Color starColor = const Color(0xFF14C38E);
  static Color textColor1 = const Color(0xFFE8F9FD);
  static Color textColor2 = const Color(0xFFF1A661);
  static Color textColor3 = const Color(0xFF413F42);
  static Color container2Color = const Color(0xFFFFD8A9);
  static Color container3Color = const Color(0xFFFDEEDC);
  static Color bgColor = const Color(0xFFE38B29);

  static Color buttonBackgroundColor = const Color(0xFFf7f6f4);
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 227, 139, 50),
      Color.fromARGB(255, 227, 139, 100),
    ],
    stops: [0.5, 1.0],
  );

  // Style section

  static TextStyle textStyle1 =
      TextStyle(fontSize: 16, color: textColor1, fontWeight: FontWeight.w400);
  static TextStyle textStyle2 =
      TextStyle(fontSize: 16, color: textColor3, fontWeight: FontWeight.w600);

  static TextStyle textStyle3 =
      TextStyle(fontSize: 16, color: textColor2, fontWeight: FontWeight.w400);

  static TextStyle textStyle4 =
      TextStyle(fontSize: 16, color: textColor3, fontWeight: FontWeight.w400);

  static TextStyle header1 =
      TextStyle(fontSize: 26, color: textColor1, fontWeight: FontWeight.bold);

  static TextStyle header2 =
      TextStyle(fontSize: 26, color: textColor3, fontWeight: FontWeight.bold);

  static TextStyle priceStyle =
      TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold);

  static TextStyle searchStyle =
      TextStyle(fontSize: 18, color: textColor1, fontWeight: FontWeight.w300);

  static TextStyle descriptionStyle = TextStyle(
      color: Colors.grey[500], fontWeight: FontWeight.w800, fontSize: 15);
}
