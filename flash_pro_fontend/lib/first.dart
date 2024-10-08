// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/login.dart';
import 'package:flash_pro_fontend/usertype.dart';

class First extends StatelessWidget {
  const First({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Money',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo at the top (can be an icon or image)
                  Container(
                    margin: const EdgeInsets.only(bottom: 40.0),
                    child: Image.asset('access/logo4.png'),
                    width: 250,
                    height: 250,
                  ),

                  // Main Title Text
                  const Text(
                    'Save your Money\nWith No limits',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle Text
                  const Text(
                    'Discovered some privileges from our partner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        runApp(const Usertype());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ), // Background color
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Or Separator
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        runApp(const Login());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(
                            color: Colors.orange), // Border color
                      ),
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
