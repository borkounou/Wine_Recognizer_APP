import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/searcher/image_search_result_page.dart';
import 'package:wine_recognizer/pages/searcher/image_search_service.dart';
import 'package:wine_recognizer/utils/show_snack_bar.dart';
import 'package:wine_recognizer/widgets/bigText.dart';
import 'package:wine_recognizer/widgets/smallText.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  static const String routeName = '/camera-page';

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CameraServices cameraServices = CameraServices();
  File? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFromCamera();
  }

  void getImageFromCamera() async {
    image = await cameraServices.getImage();
    setState(() {});
  }

  void getImageFromGallery() async {
    image = await cameraServices.getImageFromGallery();
    setState(() {});
  }

  void postImage(BuildContext context, File image) async {
    cameraServices.searchImage(context: context, image: image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final imagesProduct = Provider.of<ImagesProvider>(context).imageProduct;
    return Scaffold(
      body: Container(
        color: StylesApp.container2Color,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.height50,
              left: Dimensions.width10,
              right: Dimensions.width10,
              child: Container(
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                height: double.maxFinite,
                // Dimensions.positionHeightContainer370 + Dimensions.height10,
                width: Dimensions.positionWidthContainer400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      color: Colors.white,
                      height: Dimensions.positionHeightContainer370,
                      width: double.maxFinite,
                      child: image == null
                          ? Center(
                              child: SmallText(
                                  text: "Please pick an Image to upload"))
                          : Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    getImageFromCamera();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: StylesApp.bgColor,
                                  ),
                                  child: BigText(
                                    text: "Camera",
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    try {
                                      if (image != null) {
                                        postImage(context, image!);
                                      }

                                      Navigator.pushNamed(
                                          context, WineSearchResult.routeName,
                                          arguments: image);
                                    } catch (e) {
                                      showSnackBar(
                                          context: context,
                                          text: "Please pick an image");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: StylesApp.bgColor,
                                  ),
                                  child: BigText(
                                    text: "Search",
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    getImageFromGallery();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: StylesApp.bgColor,
                                  ),
                                  child: BigText(
                                    text: "Gallery",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
