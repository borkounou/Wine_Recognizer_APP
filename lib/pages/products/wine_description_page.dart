import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/dustbin/cart_controller_page.dart';
import 'package:wine_recognizer/widgets/cart_badge.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/bigText.dart';
import '../../widgets/smallText.dart';
import '../../widgets/textExpandableWidget.dart';
import 'package:get/get.dart';

class WineDetailPage extends StatelessWidget {
  static const routeName = '/wine-detail-screen';
  final String title;
  final String price;
  final String year;
  final String volume;
  final String country;
  final String description;
  final String imagePath;
  final int rating;
  WineDetailPage(
      {Key? key,
      required this.title,
      required this.price,
      required this.year,
      required this.volume,
      required this.country,
      required this.description,
      required this.imagePath,
      required this.rating})
      : super(key: key);
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.height30, left: Dimensions.width20),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: Dimensions.iconSize24,
                          color: StylesApp.primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      right: Dimensions.width20,
                      top: Dimensions.height30,
                    ),
                    child: CartBadge(
                      value: "0",
                      color: Theme.of(context).colorScheme.secondary,
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart,
                            color: StylesApp.primaryColor),
                        onPressed: () {
                          Get.toNamed("/cart-page");
                          print("working");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height50),
                height: Dimensions.secondMainContainer,
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.wineDetailContainer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imagePath),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.height5,
                    ),
                    // Container for the detail of the image
                    Container(
                      padding: EdgeInsets.only(bottom: Dimensions.height20),
                      width: Dimensions.wineDetailContainer,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: title,
                            color: StylesApp.primaryColor,
                            size: Dimensions.font26,
                          ),
                          BigText(
                            text: "\$ $price",
                            color: StylesApp.primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "Year",
                                color: Colors.black54,
                                size: Dimensions.font16,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height5,
                                    right: Dimensions.width5),
                                child: SmallText(text: year),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                size: Dimensions.font16,
                                text: "Quantity",
                                color: Colors.black54,
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height5,
                                      right: Dimensions.width5),
                                  child: SmallText(text: volume)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                size: Dimensions.font16,
                                text: "Country",
                                color: Colors.black54,
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.height5,
                                      right: Dimensions.width5),
                                  child: SmallText(text: country)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                size: Dimensions.font16,
                                text: "Review",
                                color: Colors.black54,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height5,
                                    right: Dimensions.width5),
                                child: Wrap(
                                  children: List.generate(
                                    rating,
                                    (index) => Icon(
                                        FluentSystemIcons.ic_fluent_star_filled,
                                        color: const Color(0xFFFccc7c5),
                                        size: Dimensions.iconSize16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimensions.containerLongText,
                margin: EdgeInsets.only(top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                )),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width10),
                child: SingleChildScrollView(
                  child: ExpandableTextWidget(text: description),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimensions.bottomNavBarContainerHeight,
                width: Dimensions.containerWidth150,
                padding: EdgeInsets.only(
                  left: Dimensions.height5,
                  right: Dimensions.height5,
                ),
                margin: EdgeInsets.only(
                    left: Dimensions.height20,
                    bottom: Dimensions.width20,
                    top: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: StylesApp.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeItemFromCart();
                      },
                      icon: AppICon(
                        icon: Icons.remove,
                        size: Dimensions.iconSize16,
                      ),
                    ),
                    BigText(text: controller.numberOfItemsSelected.toString()),
                    IconButton(
                      onPressed: () {
                        controller.addItemToCart();
                      },
                      icon: AppICon(
                        icon: Icons.add,
                        size: Dimensions.iconSize16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: Dimensions.bottomNavBarContainerHeight,
                  width: Dimensions.containerWidth150,
                  margin: EdgeInsets.only(
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      bottom: Dimensions.width20,
                      top: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: StylesApp.primaryColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Add to cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
