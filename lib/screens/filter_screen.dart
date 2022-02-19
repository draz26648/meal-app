import 'package:draz_p1/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter';

  final Function saveFilter;
  final Map<String, bool> currentFliter;
  FilterScreen(this.currentFliter, this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFliter['gluten'];
    _lactoseFree = widget.currentFliter['lactose'];
    _vegan = widget.currentFliter['vegan'];
    _vegetarian = widget.currentFliter['vegetarian'];
    super.initState();
  }

  Widget buildSwitch(String titlen, String descraption, bool currntValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(titlen),
      subtitle: Text(descraption),
      value: currntValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch(
                "Gluten Free",
                "Only Include Gluten Free meals",
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              buildSwitch(
                "Lactose Free",
                "Only Include Lactose Free meals",
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              buildSwitch(
                "Vegan ",
                "Only Include Vegan meals",
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
              buildSwitch(
                "Vegetarian Free",
                "Only Include Vegetarian Free meals",
                _vegetarian,
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
