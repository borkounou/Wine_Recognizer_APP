import 'dart:convert';
import 'dart:core';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wine_recognizer/pages/admin/services/sample_model.dart';
import 'dart:io';
import '../../models/main_wine_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/error_handling.dart';
import '../../utils/global_variables.dart';
import '../../utils/show_snack_bar.dart';

class MainWineController extends GetxController {
  final List<SampleModel> _sampleData = [
    SampleModel(
      price: '49',
      title: 'Bold Smooth Lush lush and smooth lush',
      year: "2019",
      volume: "500cl",
      description:
          "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
      imagePath: './recommended_Wines/175.jpg',
      countryOfOrigin: 'France',
      rating: 5,
    ),
    SampleModel(
        price: '669',
        title: 'Bold Smooth Lush',
        year: "2020",
        volume: "500cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/176.jpg',
        countryOfOrigin: 'France',
        rating: 4),
    SampleModel(
        price: '669',
        title: 'Bold Smooth Lush',
        year: "1998",
        volume: "500cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/177.jpg',
        countryOfOrigin: 'France',
        rating: 4),
    SampleModel(
        price: '49',
        title: 'Bold Smooth Lush',
        year: "2000",
        volume: "500cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/178.jpg',
        countryOfOrigin: 'France',
        rating: 5),
    SampleModel(
        price: '49',
        title: 'Bold Smooth Lush',
        year: "2019",
        volume: "500cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/179.jpg',
        countryOfOrigin: 'France',
        rating: 5),
    SampleModel(
        price: '49',
        title: 'Bold Smooth Lush',
        year: "2019",
        volume: "500 ml",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/180.jpg',
        countryOfOrigin: 'France',
        rating: 2),
    SampleModel(
        price: '49',
        title: 'Bold Smooth Lush',
        year: "2019",
        volume: "500cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/181.jpg',
        countryOfOrigin: 'France',
        rating: 5),
    SampleModel(
        price: '79',
        title: 'Bold Smooth Lush',
        year: "2019",
        volume: "500 ml",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/182.jpg',
        countryOfOrigin: 'France',
        rating: 5),
    SampleModel(
        price: '100',
        title: 'Bold Smooth Lush',
        year: "2019",
        volume: "300cl",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/183.jpg',
        countryOfOrigin: 'France',
        rating: 5),
    SampleModel(
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        year: "2017",
        volume: "720ml",
        countryOfOrigin: "US",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/172.jpg',
        rating: 4),
    SampleModel(
        price: '500',
        title:
            "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
        year: "2017",
        volume: "720ml",
        countryOfOrigin: "US",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/173.jpg',
        rating: 5),
    SampleModel(
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        year: "2016",
        volume: "720ml",
        countryOfOrigin: "US",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/174.jpg',
        rating: 4),
  ];

  List<Wine> get items {
    return [...wines];
  }

  List<SampleModel> get sampleData {
    return [..._sampleData];
  }

  List<Wine> get favouriteWine {
    return wines.where((productItem) => productItem.isFavourite).toList();
  }

  Wine findProductById(int id) {
    return wines.firstWhere((element) => element.id == id);
  }

  void toggleFavoriteStatus(int id) {
    items[id].isFavourite = !items[id].isFavourite;
  }

  void sellProduct(
      {required BuildContext context,
      required List<SampleModel> product}) async {
    try {
      final cloudinary = CloudinaryPublic('dssamvdt6', "j43yuvpy");
      // for (int i = 0; i < images.length; i++) {
      //   CloudinaryResponse res = await cloudinary
      //       .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
      //   imageUrls.add(res.secureUrl);
      // }

      for (int i = 0; i < _sampleData.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(_sampleData[i].imagePath!));
        _sampleData[i].imagePath = res.secureUrl;
      }

      // SampleModel product = SampleModel(
      //     price: price,
      //     title: title,
      //     year: year,
      //     volume: volume,
      //     countryOfOrigin: countryOfOrigin,
      //     description: description,
      //     imagePath: res.secureUrl,
      //     rating: rating);
      http.Response responseHttp = await http.post(
        Uri.parse('$uri/products/get-products'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(_sampleData),
      );
      httpErrorHandle(
          response: responseHttp,
          context: context,
          onSuccess: () {
            showSnackBar(
                context: context, text: 'Product uploaded Successfully!');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }
}
