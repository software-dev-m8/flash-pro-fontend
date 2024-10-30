import 'package:flutter/material.dart';

class BranchSelectionPage extends StatefulWidget {
  final String imageUrl;
  final String restaurantName;

  BranchSelectionPage({required this.imageUrl, required this.restaurantName});

  @override
  _BranchSelectionPageState createState() => _BranchSelectionPageState();
}

class _BranchSelectionPageState extends State<BranchSelectionPage> {
  TextEditingController _searchController = TextEditingController();

  final List<String> branches = [
    'Branch 1',
    'Branch 2',
    'Branch 3',
    'Branch 4',
    'Branch 5',
    'Branch 6',
    'Branch 7',
    'Branch 8',
    'Branch 9',
    // Add more branches as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBC079),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 135,
                  child: Container(
                    height: 1500,
                    width: 412,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 230), // Space for the square image
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(0, 1), // Shadow below the search bar
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40), // Keep border radius
                            color: Colors.white, // Background color for the search bar
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10), // Add space to the left of the icon
                                child: Icon(Icons.search, color: Color(0xFFFBC079), size: 30), // Increased icon size
                              ),
                              border: InputBorder.none, // Removes the border
                              contentPadding: EdgeInsets.symmetric(vertical: 14),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 0, // Set minWidth to allow flexibility
                                minHeight: 0, // Set minHeight to allow flexibility
                                maxWidth: 40, // Adjust to position the icon further to the right
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Vertical list of branches
                     // Vertical list of branches
Column(
  children: branches.map((branch) {
    return Column(
      children: [
       Container(
  padding: EdgeInsets.symmetric(vertical: 8), // Padding for each item
  child: Row(
    children: [
      SizedBox(width: 30), // Add space to the left of the location icon
      Icon(Icons.location_on, color: Color(0xFF44A9A5), size: 30), // Location icon
      SizedBox(width: 8), // Space between icon and text
      Text(
        branch, // Display branch name
        style: TextStyle(
          fontSize: 18, // Increase text size (adjust as needed)
          color: Colors.black, // Set text color to black
        ),
      ),
    ],
  ),
),


        Divider(
          color: Colors.grey[300], // Grey line
          thickness: 1,
        ),
      ],
    );
  }).toList(),
),

                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  child: Container(
                    width: 180,  // Set width for square
                    height: 180, // Set height for square
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20), // For rounded corners
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 1), // Offset to create shadow below
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}