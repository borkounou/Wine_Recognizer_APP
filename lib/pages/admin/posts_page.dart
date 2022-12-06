import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/account/widget_account/single_product.dart';
import 'package:wine_recognizer/pages/admin/admin_comment_page.dart';
import 'package:wine_recognizer/pages/admin/services/admin_services.dart';
import 'package:wine_recognizer/widgets/bigText.dart';
import 'package:wine_recognizer/widgets/loader.dart';

import '../../../models/product.dart';
import '../../utils/app_styles.dart';
import '../../utils/dimensions.dart';
import 'add_product_page.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.remove(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, DeleteCommentsPage.routeName,
                            arguments: productData);
                      },
                      child: SizedBox(
                        height:
                            Dimensions.imgConMarginTop200 - Dimensions.height50,
                        child: SingleProduct(
                          image: productData.images![0],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: BigText(
                          text: productData.name,
                          maxLines: 2,
                          size: Dimensions.font16,
                          color: Colors.grey,
                        )),
                        IconButton(
                          onPressed: () {
                            deleteProduct(productData, index);
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: StylesApp.primaryColor,
              tooltip: "Add a products",
              onPressed: navigateToAddProduct,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
