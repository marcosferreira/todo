import 'package:flutter/cupertino.dart';
import 'package:todo/screens/form_todo/form_todo_screen.dart';
import 'package:todo/screens/home/home_screen.dart';

class RouteApp {
  static String home = '/home';
  static String formTodo = '/form-todo';

  static Map<String, Widget Function(BuildContext)> getRoutes(context) {
    return {
      home: (context) => const HomeScreen(),
      formTodo: (context) => FormTodoScreen(),
    };
  }
}
