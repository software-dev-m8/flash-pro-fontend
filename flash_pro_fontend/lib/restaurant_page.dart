import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final String imageUrl = 'https://example.com/your-image-url.jpg'; // Replace with your image URL
  final String restaurantName; // Added restaurant name parameter

  // Constructor to accept restaurant name
  Restaurant({required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBC079), // Background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              toolbarHeight: 80,
            ),
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFFFBC079),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // White box container
          Positioned(
            top: 90, // Adjust based on your AppBar height
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80), // Space for the circular image
                      Text(
                        restaurantName, // Display restaurant name
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, size: 25, color: Color(0xFFFBC079)), // Location icon
                          SizedBox(width: 5), // Spacing between icon and text
                          Text(
                            'Select branch',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 5), // Spacing between text and icon
                          Icon(Icons.arrow_forward_ios, size: 18), // Arrow icon
                        ],
                      ),
                      SizedBox(height: 20), // Add spacing before the grey line
                      Divider(
                        color: Colors.grey, // Grey line color
                        thickness: 1, // Thickness of the line
                      ),
                      SizedBox(height: 20), // Add spacing after the grey line
                      
                      // Coupons label and options icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coupons',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.more_vert, size: 25,color: Color(0xFFFBC079),), // Options icon
                        ],
                      ),

                      SizedBox(height: 20), // Add spacing after the row
                      // Add more content here if needed
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Circular image directly positioned
          Positioned(
            top: 10, // Adjust this value to control how high the image appears
            left: (MediaQuery.of(context).size.width - 160) / 2, // Center the image horizontally
            child: CircleAvatar(
              radius: 80, // Size of the circular image
              backgroundColor: Colors.grey[300], // Placeholder background color
              backgroundImage: NetworkImage(imageUrl), // Use your image URL
            ),
          ),
        ],
      ),
    );
  }
}
