import 'package:flutter/foundation.dart';

import './../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    var count = 0;

    _items.forEach((key, value) {
      count += value.quantity;
    });

    return count;
  }

  double get total {
    var count = 0.0;

    _items.forEach((key, value) {
      count += value.quantity * value.price;
    });

    return count;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }

    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (value) => CartItem(
              price: _items[id].price,
              title: _items[id].title,
              quantity: _items[id].quantity - 1));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (item) => CartItem(
                price: item.price,
                title: item.title,
                quantity: item.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          price: price,
          title: title,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
