import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/pages/home/services/home_services.dart';
import 'package:wine_recognizer/pages/products/popular_wine_description_page.dart';
import 'package:wine_recognizer/pages/search/pages/search_screen.dart';

import 'package:wine_recognizer/widgets/cart_badge.dart';

import '../../models/product.dart';
import '../../providers/user_provider.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigText.dart';
import '../../widgets/loader.dart';
import '../../widgets/smallText.dart';

import '../../widgets/stars.dart';
import '../cart/cart_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = '/home-page';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);
  var currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.firstMainContainer;
  HomeServices homeServices = HomeServices();
  List<Product>? productList;

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  fetchProducts() async {
    productList = await homeServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
    fetchProducts();
  }

  // Dispose it means if we leave the page we don't want it to be active: otherwise there will be memory leak;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCarLength = context.watch<UserProvider>().user.cart.length;
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
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search wines',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          )),
                    ),
                  ),
                ),
              ),
              CartBadge(
                value: userCarLength.toString(),
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
      body: productList == null
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.firstMainContainer -
                        Dimensions.height50 -
                        Dimensions.height10,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: Dimensions.height30,
                            left: Dimensions.width15,
                            right: Dimensions.width15,
                          ),
                          color: StylesApp.primaryColor,
                          height: Dimensions.imgConMarginTop200,
                          child: Column(
                            children: [
                              BigText(
                                text: "Wine searcher welcomes you",
                                color: Colors.white,
                                size: Dimensions.font26,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: Dimensions.width10),
                                  SizedBox(width: Dimensions.width10),
                                ],
                              ),
                              SizedBox(height: Dimensions.width20),
                            ],
                          ),
                        ),
                        PageView.builder(
                          controller: pageController,
                          itemCount: productList!.length,
                          itemBuilder: (context, position) {
                            final product = productList![position];
                            double myRating = 0.0;
                            double totalRating = 0;
                            for (int i = 0; i < product.rating!.length; i++) {
                              totalRating += product.rating![i].rating;
                            }
                            if (totalRating != 0) {
                              myRating = totalRating / product.rating!.length;
                            } else {
                              myRating = 1.0;
                            }

                            return _buildPageItem(position, product, myRating);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  DotsIndicator(
                    dotsCount: productList!.length,
                    position: currentPageValue,
                    decorator: DotsDecorator(
                      activeColor: Colors.orangeAccent,
                      size: Size.square(Dimensions.height10 - 1),
                      activeSize: Size(
                          Dimensions.height20 - 2, Dimensions.height10 - 1),
                      activeShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15 / 5),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width5,
                      right: Dimensions.width5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Popular",
                          color: StylesApp.primaryColor,
                        ),
                        InkWell(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height10),
                          child: SmallText(
                            text: "See all",
                            color: StylesApp.primaryColor,
                            size: Dimensions.iconSize16,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height5),
                  ListView.builder(
                      itemCount: productList!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        final product = productList![position];
                        double myRating = 0.0;
                        double totalRating = 0;
                        for (int i = 0; i < product.rating!.length; i++) {
                          totalRating += product.rating![i].rating;
                        }
                        if (totalRating != 0) {
                          myRating = totalRating / product.rating!.length;
                        } else {
                          myRating = 1.0;
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PopularWineDescription.routeName,
                                arguments: product);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height20,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.popularImgWidth,
                                  height: Dimensions.popularImgHeight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
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
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10,
                                          right: Dimensions.width10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: product.name,
                                            color: StylesApp.textColor3,
                                          ),
                                          SmallText(
                                            text: "\$ ${product.price}",
                                            color: StylesApp.primaryColor,
                                            size: Dimensions.font16,
                                          ),
                                          // SizedBox(height: Dimensions.height10),
                                          Stars(rating: myRating),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }

  Widget _buildPageItem(int index, product, double myRating) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currScale = 1 - (currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currScale = 1 - (currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PopularWineDescription.routeName,
              arguments: product);
        },
        child: Container(
          margin: EdgeInsets.only(
            left: Dimensions.width5,
            right: Dimensions.width5,
            top: Dimensions.imgConMarginTop200 - Dimensions.height30,
            bottom: Dimensions.height10,
          ),
          padding: EdgeInsets.only(
            left: Dimensions.width5,
            right: Dimensions.width5,
            bottom: Dimensions.height20,
            top: Dimensions.height20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: StylesApp.container3Color,
          ),
          child: productList == null
              ? const Loader()
              : Row(
                  children: [
                    Container(
                      height: Dimensions.imgConMarginTop200 + 50,
                      width: Dimensions.containerWidth150,
                      margin: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: product.name,
                            size: Dimensions.iconSize24,
                            color: Colors.black,
                          ),
                          SizedBox(height: Dimensions.height10),
                          BigText(
                            text: "\$ ${product.price}",
                            color: StylesApp.primaryColor,
                          ),
                          SizedBox(height: Dimensions.height10),
                          Stars(rating: myRating),
                          SizedBox(height: Dimensions.height5),
                          BigText(
                            text: "Made in ${product.country}",
                            color: StylesApp.primaryColor,
                            size: Dimensions.iconSize16,
                          ),
                          BigText(
                            text: product.description,
                            size: Dimensions.height10,
                          )
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1.5),
                          borderRadius:
                              BorderRadius.circular(Dimensions.height5),
                          color: Colors.white),
                      child: Container(
                        width: Dimensions.popularImgWidth + Dimensions.width20,
                        padding: EdgeInsets.all(Dimensions.height5),
                        child: Image.network(
                          product.images![0],
                          fit: BoxFit.fitHeight,
                          width: Dimensions.containerWidth150,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
