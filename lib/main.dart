import 'package:draz_p1/dummy_data.dart';
import 'package:draz_p1/models/meal.dart';
import 'package:draz_p1/screens/category_meals_screen.dart';
import 'package:draz_p1/screens/filter_screen.dart';
import 'package:draz_p1/screens/meal_info.dart';
import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avilabileMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void setFilter(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      _avilabileMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String iD) {
    return _favoriteMeals.any((meal) => meal.id == iD);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: CategoriesScreen(),
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 222, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  color: Colors.white),
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.black,
              ),
            ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => TabScreen(_favoriteMeals),
        CategoryMeals.routeName: (context) => CategoryMeals(_avilabileMeals),
        MealInfo.routeName: (context) =>
            MealInfo(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(filters, setFilter),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        //body: CategoriesScreen(),
        );
  }
}
