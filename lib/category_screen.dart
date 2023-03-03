import 'package:flutter/material.dart';
import './dummy_data.dart';
import './category_item.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MEAL APP')),
      body: GridView(
      padding: const EdgeInsets.all(25),
      children:DUMMY_CATEGORIES.map((cat)=>CategoryItem(cat.id, cat.title, cat.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ),
    );
  }
}
