import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/admin/services/admin_services.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import 'package:wine_recognizer/utils/pick_image_file.dart';
import 'package:wine_recognizer/widgets/bigText.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  static const String routeName = '/addProduct-page';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final AdminServices adminServices = AdminServices();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();

  List<File> images = [];
  String country = 'France';

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCountry = [
    'France',
    'USA',
    'Italy',
    'Germany',
    'England',
    'Japan'
  ];

  void selectImage() async {
    var result = await pickImages();
    setState(() {
      images = result;
    });
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          country: country,
          images: images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.height50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: StylesApp.appBarGradient),
          ),
          title: const Center(
            child: Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: Dimensions.imgConMarginTop200,
                            ),
                          );
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200),
                      )
                    : GestureDetector(
                        onTap: selectImage,
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(Dimensions.radius15),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: Dimensions.iconSize24 * 2,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height15,
                                  ),
                                  BigText(
                                    text: 'Select Product Images',
                                    size: Dimensions.height15,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            )),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: productNameController,
                    hintText: "Product Name"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: priceController, hintText: "Price"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityController, hintText: "Quantity"),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: country,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCountry.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newCountry) {
                      setState(() {
                        country = newCountry!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(text: 'Sell', onTap: sellProduct),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
