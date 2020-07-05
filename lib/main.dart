import 'package:flutter/material.dart';

import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/food_details_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_food_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.lightGreen,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryFoodScreen.routeName: (context) => CategoryFoodScreen(),
        FoodDetailsScreen.routeName: (context) => FoodDetailsScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
