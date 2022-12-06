import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/pages/admin/services/admin_services.dart';
import 'package:wine_recognizer/pages/cart/cart_page.dart';
import 'package:wine_recognizer/pages/products/services/product_details_services.dart';
import 'package:wine_recognizer/widgets/bigText.dart';

import '../../models/product.dart';
import '../../providers/user_provider.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/cart_badge.dart';

import '../../widgets/stars.dart';

class DeleteCommentsPage extends StatefulWidget {
  static const String routeName = '/comment-delete-page';
  final Product product;
  const DeleteCommentsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DeleteCommentsPage> createState() => _DeleteCommentsPageState();
}

class _DeleteCommentsPageState extends State<DeleteCommentsPage> {
  final AdminServices adminServices = AdminServices();

  String? newValue;
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

  void deleteProductComment(
      Product product, String productId, String commentId, int index) {
    adminServices.deleteProductComment(
        context: context,
        product: product,
        prodId: productId,
        commentId: commentId,
        onSuccess: () {
          widget.product.comment!.remove(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(Dimensions.height50 + Dimensions.height10),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: StylesApp.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Reviews",
                color: Colors.black,
                size: Dimensions.font26,
              ),
              CartBadge(
                value: "0",
                color: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, CartPage.routeName);
                    // Get.toNamed("/cart-page");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView.builder(
              itemCount: widget.product.comment!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, position) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('wines/bckgr_white.jpg'),
                        backgroundColor: Colors.transparent,
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
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(
                                  text:
                                      widget.product.comment![position].userId,
                                  color: Colors.grey,
                                  size: Dimensions.font12,
                                ),
                                BigText(
                                  text:
                                      widget.product.comment![position].comment,
                                  size: Dimensions.font12,
                                ),
                                // SizedBox(height: Dimensions.height10),
                                Stars(rating: avgRating),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteProductComment(
                              widget.product,
                              widget.product.id!,
                              widget.product.comment![position].id!,
                              position);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: Dimensions.iconSize16,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
