import 'package:flutter/material.dart';
import 'package:foodie/categories_screen.dart';
import 'package:foodie/category_food_screen.dart';

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
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryFoodScreen.routeName: (context) => CategoryFoodScreen(),
      },
    );
  }
}
