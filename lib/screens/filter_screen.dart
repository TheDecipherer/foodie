import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten-free'];
    _lactoseFree = widget.currentFilters['lactose-free'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListItem(String title, String description,
      Function updateValue, bool currentValue) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose-free': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
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
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListItem(
                  'Gluten-free',
                  'Only show gluten-free food',
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  _glutenFree,
                ),
                _buildSwitchListItem(
                  'Vegan',
                  'Only show vegan food',
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  _vegan,
                ),
                _buildSwitchListItem(
                  'Vegetarian',
                  'Only show vegetarian food',
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  _vegetarian,
                ),
                _buildSwitchListItem(
                  'Lactose-free',
                  'Only show lactose-free food',
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  _lactoseFree,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
