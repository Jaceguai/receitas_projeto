import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_receitas/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(brightness: Brightness.light);
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.pink, secondary: Colors.amber),
        canvasColor: Color.fromARGB(255, 254, 229, 1),
        textTheme: theme.textTheme.copyWith(
          headline6: TextStyle(
              fontFamily: "RobotoCondensed", fontSize: 20, color: Colors.black),
          headline5: TextStyle(
              fontFamily: "RobotoCondensed", fontSize: 18, color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}
