import 'package:flutter/material.dart';
import 'package:projeto_receitas/screens/categories_meals_screen.dart';
import 'package:projeto_receitas/screens/meal_detail_screen.dart';
import 'package:projeto_receitas/screens/splash_page/splash_page.dart';
import 'utils/app_routes.dart';
import "./screens/tabs_screen.dart";
import "./screens/settings_screen.dart";
import "models/meal.dart";
import "data/dummy_data.dart";
import "models/settings.dart";

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterVegan &&
            !filterVegetarian &&
            !filterLactose;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.SPLASH_PAGE: (ctx) => const SplashPage(),
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEALS_DETAIL: (ctx) => MealDetailSreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
