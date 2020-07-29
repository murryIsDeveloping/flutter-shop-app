import './withId.dart';

class CartItem extends WithId {
  final String title;
  final int quantity;
  final double price;

  CartItem({this.title, this.quantity, this.price});
}
