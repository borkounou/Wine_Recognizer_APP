import 'package:flutter/material.dart';
import 'package:wine_recognizer/models/product.dart';
import 'package:wine_recognizer/widgets/stars.dart';

import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigText.dart';

class SearchProduct extends StatelessWidget {
  final Product product;
  const SearchProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        bottom: Dimensions.height20,
        top: Dimensions.height20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: Dimensions.popularImgWidth,
                height: Dimensions.popularImgHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      product.images![0],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: Dimensions.popularImgHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      bottomRight: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width10, right: Dimensions.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BigText(
                          text: product.name,
                          color: StylesApp.textColor3,
                        ),
                        BigText(
                            text: product.description!,
                            size: Dimensions.font12),
                        BigText(
                          text: "\$ ${product.price}",
                          color: StylesApp.primaryColor,
                          size: Dimensions.font12,
                        ),
                        // SizedBox(height: Dimensions.height10),
                        const Stars(rating: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.height10),
        ],
      ),
    );
  }
}
