import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import QR code package
import 'package:flutter_application_1/restaurant_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: CouponDetail(
          restaurantName: 'KAMU KAMU',
          discount: 'Discount 20 Bath',
          location: 'Kamu ทุกสาขา',
          startDate: '2024-08-01',
          endDate: '2024-08-15',
          imageUrl:
              'https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CouponDetail extends StatefulWidget {
  final String restaurantName;
  final String discount;
  final String location;
  final String startDate;
  final String endDate;
  final String imageUrl;

  CouponDetail({
    required this.restaurantName,
    required this.discount,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
  });

  @override
  _CouponDetailState createState() => _CouponDetailState();
}

class _CouponDetailState extends State<CouponDetail> {
  late Timer _timer;
  int _selectedIndex = 0;
  Duration _remainingTime = const Duration(hours: 1, minutes: 30, seconds: 59);
  bool isExpired = false;
  bool showQrCode = false; // Add a state variable for showing QR code
  bool _isButtonVisible = true;
  bool _isTextMove = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.8;

    return Scaffold(
      backgroundColor: const Color(0xFFFBC079),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                toolbarHeight: 80,
                title: const Text(
                  'Coupon Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Define the action on click
                  },
                ),
              ),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFFBC079),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Container(
              height: 250, // กำหนดความสูงของพื้นที่สีส้มตรงรูปภาพ
              color: Color(0xFFFBC079),
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              // height: containerHeight,
              decoration: const BoxDecoration(
                color: Color(0xFFFBC079),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Scrollbar(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                    Container(
                      height: containerHeight,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.restaurantName,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Restaurant(restaurantName: widget.restaurantName), // Pass the restaurant name here
  ),
);

      },
                                child: const Text(
                                  "View restaurant >",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    // decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.discount,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF44A9A5),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "เมื่อซื้อสินค้าครบ 100 บาท",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Color(0xFFFBC079)),
                              const SizedBox(width: 2),
                              Text(
                                widget.location,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.date_range,
                                  color: Color(0xFFFBC079)),
                              const SizedBox(width: 5),
                              Text(
                                '${widget.startDate} - ${widget.endDate}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          //show the time text before click the button
                          if (_isTextMove) ...[
                          Align(
  alignment: Alignment.center, // Aligns the container to the right
  child: Container(
    width: 220,
    decoration: BoxDecoration(
      color: Colors.grey[300], // Background color for the grey sausage
      borderRadius: BorderRadius.circular(20), // Rounded edges
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding around the content
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the row takes minimum space
        children: [
          Icon(
            Icons.access_time_filled,
            color: Color(0xFF44A9A5),
          ),
          SizedBox(width: 8), // Adds some space between the icon and text
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
  ),
),

                          ],

                          const SizedBox(height: 20),
                          //show the time text before click the button
                          Center(
                            child: _isTextMove
                                ? Text(
                                    '${_remainingTime.inHours.toString().padLeft(2, '0')} : ${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')} : ${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                        fontSize: 36,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )
                                : Container(),
                          ),
                          //show the time text before click the button
                          if (_isTextMove) ...[
                            const SizedBox(height: 20),
                            const Center(
                                child: Text(
                              "Hours : Minutes : Seconds",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                          // button logic actions
                          Center(
                            child: _isButtonVisible
                                ? OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        showQrCode = true;
                                        _isButtonVisible = false;
                                        _isTextMove = false;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 2.0), // Orange border
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: const Text(
                                      'Use',
                                      style: TextStyle(
                                        color: Colors
                                            .black, // Black text as per the image
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                          if (showQrCode) ...[
                            // const SizedBox(height: 2),
                            Center(
                              child: Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Color(0xFFFBC079), // Change this to your desired border color
      width: 7.0, // Change this to your desired border width
    ),
    borderRadius: BorderRadius.circular(10.0), // Optional: For rounded corners
  ),
  child: QrImageView(
    data: 'https://www.example.com/coupon', // Customize this with your actual data
    version: QrVersions.auto,
    size: 250.0,
    backgroundColor: Colors.white,
  ),
)

                            ),
                            SizedBox(height: 10),
                            const Center(
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Ensures the row takes minimum space
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Color(0xFF44A9A5),
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Adds some space between the icon and text
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
                            // const SizedBox(height: 0),
                            Center(
                                child: Text(
                              '${_remainingTime.inHours.toString().padLeft(2, '0')} : ${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')} : ${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                            // const SizedBox(height: 10),
                            const Center(
                                child: Text(
                              "Hours : Minutes : Seconds",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Positioned(
  top: 10,
  left: 106,
  child: Container(
    width: 200, // Fixed width for the square
    height: 200, // Fixed height for the square
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20), // Adjust this value for the roundness
      // border: Border.all(color: Colors.white, width: 4), // White border
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Shadow color
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // Shadow offset
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20), // Match the container's border radius
      child: Image.network(
        widget.imageUrl, // Image URL from the widget
        width: 200, // Fixed width for the image
        height: 200, // Fixed height for the image
        fit: BoxFit.cover, // Cover the container
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey, // Placeholder color
            child: Icon(Icons.error, color: Colors.red), // Error icon
          );
        },
      ),
    ),
  ),
),

        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.card_giftcard),
      //       label: 'Coupon',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: const Color(0xFFFBC079),
      //   unselectedItemColor: Colors.grey,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}