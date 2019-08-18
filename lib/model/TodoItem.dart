import 'package:flutter/material.dart';

enum Days { saturday, sunday, monday, tuesday, wensday, friday }

class TodoItem {
  final String name;
  final String descripton;
  final Days days;
  const TodoItem({this.name, this.descripton, this.days});
}
