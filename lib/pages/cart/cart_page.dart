import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/pages/order/services/order_services.dart';
import 'package:wine_recognizer/providers/user_provider.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import 'package:wine_recognizer/widgets/bigText.dart';

import '../../models/product.dart';
import '../../utils/dimensions.dart';
import '../../widgets/cart_items.dart';
import '../products/services/product_details_services.dart';

class CartPage extends StatelessWidget {
  static const routeName = "cart-page";
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsServices productDetailsServices =
        ProductDetailsServices();

    final OrderServices orderServices = OrderServices();
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    final userCarLength = user.cart.length;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Your cart")),
          backgroundColor: StylesApp.primaryColor),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(Dimensions.height15),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: Dimensions.font20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      "\$ ${sum}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: StylesApp.primaryColor,
                  ),
                  TextButton(
                      onPressed: () {
                        orderServices.placeOrder(
                            context: context,
                            totalSum: double.parse(sum.toString()));
                        // Get.snackbar("Orders", "Orders placed successfully",
                        //     backgroundColor: Colors.greenAccent,
                        //     snackPosition: SnackPosition.BOTTOM);
                      },
                      child: BigText(
                        text: "ORDER NOW",
                        color: StylesApp.primaryColor,
                        size: Dimensions.font16,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userCarLength,
              itemBuilder: (context, index) {
                final productCart =
                    context.watch<UserProvider>().user.cart[index];
                final product = Product.fromMap(productCart['product']);
                void removeFromCart() {
                  productDetailsServices.removeFromCart(
                      context: context, product: product);
                }

                void addToCart() {
                  productDetailsServices.addToCart(
                      context: context, product: product);
                }

                return CartItems(
                  id: "2",
                  productId: 0,
                  price: product.price,
                  quantity: productCart['quantity'],
                  title: product.name,
                  removerCart: removeFromCart,
                  addToCart: addToCart,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
