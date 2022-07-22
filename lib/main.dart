
import 'package:flutter/material.dart';
import 'package:projeto_receitas/screens/categories_meals_screen.dart';
import 'package:projeto_receitas/screens/categories_screen.dart';
import 'package:projeto_receitas/screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

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
        canvasColor: const Color.fromARGB(255, 254, 229, 1),
        textTheme: theme.textTheme.copyWith(
          headline6: const TextStyle(
              fontFamily: "RobotoCondensed", fontSize: 20, color: Colors.black),
          headline5: const TextStyle(
              fontFamily: "RobotoCondensed", fontSize: 18, color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     
      routes: {
        AppRoutes.HOME:(ctx)=> const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS:(ctx)=> const CategoriesMealsScreen(),
        AppRoutes.MEALS_DETAIL:(ctx)=> const MealDetailSreen(),
      },
       
    );
  }
}
