import 'package:flutter/material.dart';
import '/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Y'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': false,
                  'lactose': false,
                  'vegetarian': false
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust Your wish',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            _buildSwitchListTile(
                'Glueten Free', 'Only Include gluten free meals', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            } as Function()),
            _buildSwitchListTile('Lactose-Free Free',
                'Only Include Lactose free meals', _glutenFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            } as Function()),
            _buildSwitchListTile(
                'Vegetarian', 'Only Include Vegetarian meals', _glutenFree,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            } as Function())
          ],
        ))
      ]),
    );
  }
}
