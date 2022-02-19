import 'package:draz_p1/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItems(
    this.id,
    this.title,
    this.color,
  );
  void selectedScreen(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryMeals.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onTap: () {
        selectedScreen(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
