import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final int maxLines;
  Color? color;
  TextOverflow overflow;

  BigText({
    Key? key,
    required this.text,
    this.size = 0,
    this.maxLines = 1,
    this.color = Colors.black38,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
