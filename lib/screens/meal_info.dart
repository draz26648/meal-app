import 'package:draz_p1/dummy_data.dart';

import 'package:flutter/material.dart';

class MealInfo extends StatelessWidget {
  static const routeName = '/f1';
  final Function favoriteMeal;
  final Function isMealFavorite;
  MealInfo(this.favoriteMeal, this.isMealFavorite);

  Widget buildTitle(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      width: 300,
      height: 200,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle("Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(ctx).accentColor,
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle("Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (cti, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favoriteMeal(mealID),
        child: Icon(
          isMealFavorite(mealID) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
