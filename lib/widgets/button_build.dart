import 'dart:ffi';

import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'bigText.dart';

class BuildButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final VoidCallback func;

  final String buttonTitle;

  const BuildButton({
    Key? key,
    required this.icon,
    this.color = const Color(0xFFfcf4e4),
    required this.func,
    required this.buttonTitle,
    this.iconColor = const Color(0xFFF1A661),
    this.textColor = const Color(0xFFF1A661),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        padding: EdgeInsets.only(
            left: Dimensions.width10, right: Dimensions.width10),
        margin: EdgeInsets.only(
            left: Dimensions.width10, right: Dimensions.width10),
        height: Dimensions.height50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          color: color,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: Dimensions.iconSize24,
              color: iconColor,
            ),
            BigText(
              text: buttonTitle,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
