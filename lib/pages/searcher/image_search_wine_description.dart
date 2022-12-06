import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/image_provider.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigText.dart';
import '../../widgets/cart_badge.dart';
import '../../widgets/custom_button.dart';

import '../../widgets/textExpandableWidget.dart';
import '../cart/cart_page.dart';

class ImageSearchWineDetail extends StatefulWidget {
  static const routeName = '/image-search-detail';
  const ImageSearchWineDetail({Key? key}) : super(key: key);

  @override
  State<ImageSearchWineDetail> createState() => _ImageSearchWineDetailState();
}

class _ImageSearchWineDetailState extends State<ImageSearchWineDetail> {
  @override
  Widget build(BuildContext context) {
    final imagesProduct = Provider.of<ImagesProvider>(context).imageProduct;
    final isLoaded = Provider.of<ImagesProvider>(context).isLoaded;
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
                value: "0",
                color: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                  icon:
                      Icon(Icons.shopping_cart, color: StylesApp.primaryColor),
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
                  text: imagesProduct.title!,
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
              imagesProduct.imageUrl!,
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
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: imagesProduct.description!,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: Row(
                      children: [
                        BigText(
                          text: "Rate  product",
                          size: Dimensions.font12,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
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
                            onRatingUpdate: (rating) {}),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        BigText(
                          text: "comment",
                          size: Dimensions.font12,
                          color: StylesApp.primaryColor,
                        ),
                      ],
                    )),
                SizedBox(
                  height: Dimensions.bottomHeightBar,
                ),
                CustomButton(text: "Order now", onTap: () {}),
                SizedBox(
                  height: Dimensions.height10,
                ),
                CustomButton(text: "add to cart", onTap: () {}),
                SizedBox(
                  height: Dimensions.height10,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
    // bottomNavigationBar: Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.only(
    //         left: Dimensions.width20 * 2.5,
    //         right: Dimensions.width20 * 2.5,
    //         top: Dimensions.height10,
    //         bottom: Dimensions.height10,
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               // controller.removeItemFromCart();
    //             },
    //             child: AppICon(
    //               iconSize: Dimensions.iconSize24,
    //               icon: Icons.remove,
    //               iconColor: Colors.white,
    //               backgroundColor: StylesApp.primaryColor,
    //             ),
    //           ),
    //           BigText(
    //             text: "${100}",
    //             // "\$ $price\t X ${controller.numberOfItemsSelected.toString()} ",
    //             color: Colors.black,
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // controller.addItemToCart();
    //             },
    //             child: AppICon(
    //               iconSize: Dimensions.iconSize24,
    //               icon: Icons.add,
    //               iconColor: Colors.white,
    //               backgroundColor: StylesApp.primaryColor,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       height: Dimensions.bottomHeightBar,
    //       padding: EdgeInsets.only(
    //         top: Dimensions.height30,
    //         bottom: Dimensions.height20,
    //         left: Dimensions.width20,
    //         right: Dimensions.width20,
    //       ),
    //       decoration: BoxDecoration(
    //         color: StylesApp.buttonBackgroundColor,
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(Dimensions.radius20 * 2),
    //           topRight: Radius.circular(Dimensions.radius20 * 2),
    //         ),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(
    //               top: Dimensions.height20,
    //               bottom: Dimensions.height20,
    //               right: Dimensions.width20,
    //               left: Dimensions.width20,
    //             ),
    //             decoration: BoxDecoration(
    //                 borderRadius:
    //                     BorderRadius.circular(Dimensions.radius20),
    //                 color: Colors.white),
    //             child: Icon(
    //               Icons.favorite_border_outlined,
    //               color: StylesApp.primaryColor,
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               // controller.addItem(id, price, title, 1);
    //             },
    //             child: Container(
    //               padding: EdgeInsets.only(
    //                 top: Dimensions.height20,
    //                 bottom: Dimensions.height20,
    //                 right: Dimensions.width20,
    //                 left: Dimensions.width20,
    //               ),
    //               decoration: BoxDecoration(
    //                 borderRadius:
    //                     BorderRadius.circular(Dimensions.radius20),
    //                 color: StylesApp.primaryColor,
    //               ),
    //               child: BigText(
    //                 text: " ${imagesProduct.price} | Add to cart",
    //                 color: Colors.white,
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // ));
  }
}
