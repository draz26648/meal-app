import 'package:draz_p1/models/meal.dart';
import 'package:draz_p1/widgets/mel_items.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/s1';
  final List<Meal> avilableMeal;
  CategoryMeals(this.avilableMeal);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categTitle;
  List<Meal> displayMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categID = routeArg['id'];
    categTitle = routeArg['title'];
    displayMeal = widget.avilableMeal.where((meal) {
      return meal.categories.contains(categID);
    }).toList();
    super.didChangeDependencies();
  }
  // void initState() {

  //   super.initState();
  // }

  void _removeItem(String mealID) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Center(
              child: MealItem(
            id: displayMeal[index].id,
            imagelink: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,
            //removeItem: _removeItem,
          ));
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
