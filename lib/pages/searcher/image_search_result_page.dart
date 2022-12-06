import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:wine_recognizer/pages/searcher/image_search_wine_description.dart';
import 'package:wine_recognizer/widgets/loader.dart';
import '../../providers/image_provider.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bigText.dart';
import '../../widgets/smallText.dart';

class WineSearchResult extends StatefulWidget {
  final File image;
  static const String routeName = '/image-search-result';
  const WineSearchResult({Key? key, required this.image}) : super(key: key);

  @override
  State<WineSearchResult> createState() => _WineSearchResultState();
}

class _WineSearchResultState extends State<WineSearchResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imagesProduct = Provider.of<ImagesProvider>(context).imageProduct;
    final isLoaded = Provider.of<ImagesProvider>(context).isLoaded;
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: StylesApp.container2Color,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.positionTopHeight230 - Dimensions.height50,
              left: Dimensions.positionWidth80,
              right: Dimensions.positionWidth80,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ImageSearchWineDetail.routeName);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                  height: Dimensions.positionHeightContainer370 +
                      Dimensions.height10,
                  width: Dimensions.positionWidthContainer400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoaded == true
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.width20,
                                  right: Dimensions.width20),
                              height: Dimensions.searcherContainer270,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imagesProduct.imageUrl!),
                                ),
                              ),
                            )
                          : const Loader(),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              imagesProduct.title == null
                                  ? SmallText(text: "Wine title")
                                  : SmallText(
                                      text: imagesProduct.title!,
                                      color: Colors.black,
                                    ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              imagesProduct.country == null
                                  ? SmallText(text: "country")
                                  : SmallText(
                                      text: imagesProduct.country!,
                                      color: Colors.black,
                                    ),
                              // SmallText(
                              //   text: "France",
                              //   color: Colors.black,
                              // ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  imagesProduct.price == null
                                      ? BigText(
                                          text: "\$ ",
                                          color: StylesApp.primaryColor,
                                        )
                                      : BigText(
                                          text: "\$ ${imagesProduct.price}",
                                          color: StylesApp.primaryColor,
                                        ),
                                  Wrap(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                          FluentSystemIcons
                                              .ic_fluent_star_filled,
                                          color: StylesApp.starColor,
                                          size: Dimensions.iconSize16),
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.deepOrange,
                                    size: Dimensions.iconSize16,
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: Dimensions.positionWidth100,
                right: Dimensions.positionWidth100,
                top: Dimensions.height30,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(Dimensions.height5),
                        color: Colors.white),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      child: Image.file(
                        widget.image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 150,
                      ),
                      // child: Image.network(
                      //   image,
                      //   fit: BoxFit.fitHeight,
                      //   width: 180,
                      // ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}

// class WineSearchResult extends StatefulWidget {
//   const WineSearchResult({Key? key}) : super(key: key);
//   static const String routeName = '/image-search-result';
//
//   @override
//   State<WineSearchResult> createState() => _WineSearchResultState();
// }
//
// class _WineSearchResultState extends State<WineSearchResult> {
//   final ImagePicker _picker = ImagePicker();
//   Uint8List? _bytes;
//   bool isUploadImage = true;
//   Image? img;
//   // // _bytes = const Base64Decoder()
//   // //     .convert(postRequestController.mainProduct!["image"]);
//   // // img = Image.memory(_bytes!);
//   // // var data = Get.arguments["data"];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final imagesProduct = Provider.of<ImagesProvider>(context).imageProduct;
//     _bytes = const Base64Decoder().convert(imagesProduct.imageUrl!);
//     img = Image.memory(_bytes!);
//
//     return Scaffold(
//         body: SafeArea(
//       child: Container(
//         color: StylesApp.container1Color,
//         child: Stack(
//           children: [
//             Positioned(
//               top: Dimensions.positionTopHeight230,
//               left: Dimensions.positionWidth80,
//               right: Dimensions.positionWidth80,
//               child: Container(
//                 margin: EdgeInsets.only(bottom: Dimensions.height10),
//                 height:
//                     Dimensions.positionHeightContainer370 + Dimensions.height10,
//                 width: Dimensions.positionWidthContainer400,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(Dimensions.height20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                           left: Dimensions.width20, right: Dimensions.width20),
//                       height: Dimensions.searcherContainer270,
//                       decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.height20),
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: imagesProduct.description == null
//                                 ? AssetImage("./wines/bckgr_white.jpg")
//                                 : img!.image),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Dimensions.height20,
//                     ),
//                     Container(
//                         padding: EdgeInsets.only(
//                             left: Dimensions.width20,
//                             right: Dimensions.width20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             imagesProduct.title == null
//                                 ? SmallText(text: "Wine title")
//                                 : SmallText(
//                                     text: imagesProduct.title!,
//                                     color: Colors.black,
//                                   ),
//                             SizedBox(
//                               height: Dimensions.height5,
//                             ),
//                             imagesProduct.country == null
//                                 ? SmallText(text: "country")
//                                 : SmallText(
//                                     text: imagesProduct.country!,
//                                     color: Colors.black,
//                                   ),
//                             // SmallText(
//                             //   text: "France",
//                             //   color: Colors.black,
//                             // ),
//                             SizedBox(
//                               height: Dimensions.height5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 imagesProduct.price == null
//                                     ? BigText(
//                                         text: "\$ ",
//                                         color: StylesApp.primaryColor,
//                                       )
//                                     : BigText(
//                                         text: "\$ ${imagesProduct.price}",
//                                         color: StylesApp.primaryColor,
//                                       ),
//                                 Wrap(
//                                   children: List.generate(
//                                     5,
//                                     (index) => Icon(
//                                         FluentSystemIcons.ic_fluent_star_filled,
//                                         color: StylesApp.starColor,
//                                         size: Dimensions.iconSize16),
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.favorite,
//                                   color: Colors.deepOrange,
//                                   size: Dimensions.iconSize16,
//                                 )
//                               ],
//                             )
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               left: Dimensions.positionWidth100,
//               right: Dimensions.positionWidth100,
//               top: Dimensions.height30,
//               child: Container(
//                 margin: EdgeInsets.only(
//                     left: Dimensions.width20, right: Dimensions.width20),
//                 height: Dimensions.searcherContainer270,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: Dimensions.radius100,
//                   child: CircleAvatar(
//                       radius: Dimensions.radius100,
//                       backgroundColor: StylesApp.container2Color,
//                       backgroundImage: imagesProduct.description == null
//                           ? const AssetImage('./wines/background.jpg')
//                           : img!.image
//                       // AssetImage(cameraServices.selectedImage!.path),
//
//                       // Image.file(File(image!.path))
//                       ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

// Container(
// margin: EdgeInsets.only(
// left: Dimensions.width20, right: Dimensions.width20),
// height: Dimensions.searcherContainer270,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: Dimensions.radius100,
// child: CircleAvatar(
// radius: Dimensions.radius100,
// backgroundColor: StylesApp.container2Color,
// backgroundImage:
// const AssetImage('./wines/background.jpg')
//
// // AssetImage(cameraServices.selectedImage!.path),
//
// // Image.file(File(image!.path))
// ),
// ),
// ),
