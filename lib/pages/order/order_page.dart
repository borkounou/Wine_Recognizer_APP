import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/account/widget_account/single_product.dart';
import 'package:wine_recognizer/pages/order/services/order_services.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import 'package:wine_recognizer/widgets/loader.dart';

import '../../models/order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order>? orders;
  final OrderServices orderServices = OrderServices();

  @override
  void initState() {
    super.initState();
    fetchProductsOrder();
  }

  void fetchProductsOrder() async {
    orders = await orderServices.fetchOrderProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 18,
                        color: StylesApp.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orders!.length,
                    itemBuilder: (context, index) {
                      return SingleProduct(
                        image: orders![index].products[0].images![0],
                      );
                    }),
              ),
            ],
          );
  }
}
