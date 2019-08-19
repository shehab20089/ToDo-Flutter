import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/model/TodoItem.dart';

class AppItemState with ChangeNotifier {
  List<TodoItem> _items = [];
  // AppThemeState(this._color);
  UnmodifiableListView<TodoItem> get items => UnmodifiableListView(_items);
  int get totalPrice => _items.length * 42;

  void add(TodoItem item) {
    _items.add(item);

    notifyListeners();
  }
}
