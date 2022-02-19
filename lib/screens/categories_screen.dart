import 'package:draz_p1/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:draz_p1/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItems(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
