import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'restaurant_managment.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const RestaurantManagementPage(),
    );
  }
}
