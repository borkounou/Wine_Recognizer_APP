import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/products/popular_wine_description_page.dart';
import 'package:wine_recognizer/pages/search/search_product.dart';
import 'package:wine_recognizer/pages/search/services/search_services.dart';
import 'package:wine_recognizer/widgets/loader.dart';

import '../../../models/product.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/bigText.dart';
import '../../../widgets/cart_badge.dart';
import '../../../widgets/smallText.dart';
import '../../cart/cart_page.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchAllProducts(
        context: context, searchQuery: widget.searchQuery);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: StylesApp.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Search result',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              CartBadge(
                value: "0",
                color: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, CartPage.routeName);
                    // Get.toNamed("/cart-page");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : SafeArea(
              child: ListView.builder(
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PopularWineDescription.routeName,
                              arguments: products![index]);
                        },
                        child: SearchProduct(product: products![index]));
                  })),
    );
  }
}
