import 'package:flutter/material.dart';
import 'package:wine_recognizer/utils/app_styles.dart';

void showSnackBar(
    {required BuildContext context,
    required String text,
    Color color = Colors.orangeAccent}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
    ),
  );
}
