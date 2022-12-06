import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wine_recognizer/utils/show_snack_bar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      showSnackBar(context: context, text: jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context: context, text: jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context: context, text: response.body);
  }
}
