import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_recognizer/pages/dustbin/cart_controller.dart';
import 'package:wine_recognizer/utils/app_styles.dart';

import '../utils/dimensions.dart';
import 'app_icon.dart';
import 'bigText.dart';

class CartItems extends StatelessWidget {
  final String id;
  final int productId;
  final double price;
  final int quantity;
  final String title;
  final VoidCallback removerCart;
  final VoidCallback addToCart;
  const CartItems(
      {Key? key,
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      required this.removerCart,
      required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartItemController());
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartController.removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Chip(
              label: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "\$ $price",
                ),
              ),
              backgroundColor: StylesApp.primaryColor,
            ),
            title: BigText(
              text: title,
              color: Colors.black,
              size: Dimensions.font16,
            ),
            subtitle: Text('Total: \$ $price'),
            trailing: SizedBox(
              height: 50,
              width: 120,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: removerCart,
                    child: AppICon(
                      iconSize: Dimensions.iconSize24,
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      backgroundColor: StylesApp.primaryColor,
                    ),
                  ),
                  BigText(
                    text: '$quantity X',
                    color: Colors.black,
                    size: Dimensions.font12,
                  ),
                  GestureDetector(
                    onTap: addToCart,
                    child: AppICon(
                      iconSize: Dimensions.iconSize24,
                      icon: Icons.add,
                      iconColor: Colors.white,
                      backgroundColor: StylesApp.primaryColor,
                    ),
                  ),
                ],
              ),
            ), // Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// mainAxisSize: MainAxisSize.max,
// children: [
// GestureDetector(
// // onTap: removeFromCart,
// child: AppICon(
// iconSize: Dimensions.iconSize24,
// icon: Icons.remove,
// iconColor: Colors.white,
// backgroundColor: StylesApp.primaryColor,
// ),
// ),
// BigText(
// text: '$quantity X',
// // "\$ $price\t X ${controller.numberOfItemsSelected.toString()} ",
// color: Colors.black,
// ),
// GestureDetector(
// // onTap: addToCart,
// child: AppICon(
// iconSize: Dimensions.iconSize24,
// icon: Icons.add,
// iconColor: Colors.white,
// backgroundColor: StylesApp.primaryColor,
// ),
// ),
// ],
// ),
