import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<ToDo> _items = [...listTodo];

  List<ToDo> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  ToDo byIndex(int index) {
    return _items.elementAt(index);
  }

  void post(ToDo toDo) {
    final id = Random().nextDouble().toString();
    _items.add(ToDo(id: id, name: toDo.name, descrption: toDo.descrption));

    notifyListeners();
  }

  void put(ToDo toDo) {
    _items[_items.indexWhere((element) => element.id == toDo.id)] = toDo;

    notifyListeners();
  }

  void distroy(ToDo toDo) {
    _items.remove(toDo);

    notifyListeners();
  }
}
