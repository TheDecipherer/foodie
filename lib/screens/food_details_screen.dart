import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatelessWidget {
  static String routeName = '/food-details';

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('The meal - $foodId'),
      ),
      body: Center(
        child: Text('The meal - $foodId'),
      ),
    );
  }
}
