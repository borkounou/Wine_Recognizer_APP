import 'package:flutter/material.dart';
import 'package:wine_recognizer/models/imageModel.dart';

class ImagesProvider extends ChangeNotifier {
  late bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  ImageModel _imageProduct = ImageModel(
    title: '',
    description: '',
    price: 0,
    country: '',
    imageUrl: '',
  );

  ImageModel get imageProduct => _imageProduct;

  void setImage(Map<String, dynamic> imageProduct) {
    _imageProduct = ImageModel.fromJson(imageProduct);
    if (_imageProduct.description != '') {
      _isLoaded = true;
    }

    notifyListeners();
  }
}
