import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:wine_recognizer/providers/image_provider.dart';
import 'package:wine_recognizer/utils/global_variables.dart';

class CameraServices {
  String message = "";
  // Map<String, dynamic>? products;
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImageFromGallery() async {
    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      selectedImage = File(pickedFile!.path);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return selectedImage;
  }

  void searchImage({required BuildContext context, required File image}) async {
    try {
      final request = http.MultipartRequest("POST", Uri.parse('$uri2/upload'));
      final headers = {"Content-type": "multipart/form-data"};
      request.files.add(http.MultipartFile(
          'image', image.readAsBytes().asStream(), image.lengthSync(),
          filename: image.path.split('/').last));
      request.headers.addAll(headers);
      final response = await request.send();
      http.Response res = await http.Response.fromStream(response);

      final resJson = jsonDecode(res.body);
      // products = json.decode(res.body) as Map<String, dynamic>;
      // products = json.decode(res.body) as Map<String, dynamic>;
      Provider.of<ImagesProvider>(context, listen: false)
          .setImage(json.decode(res.body) as Map<String, dynamic>);

      message = resJson['message'];
    } catch (e) {
      // showSnackBar(context: context, text: e.toString());
    }
  }

  Future<File?> getImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    try {
      selectedImage = File(pickedFile!.path);
    } catch (e) {
      print(e);
    }

    return selectedImage;
  }
}
