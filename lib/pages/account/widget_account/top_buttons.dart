import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/order/services/order_services.dart';

import 'account_buttons.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  OrderServices orderServices = OrderServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(text: "Your orders", ontTap: () {}),
            AccountButton(text: "Turn Seller", ontTap: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
                text: "Log out",
                ontTap: () {
                  orderServices.logOut(context);
                }),
            AccountButton(text: "Your List", ontTap: () {}),
          ],
        ),
      ],
    );
  }
}
