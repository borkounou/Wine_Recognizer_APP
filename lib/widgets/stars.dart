import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wine_recognizer/utils/app_styles.dart';

import '../utils/dimensions.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        direction: Axis.horizontal,
        itemCount: 5,
        rating: rating,
        itemSize: Dimensions.iconSize16,
        itemBuilder: (context, _) {
          return Icon(
            Icons.star,
            color: StylesApp.primaryColor,
          );
        });
  }
}
