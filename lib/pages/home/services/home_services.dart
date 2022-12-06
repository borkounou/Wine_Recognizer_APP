import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/error_handling.dart';
import '../../../utils/global_variables.dart';
import '../../../utils/show_snack_bar.dart';

class HomeServices {
  Future<List<Product>> fetchProducts({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-products'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(jsonDecode(res.body)[i]),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
    return productList;
  }
}
