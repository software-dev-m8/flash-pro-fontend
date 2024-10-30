import 'package:flutter/material.dart';
import 'package:flutter_application_1/branchselection_page.dart';

class Restaurant extends StatefulWidget {
  final String imageUrl = 'https://example.com/your-image-url.jpg'; // Replace with your image URL
  final String restaurantName; // Added restaurant name parameter

  // Constructor to accept restaurant name
  Restaurant({required this.restaurantName});

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  int? _selectedOption; // Variable to track selected option
  int? _selectedBranchOption; // Variable to track selected branch option
  int? _selectedMenuOption;
  bool _isAllChecked = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter, // Center the circular image
              children: [
                Positioned(
                  top: 80,
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
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 150), // Space for the circular image above
                      Text(
                        widget.restaurantName,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                     Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.location_on, size: 25, color: Color(0xFFFBC079)),
    SizedBox(width: 5),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BranchSelectionPage(
              imageUrl: widget.imageUrl,
              restaurantName: widget.restaurantName,
            ),
          ),
        );
      },
      child: Text(
        'Select branch',
        style: TextStyle(fontSize: 18),
      ),
    ),
    Icon(
      Icons.chevron_right,
      size: 30,
      color: Colors.grey,
    ),
  ],
),

                      SizedBox(height: 20),
                      Divider(color: Colors.grey, thickness: 1),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coupons',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          PopupMenuTheme(
                            data: PopupMenuThemeData(
                              color: Colors.white, // Set the background color of the popup menu
                            ),
                            child: PopupMenuButton<String>(
                              icon: Icon(Icons.more_vert, size: 25, color: Color(0xFFFBC079)),
                              offset: Offset(-20, 40), // Set your desired offset here
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    enabled: false, // Disable as it's purely for display purposes
                                    child: Container(
                                      width: 400, // Set your desired width here
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Column for "Sort by" section
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sort by',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black), // Set text color to black
                                                    ),
                                                    _buildCircularSelect('Recently added', 1, setState),
                                                    _buildCircularSelect('Expired Date', 2, setState),
                                                    _buildCircularSelect('Discount', 3, setState),
                                                  ],
                                                ),
                                              ),
                                              // Column for "Filter" section
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Filter',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black), // Set text color to black
                                                    ),
                                                    _buildSquareCheckbox('All', _isAllChecked, (value) {
                                                      setState(() {
                                                        _isAllChecked = value;
                                                        if (value) {
                                                          _selectedBranchOption = null;
                                                          _selectedMenuOption = null;
                                                        }
                                                      });
                                                    }),
                                                    Divider(color: Colors.grey), // Grey line
                                                    _buildBranchCircularSelect('ใช้ได้เฉพาะสาขา', 4, (value) {
  setState(() {
    _selectedBranchOption = value; // value is already the new option selected
    _isAllChecked = false; // Reset square checkbox when circular branch option is selected
  });
}),

                                                    _buildBranchCircularSelect('ใช้ได้ทุกสาขา', 5, (value) {
  setState(() {
    _selectedBranchOption = value; // value is already the new option selected
    _isAllChecked = false; // Reset square checkbox when circular branch option is selected
  });
}),
                                                    Divider(color: Colors.grey), // Grey line
                                                    _buildMenuCircularSelect('ใช้ได้เฉพาะเมนู', 6, (value) {
  setState(() {
    _selectedMenuOption = value; // value is already the new option selected
    _isAllChecked = false; // Reset square checkbox when circular menu option is selected
  });
}),

                                                    _buildMenuCircularSelect('ใช้ได้ทุกเมนู', 7, (value) {
  setState(() {
    _selectedMenuOption = value; // value is already the new option selected
    _isAllChecked = false; // Reset square checkbox when circular menu option is selected
  });
}),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildVerticalPromotionList([
                        {
                          'imageUrl': 'https://via.placeholder.com/80',
                          'storeName': 'Store X',
                          'promotionInfo': 'Special offer!',
                          'location': '123 Main St',
                          'startDate': '12/01/2024',
                          'endDate': '12/31/2024',
                          'couponsLeft': '5',
                          'type': 'Discount',
                        },
                        {
                          'imageUrl': 'https://via.placeholder.com/80',
                          'storeName': 'Store Y',
                          'promotionInfo': 'Limited time deal!',
                          'location': '456 Elm St',
                          'startDate': '11/01/2024',
                          'endDate': '11/30/2024',
                          'couponsLeft': '10',
                          'type': 'Exclusive',
                        },
                        {
                          'imageUrl': 'https://via.placeholder.com/80',
                          'storeName': 'Store Z',
                          'promotionInfo': 'Buy one get one free!',
                          'location': '789 Pine St',
                          'startDate': '10/15/2024',
                          'endDate': '11/15/2024',
                          'couponsLeft': '20',
                          'type': 'BOGO',
                        },
                      ]),
                    ],
                  ),
                ),
                Positioned(
  top: 0, // Adjust this to move the circular image up
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Shadow color
          spreadRadius: 2, // Spread radius of the shadow
          blurRadius: 8, // Blur radius of the shadow
          offset: Offset(0, 1), // Changes the position of the shadow
        ),
      ],
    ),
    child: CircleAvatar(
      radius: 80, // Size of the circular image
      backgroundColor: Colors.grey[300],
      backgroundImage: NetworkImage(widget.imageUrl), // Your image URL
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

  // Helper method for circular select options (Radio)
  Widget _buildCircularSelect(String label, int value, Function(void Function()) setState) {
    return Row(
      children: [
        Transform.scale(
          scale: 1, // Adjust the scale factor to make it smaller
          child: Radio<int>(
            value: value, // Set value to the integer value passed
            groupValue: _selectedOption, // Group value is the selected option
            onChanged: (int? newValue) {
              setState(() {
                _selectedOption = newValue; // Update the selected option
              });
            },
            activeColor: Color(0xFFFBC079),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 10, color: Colors.black), // Adjust the font size here
        ),
      ],
    );
  }

  Widget _buildBranchCircularSelect(String label, int value, Function(int) onChanged) {
  return Row(
    children: [
      Transform.scale(
        scale: 1, // Adjust the scale factor to make it smaller
        child: Radio<int>(
          value: value, // Set value to the integer value passed
          groupValue: _selectedBranchOption, // Group value is the selected option
          onChanged: (int? newValue) {
            if (newValue != null) {
              onChanged(newValue); // Pass the new value to the callback
            }
          },
          activeColor: Color(0xFFFBC079),
        ),
      ),
      Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.black), // Adjust the font size here
      ),
    ],
  );
}


  Widget _buildMenuCircularSelect(String label, int value, Function(int) onChanged) {
  return Row(
    children: [
      Transform.scale(
        scale: 1, // Adjust the scale factor to make it smaller
        child: Radio<int>(
          value: value, // Set value to the integer value passed
          groupValue: _selectedMenuOption, // Group value is the selected option
          onChanged: (int? newValue) {
            if (newValue != null) {
              onChanged(newValue); // Pass the new value to the callback
            }
          },
          activeColor: Color(0xFFFBC079),
        ),
      ),
      Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.black), // Adjust the font size here
      ),
    ],
  );
}


  // Helper method for square checkbox options
  Widget _buildSquareCheckbox(String label, bool isChecked, Function(bool) onChanged) {
    return Row(
      children: [
        Transform.scale(
          scale: 1, // Adjust the scale factor to make it smaller
          child: Checkbox(
            value: isChecked,
              onChanged: (bool? value) {
              onChanged(value!);
            },

            activeColor: Color(0xFFFBC079),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 10, color: Colors.black), // Adjust the font size here
        ),
      ],
    );
  }

  // Helper method to build the vertical promotion list
  Widget _buildVerticalPromotionList(List<Map<String, String>> promotions) {
  return Container(
    margin: EdgeInsets.only(top: 0),
    child: Column(
      children: promotions.map((promotion) {
        return _buildVerticalPromotionCard(
          imageUrl: promotion['imageUrl']!,
          storeName: promotion['storeName']!,
          promotionDetail: promotion['promotionInfo']!,
          location: promotion['location']!,
          startDate: promotion['startDate']!,
          endDate: promotion['endDate']!,
          couponsLeft: promotion['couponsLeft']!,
          type: promotion['type']!, // Pass the type here
        );
      }).toList(),
    ),
  );
}


  Widget _buildVerticalPromotionCard({
  required String imageUrl,
  required String storeName,
  required String promotionDetail,
  required String location,
  required String startDate,
  required String endDate,
  required String couponsLeft,
  required String type, // Add type as a parameter
}) {
  return GestureDetector(
    onTap: () {
      // Add your action here, e.g., navigate to a detail page
      print('Tapped on $storeName promotion');
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFFFEF6EB),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            left: 358,
            top: 55,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0xFFFBC079), width: 4),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: promotionDetail,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: '  $type', // Add type immediately after detail
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey, // Smaller font and grey color for the type
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 25, color: Color(0xFFFBC079)),
                          SizedBox(width: 4),
                          Text(location, style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range, size: 25, color: Color(0xFFFBC079)),
                          SizedBox(width: 4),
                          Text('$startDate - $endDate', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('$couponsLeft coupons left', style: TextStyle(color: Color(0xFFD04040))),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
  // Show the confirmation dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white, // Set the background color to white
        content: Text(
          "When you collect the coupon, you'll have 2 hours to use it.",
          textAlign: TextAlign.center, // Center align the text itself
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
            fontSize: 18, // Increase font size (adjust as needed)
          ),
        ),
        actions: <Widget>[
          Center( // Center the Column horizontally
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the column takes only as much space as needed
              children: [
                // Agree Button
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFBC079), // Sausage color (adjust as needed)
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle agree action
                      Navigator.of(context).pop(); // Close the dialog
                      print('User agreed to the coupon terms');
                    },
                    child: Text(
                      'Agree',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make the button text bold
                        fontSize: 18, // Increase button text size (adjust as needed)
                        color: Colors.black, // Text color
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Add padding for height and width
                      minimumSize: Size(200, 30), // Increased minimum button width
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add space between buttons
                // Back Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey, // Make it the same color as the Agree button
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle back action
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make the button text bold
                        fontSize: 18, // Increase button text size (adjust as needed)
                        color: Colors.white, // Text color
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Add padding for height and width
                      minimumSize: Size(200, 30), // Increased minimum button width
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
},

                            child: Text(
                              'Collect',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFBC079),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              minimumSize: Size(80, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ],
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
