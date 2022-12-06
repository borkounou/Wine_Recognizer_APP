import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_recognizer/utils/app_styles.dart';

import '../../models/main_wine_model.dart';

class CartController extends GetxController {
  var numberOfItemsSelected = 0.obs;
  var wine = wines.obs;
  var isWorking = false;
  var productsList = [].obs;
  var products = {}.obs;
  var favList = [].obs;
  var isFav = false.obs;
  var selectedProduct = {};
  var cartProducts = [];
  var isAddedToCart = false.obs;
  void addItemToCart() {
    if (numberOfItemsSelected.value >= 30) {
      Get.snackbar(
        "Max item number exceeding",
        "You cannot add more than ${numberOfItemsSelected.value}",
        icon: const Icon(Icons.warning),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        backgroundColor: StylesApp.primaryColor,
      );
    } else {
      numberOfItemsSelected.value++;
      print(numberOfItemsSelected);
      update();
    }
  }

  getProducts() {
    productsList = wine;
    return productsList;
  }

  getProductDetail(id) {
    products = productsList[id];
    return products;
  }

  void removeItemFromCart() {
    if (numberOfItemsSelected.value <= 0) {
      Get.snackbar(
        "The minimum number is Zero",
        "You cannot remove less than ${numberOfItemsSelected.value}",
        icon: const Icon(Icons.warning),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        backgroundColor: StylesApp.primaryColor,
      );
    } else {
      numberOfItemsSelected.value--;
      print(numberOfItemsSelected);
      update();
    }
  }

  addRemoveToFavorite() async {
    if (favList.contains(selectedProduct['title'])) {
      favList.remove(selectedProduct["title"]);
      isFav.value = false;
    } else {
      favList.add(selectedProduct["title"]);
      isFav.value = true;
    }
  }

  checkFavorite() {
    if (favList.contains(selectedProduct["title"])) {
      isFav.value = true;
    } else {
      isFav.value = false;
    }
  }

  addToCart() async {
    if (!cartProducts.contains(selectedProduct)) {
      cartProducts.add(selectedProduct);
      isAddedToCart.value = true;
    } else {
      Get.snackbar(
        "Oops",
        "Product already in Cart",
        icon: const Icon(Icons.warning),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
    }
  }

  removeFromCart(product) async {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
    }
  }
}
