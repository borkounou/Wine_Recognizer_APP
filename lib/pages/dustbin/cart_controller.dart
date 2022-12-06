import 'package:get/get.dart';
import 'package:wine_recognizer/models/cart_item_model.dart';

class CartItemController extends GetxController {
  Map<int, CartItemModel> _items = {};
  var cartItemsList = [].obs;

  Map<int, CartItemModel> get items {
    return {..._items};
  }

  // The number of elements present in the cart item
  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += double.parse(cartItem.price) * cartItem.quantity;
    });
    return total;
  }

  void addItem(int productId, String price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItemModel(
              id: existingCartItem.id,
              price: existingCartItem.price,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1));
      cartItemsList.add(_items);
      print(cartItemsList);
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItemModel(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quantity: quantity));
      cartItemsList.add(_items);
      print(cartItemsList);
    }

    print(_items[productId]);
    update();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
