import './../models/cart_item.dart';
import './../models/order_item.dart';
import './list_provider.dart';

class OrdersProvider extends ListProvider<OrderItem> {
  void addOrder(List<CartItem> items, double total) {
    if (items.length != 0) {
      var order =
          OrderItem(amount: total, products: items, date: DateTime.now());
      add(order);
    }
  }
}
