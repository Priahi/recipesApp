import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> initFilters;
  final Function _setFilters;

  FiltersScreen(this.initFilters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    super.initState();
    _isGlutenFree = widget.initFilters['gluten'];
    _isLactoseFree = widget.initFilters['lactose'];
    _isVegan = widget.initFilters['vegan'];
    _isVegetarian = widget.initFilters['vegetarian'];
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget._setFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten-Free',
                'Filters out meals with gluten',
                _isGlutenFree,
                (newVal) {
                  setState(() {
                    _isGlutenFree = newVal;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose-Free',
                'Filters out meals with lactose',
                _isLactoseFree,
                (newVal) {
                  setState(() {
                    _isLactoseFree = newVal;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Filters out meals with animal products',
                _isVegan,
                (newVal) {
                  setState(() {
                    _isVegan = newVal;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Filters out meals with meat',
                _isVegetarian,
                (newVal) {
                  setState(() {
                    _isVegetarian = newVal;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
