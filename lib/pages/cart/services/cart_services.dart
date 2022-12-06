// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../models/product.dart';
// import '../../../providers/user_provider.dart';
// import '../../../utils/error_handling.dart';
// import '../../../utils/global_variables.dart';
// import '../../../utils/show_snack_bar.dart';
//
// class CartProvider extends ChangeNotifier {
//   Map<int, Product> _items = {};
//   var cartItemsList = [];
//
//   Map<int, Product> get items {
//     return {..._items};
//   }
//
//   // The number of elements present in the cart item
//   int get itemCount {
//     return _items.length;
//   }
//
//   double get totalAmount {
//     var total = 0.0;
//     _items.forEach((key, cartItem) {
//       total += cartItem.price * cartItem.quantity;
//     });
//     return total;
//   }
//
//   void addItem(int productId, double price, String name, double quantity) {
//     if (_items.containsKey(productId)) {
//       _items.update(
//           productId,
//           (existingCartItem) => Product(
//               id: existingCartItem.id,
//               price: existingCartItem.price,
//               name: existingCartItem.name,
//               quantity: existingCartItem.quantity + 1));
//       cartItemsList.add(_items);
//     } else {
//       _items.putIfAbsent(
//           productId,
//           () => Product(
//               id: DateTime.now().toString(),
//               price: price,
//               name: name,
//               quantity: quantity));
//       cartItemsList.add(_items);
//     }
//     notifyListeners();
//   }
//
//   void removeItem(int productId) {
//     _items.remove(productId);
//     notifyListeners();
//   }
//
//   void clear() {
//     _items = {};
//   }
//
//   Future<List<Product>> fetchCategoryProducts(
//       {required BuildContext context, required String category}) async {
//     final userProvider = Provider.of<UserProvider>(context);
//     List<Product> productList = [];
//     try {
//       http.Response res = await http
//           .get(Uri.parse('$uri/api/products?category=$category'), headers: {
//         'Content-type': 'application/json; charset=UTF-8',
//         'x-auth-token': userProvider.user.token,
//       });
//       httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             for (int i = 0; i < jsonDecode(res.body).length; i++) {
//               productList.add(
//                 Product.fromJson(
//                   jsonEncode(jsonDecode(res.body)[i]),
//                 ),
//               );
//             }
//           });
//     } catch (e) {
//       showSnackBar(
//         context: context,
//         text: e.toString(),
//       );
//     }
//
//     return productList;
//   }
// }
