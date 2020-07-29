import './withId.dart';
import './cart_item.dart';

class OrderItem extends WithId {
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  OrderItem({this.amount, this.products, this.date});
}
