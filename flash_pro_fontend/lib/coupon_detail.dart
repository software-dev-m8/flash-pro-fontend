import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/restaurant_page.dart';
import 'package:flutter_application_1/coupon_detail_before.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import QR code package
import 'package:http/http.dart' as http;

class CouponDetail extends StatefulWidget {
  final String userId;
  final String couponId;
  final String restaurantName;
  final String discount;
  final String location;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final String amount;
  final String type;

  CouponDetail({
    required this.restaurantName,
    required this.discount,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.amount,
    required this.type,
    required this.userId,
    required this.couponId,
  });

  @override
  _CouponDetailState createState() => _CouponDetailState();
}

class _CouponDetailState extends State<CouponDetail> {
  String buttonText = "Collect";

  Future<void> _collectCoupon(String userId, String couponId) async {
    try {
      final res = await http.post(
          Uri.parse(
            'https://flash.mupingdev.org/api/userCoupons/collectCoupon',
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'userId': userId,
            'couponId': couponId,
          }));
    } catch (e) {
      debugPrint('$e');
    }
  }
  bool _isQrVisible = false;
  Duration _remainingTime = const Duration(hours: 0, minutes: 4, seconds: 59);

  Widget showQr() {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFFBC079), // Desired border color
                width: 7.0, // Desired border width
              ),
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            child: QrImageView(
              data:
                  'https://www.example.com/coupon', // Customize with actual data
              version: QrVersions.auto,
              size: 250.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Minimum space
            children: [
              Icon(
                Icons.access_time_filled,
                color: Color(0xFF44A9A5),
              ),
              SizedBox(width: 8),
              Text(
                "TIME REMAINING",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF44A9A5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            '${_remainingTime.inHours.toString().padLeft(2, '0')} : ${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')} : ${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Center(
          child: Text(
            "Hours : Minutes : Seconds",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.75;

    // Parse the end date and calculate the days left until expiration
    DateTime today = DateTime.now();
    DateTime endDateValue = DateFormat('yyyy-MM-dd').parse(widget.endDate);
    Duration difference = endDateValue.difference(today);
    String daysLeft = difference.isNegative
        ? "Expired"
        : "${difference.inDays} days left until expiration";

    return Scaffold(
      backgroundColor: Color(0xFFFBC079),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: [
            AppBar(
              title: const Text(
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 90),
                      Text(
                        widget.restaurantName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.discount, color: Color(0xFF44A9A5)),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.discount}',
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xFF44A9A5)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.type}',
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
                            widget.location,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.date_range, color: Color(0xFFFBC079)),
                          SizedBox(width: 5),
                          Text(
                            '${widget.startDate} - ${widget.endDate}',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 125,
                            height: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFF0F0F0),
                                  child: Icon(Icons.label,
                                      color: Color(0xFF44A9A5), size: 40),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  '${widget.amount} coupons left',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
                                  child: Icon(Icons.access_time_filled,
                                      color: Color(0xFF44A9A5), size: 40),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    daysLeft,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
                            if (buttonText == "Use") {
                              setState(() {
                                _isQrVisible = true;
                              });
                              debugPrint('$_isQrVisible');
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      "When you collect the coupon, you'll have 2 hours to use it.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBC079),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    buttonText = "Use";
                                                  });
                                                  _collectCoupon(widget.userId,
                                                      widget.couponId);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Agree',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 40),
                                                  minimumSize: Size(200, 30),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Back',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 40),
                                                  minimumSize: Size(200, 30),
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
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonText == "Use"
                                ? Colors.white
                                : Color(0xFFFBC079),
                            padding: EdgeInsets.symmetric(
                                horizontal: 65, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                  color: buttonText == "Use"
                                      ? Color(0xFFFBC079)
                                      : Colors.transparent,
                                  width: 2),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isQrVisible,
                        child: Column(
                          children: [
                            SizedBox(height: 20), // Add space before QR code
                            showQr(), // Call your QR code display method here
                            SizedBox(height: 10), // Add space after QR code
                            // Add remaining time display here if needed
                          ],
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
                  image: NetworkImage(widget.imageUrl),
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
                      builder: (context) => Restaurant(
                          restaurantName: widget
                              .restaurantName), // Pass the restaurant name here
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
