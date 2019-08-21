import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/model/TodoItem.dart';

class AppItemState with ChangeNotifier {
  List<TodoItem> _items = [];
  List<TodoItem> _itemsDone = [];

  // AppThemeState(this._color);
  UnmodifiableListView<TodoItem> get items => UnmodifiableListView(_items);
  UnmodifiableListView<TodoItem> get itemsDone =>
      UnmodifiableListView(_itemsDone);

  void add(TodoItem item) {
    _items.add(item);

    notifyListeners();
  }

  void edit(TodoItem item) {
    var x = _items.where((elemwnt) => elemwnt.id == item.id).first;
    x.name = item.name;
    x.days = item.days;
    x.descripton = item.descripton;
    x.qRcode = item.qRcode;
    notifyListeners();
  }

  void addDone(TodoItem item) {
    _items.remove(item);
    _itemsDone.add(item);

    notifyListeners();
  }

  void remove(TodoItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeDone(TodoItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void returnUnDone(TodoItem item) {
    _itemsDone.remove(item);
    _items.add(item);
    notifyListeners();
  }

  void printthemall() {
    for (var i = 0; i < _itemsDone.length; i++) {
      print("${_itemsDone[i].name} this is the first in the items");
    }
  }
}
