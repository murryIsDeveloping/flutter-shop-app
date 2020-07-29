import 'package:flutter/foundation.dart';

import '../models/withId.dart';

class ProductProvider extends WithId with ChangeNotifier {
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;

  ProductProvider({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
