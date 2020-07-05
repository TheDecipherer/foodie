import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/food_item.dart';

class CategoryFoodScreen extends StatefulWidget {
  static const routeName = '/category-food';

  final List<Meal> availableFood;

  CategoryFoodScreen(this.availableFood);

  @override
  _CategoryFoodScreenState createState() => _CategoryFoodScreenState();
}

class _CategoryFoodScreenState extends State<CategoryFoodScreen> {
  String categoryTitle;
  List<Meal> selectedCategory;

  /// not required nowadays, should check more.
  bool _loadedInitData = false;

  @override
  void initState() {
    /// context will not work.
    /// didChangeDependencies() is the work around.
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      selectedCategory = widget.availableFood.where((food) {
        return food.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeFood(String foodId) {
    setState(() {
      selectedCategory.removeWhere((food) => food.id == foodId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeItem: _removeFood,
          );
        },
        itemCount: selectedCategory.length,
      ),
    );
  }
}
