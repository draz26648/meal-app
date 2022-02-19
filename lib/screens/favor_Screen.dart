import 'package:draz_p1/models/meal.dart';
import 'package:draz_p1/widgets/mel_items.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("you have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Center(
              child: MealItem(
            id: favoriteMeals[index].id,
            imagelink: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          ));
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
