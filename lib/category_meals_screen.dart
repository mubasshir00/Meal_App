import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(child: Text('for category')),
    );
  }
}
