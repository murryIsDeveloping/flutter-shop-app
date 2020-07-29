import 'package:flutter/material.dart';

import '../models/withId.dart';

class ListProvider<T extends WithId> extends ChangeNotifier {
  List<T> _items;

  ListProvider({
    List<T> items,
  }) {
    _items = items ?? [];
  }

  List<T> get items {
    return [..._items];
  }

  T findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void removeById(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateById(String id, T item) {
    _items.removeWhere((item) => item.id == id);
    add(item);
  }

  void add(T item) {
    _items.add(item);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}
