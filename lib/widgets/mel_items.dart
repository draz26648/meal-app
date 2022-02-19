import 'package:draz_p1/models/meal.dart';
import 'package:draz_p1/screens/meal_info.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imagelink;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.imagelink,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealInfo.routeName,
      arguments: id,
    )
        .then((reslut) {
      //if (reslut != null) removeItem(reslut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Image.network(imagelink),
                ),
                SizedBox(
                  height: 50,
                ),
                Positioned(
                  bottom: 15,
                  left: 10,
                  child: Container(
                    color: Colors.black38,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${duration} Min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => selectedMeal(context),
    );
  }
}
