import 'package:draz_p1/screens/categories_screen.dart';
import 'package:draz_p1/screens/filter_screen.dart';
import 'package:draz_p1/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function handelar) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      onTap: handelar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking App!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
