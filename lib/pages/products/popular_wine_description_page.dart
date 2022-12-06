import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/models/product.dart';
import 'package:wine_recognizer/pages/products/reviews_comments_page.dart';
import 'package:wine_recognizer/pages/products/services/product_details_services.dart';
import 'package:wine_recognizer/providers/user_provider.dart';
import 'package:wine_recognizer/widgets/custom_button.dart';

import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/bigText.dart';
import '../../widgets/cart_badge.dart';
import '../../widgets/textExpandableWidget.dart';
import '../cart/cart_page.dart';

class PopularWineDescription extends StatefulWidget {
  final Product product;
  const PopularWineDescription({Key? key, required this.product})
      : super(key: key);
  static const String routeName = '/popular-wine-detail';

  @override
  State<PopularWineDescription> createState() => _PopularWineDescriptionState();
}

class _PopularWineDescriptionState extends State<PopularWineDescription> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void addToCart() {
    productDetailsServices.addToCart(context: context, product: widget.product);
  }

  void removeFromCart() {
    productDetailsServices.removeFromCart(
        context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final userCarLength = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                    size: Dimensions.iconSize16,
                    color: StylesApp.primaryColor,
                  ),
                ),
                CartBadge(
                  value: userCarLength.toString(),
                  color: Theme.of(context).colorScheme.secondary,
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: StylesApp.primaryColor),
                    onPressed: () {
                      Navigator.pushNamed(context, CartPage.routeName);
                    },
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: BigText(
                    text: widget.product.name,
                    size: Dimensions.font16,
                  ),
                ),
              ),
            ),
            backgroundColor: StylesApp.starColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.product.images![0],
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: ExpandableTextWidget(
                      text: widget.product.description!,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      child: Row(
                        children: [
                          BigText(
                            text: "Rate the product",
                            size: Dimensions.font16,
                            color: Colors.black45,
                          ),
                          SizedBox(
                            width: Dimensions.width5,
                          ),
                          RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: Dimensions.iconSize16,
                              itemBuilder: (context, _) {
                                return Icon(
                                  Icons.star,
                                  color: StylesApp.primaryColor,
                                );
                              },
                              onRatingUpdate: (rating) {
                                productDetailsServices.rateProduct(
                                    context: context,
                                    product: widget.product,
                                    rating: rating);
                              }),
                          SizedBox(
                            width: Dimensions.width15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ReviewsCommentsPage.routeName,
                                  arguments: widget.product);
                            },
                            child: BigText(
                              text: "comment",
                              size: Dimensions.font12,
                              color: StylesApp.primaryColor,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: Dimensions.height50,
                  ),
                  SizedBox(
                    height: Dimensions.bottomHeightBar,
                  ),
                  CustomButton(text: "Order now", onTap: () {}),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  CustomButton(text: "add to cart", onTap: addToCart),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
