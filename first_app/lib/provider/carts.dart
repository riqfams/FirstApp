import 'package:first_app/model/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {

  Map<String, Cart> _items = {};

  Map<String, Cart> get items => _items;

  int get cartCount{
    return _items.length;
  }

  double get totalPrice{
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.qty;
    });
    return total;
  }

  void addToCart(String productId, String name, double price, String imgUrl) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (value) =>
          Cart(
              id: value.id,
              name: value.name,
              price: value.price,
              qty: value.qty + 1,
              imgUrl: value.imgUrl
          )
      );
    } else {
      _items.putIfAbsent(productId, () =>
          Cart(
              id: DateTime.now().toString(),
              name: name,
              price: price,
              qty: 1,
              imgUrl: imgUrl
          )
      );
    }
    notifyListeners();
  }

}