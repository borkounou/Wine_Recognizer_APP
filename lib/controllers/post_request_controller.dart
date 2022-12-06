import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:wine_recognizer/utils/global_variables.dart';

class PostRequestController extends GetxController {
  String message = "";
  Map<String, dynamic>? _products;
  Map<String, dynamic>? get mainProduct => _products;
  File? _selectedImage;
  File? get selectedImage => _selectedImage;
  final ImagePicker _picker = ImagePicker();

  var isDataLoading = false.obs;

  getImageFromServer() async {
    // final response = await http.get(Uri.parse("http://10.0.2.2:5000/upload"));
    // _products = json.decode(response.body) as Map<String, dynamic>;
    // print(_products);

    try {
      final response = await http.get(Uri.parse("$uri2/upload"));
      _products = json.decode(response.body) as Map<String, dynamic>;
      _products = json.decode(response.body) as Map<String, dynamic>;
      print(_products);
    } catch (e) {
      if (e is http.ClientException) {
        if (e.message == 'Connection closed while receiving data') {
          if (kDebugMode) {
            print(e.message);
          }
        }
      }
    }
    update();
  }

  // getImageFromServer() async {
  //   final response = await http.get(Uri.parse("http://10.0.2.2:5000/upload"));
  //
  //   _products = MainProductModel.fromJson(json.decode(response.body))
  //       as Map<String, dynamic>;
  //   print(_products);
  //   // try {
  //   //   final response = await http.get(Uri.parse("http://10.0.2.2:5000/upload"));
  //   //   if (response.statusCode == 200) {
  //   //     _products = MainProductModel.fromJson(json.decode(response.body))
  //   //         as Map<String, dynamic>;
  //   //     update();
  //   //   }
  //   // } catch (e) {
  //   //   if (e is http.ClientException) {
  //   //     if (e.message == 'Connection closed while receiving data') {
  //   //       if (kDebugMode) {
  //   //         print(e.message);
  //   //       }
  //   //     }
  //   //   }
  //   // }
  // }

  uploadImage() async {
    final request =
        http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/upload"));
    final headers = {
      "Content-type": "multipart/form-data",
    };
    print("Working to post and image");
    request.files.add(http.MultipartFile('image',
        _selectedImage!.readAsBytes().asStream(), _selectedImage!.lengthSync(),
        filename: _selectedImage!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson["message"];
    update();
  }

  Future getImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedImage = File(pickedFile!.path);
    update();

    await uploadImage();
  }

  Future getImageFromGallery() async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      _selectedImage = File(pickedFile!.path);
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    await uploadImage();
  }
}
