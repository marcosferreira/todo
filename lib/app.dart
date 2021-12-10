import 'package:flutter/material.dart';
import 'package:todo/route.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      initialRoute: RouteApp.home,
      routes: RouteApp.getRoutes(context),
    );
  }
}
