import 'package:flutter/material.dart';
import 'package:foodie/widgets/food_item.dart';

import '../dummy_data.dart';

class CategoryFoodScreen extends StatelessWidget {
  static const routeName = '/category-food';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final selectedCategory = DUMMY_MEALS.where((food) {
      return food.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FoodItem(
            id: selectedCategory[index].id,
            title: selectedCategory[index].title,
            imageUrl: selectedCategory[index].imageUrl,
            duration: selectedCategory[index].duration,
            complexity: selectedCategory[index].complexity,
            affordability: selectedCategory[index].affordability,
          );
        },
        itemCount: selectedCategory.length,
      ),
    );
  }
}
