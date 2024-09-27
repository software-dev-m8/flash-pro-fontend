import 'package:flutter/material.dart';

class Usertype extends StatelessWidget {
  const Usertype({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select User Type',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        backgroundColor: Colors.orange[100], // Adjusted to a lighter orange
        body: SafeArea(
          child: Column(
            children: [
              // Orange top section with back arrow and rounded bottom corners
              Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFE0B2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white, // Circular back button
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // White background with rounded top and border shadow for content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      // Title Text
                      const Text(
                        'Select user type',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Customer Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: InkWell(
                          onTap: () {
                            // Handle customer selection
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 64,
                                  color: Colors.orange,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Customer',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // OR Separator
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
                      const SizedBox(height: 30),

                      // Restaurant Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: InkWell(
                          onTap: () {
                            // Handle restaurant selection
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.storefront,
                                  size: 64,
                                  color: Colors.orange,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Restaurant',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Log in Link
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already have account? ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
