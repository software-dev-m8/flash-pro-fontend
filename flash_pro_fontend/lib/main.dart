import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'restaurant_managment.dart'; // Import the Restaurant Management page here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: RestaurantManagementPage(), // Set the home to RestaurantManagementPage
    );
  }
}
