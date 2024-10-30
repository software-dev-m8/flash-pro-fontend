import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/restaurant_page.dart';

class CouponDetail extends StatelessWidget {
  final String restaurantName;
  // final String menuName;
  // final String originalPrice;
  final String discount;
  final String location;
  final String startDate; // Added start date
  final String endDate; // Added end date
  final String imageUrl;
  final String amount;
  final String type;

  CouponDetail({
    required this.restaurantName,
    // required this.menuName,
    // required this.originalPrice,
    required this.discount,
    required this.location,
    required this.startDate, // Include start date in constructor
    required this.endDate, // Include end date in constructor
    required this.imageUrl,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.75;

    // Calculate new price from original price and discount
    // double originalPriceValue = double.tryParse(originalPrice.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0; // Clean the input
    // double discountValue = double.tryParse(discount.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0; // Clean the input
    // double newPrice = originalPriceValue - discountValue; // Calculate new price

    // Get today's date
    DateTime today = DateTime.now();
    DateTime endDateValue = DateFormat('yyyy-MM-dd').parse(endDate); // Parse end date from string

    // Calculate days left until expiration
    Duration difference = endDateValue.difference(today);
    String daysLeft = difference.isNegative ? "Expired" : "${difference.inDays} days left until expiration"; // Handle expiration case

    return Scaffold(
      backgroundColor: Color(0xFFFBC079),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Coupon Detail',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
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
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90),
                      Text(
                        restaurantName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      // Text(
                      //   menuName,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.discount, color: Color(0xFF44A9A5)),
                          SizedBox(width: 5),
                          Text(
                            '$discount',
                            style: TextStyle(fontSize: 20, color: Color(0xFF44A9A5)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$type',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Color(0xFFFBC079)),
                          SizedBox(width: 5),
                          Text(
                            location,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Start Date and End Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.date_range, color: Color(0xFFFBC079)),
                          SizedBox(width: 5),
                          Text(
                            '$startDate - $endDate', // Display start and end dates
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),

                      // Color Boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: 110,
                          //   height: 130,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       CircleAvatar(
                          //         radius: 30,
                          //         backgroundColor: Color(0xFFF0F0F0),
                          //         child: Icon(Icons.shopping_basket, color: Color(0xFF44A9A5), size: 40),
                          //       ),
                          //       SizedBox(height: 15),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text(
                          //             'Price: ',
                          //             style: TextStyle(fontSize: 12, color: Colors.grey),
                          //           ),
                          //           // Text(
                          //           //   '$originalPrice Baht',
                          //           //   style: TextStyle(
                          //           //     fontSize: 12,
                          //           //     color: Colors.grey,
                          //           //     decoration: TextDecoration.lineThrough,
                          //           //   ),
                          //           // ),
                          //         ],
                          //       ),
                          //       // Text(
                          //       //   '${newPrice.toStringAsFixed(2)} Baht', // Display calculated new price
                          //       //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFD04040)),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          Container(
                            width: 125,
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFF0F0F0),
                                  child: Icon(Icons.label, color: Color(0xFF44A9A5), size: 40),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  '$amount coupons left',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 125,
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFF0F0F0),
                                  child: Icon(Icons.access_time_filled, color: Color(0xFF44A9A5), size: 40),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    daysLeft, // Display days left until expiration
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
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
                      Navigator.of(context).popUntil((route) => route.isFirst); // Go back to the previous page
                      // Navigator.of(context).pop(); // Close the dialog
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


                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFBC079),
                            padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Collect',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: (MediaQuery.of(context).size.width - 200) / 2,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
  top: 230,
  left: 270,
  child: Container(
    width: 160,
    height: 45,
    child: TextButton(
      onPressed: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Restaurant(restaurantName: restaurantName), // Pass the restaurant name here
  ),
);

      },
      child: Row(
        children: [
          Text(
            'view restaurant',
            style: TextStyle(color: Colors.grey),
          ),
          Icon(
            Icons.chevron_right,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}
