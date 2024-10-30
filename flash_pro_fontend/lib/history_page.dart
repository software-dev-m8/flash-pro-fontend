import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 80,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text(
                    'History',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                Container(
                  height: 6,
                  color: Color(0xFFFBC079),
                ),
              ],
            ),
          ),
          Container(
            height: 4,
            color: Colors.black.withOpacity(0.1),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  _buildVerticalPromotionList([
                    {
                      'imageUrl': 'https://via.placeholder.com/80',
                      'storeName': 'Store X',
                      'promotionInfo': 'Special offer!',
                      'location': '123 Main St',
                      'date': 'Expires: 12/31/2024',
                      'time': '10:00 AM',
                    },
                    {
                      'imageUrl': 'https://via.placeholder.com/80',
                      'storeName': 'Store Y',
                      'promotionInfo': 'Limited time deal!',
                      'location': '456 Elm St',
                      'date': 'Expires: 11/30/2024',
                      'time': '2:00 PM',
                    },
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalPromotionList(List<Map<String, String>> promotions) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: promotions.map((promotion) {
          return _buildVerticalPromotionCard(
            imageUrl: promotion['imageUrl']!,
            storeName: promotion['storeName']!,
            promotionDetail: promotion['promotionInfo']!,
            location: promotion['location']!,
            date: promotion['date']!,
            time: promotion['time']!, // Added time parameter
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
    required String date,
    required String time, // Added time parameter
  }) {
    return GestureDetector(
      onTap: () {
        print('Tapped on $storeName promotion');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: 125,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFFEF6EB),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Positioned(
              left: 370,
              top: 38,
              child: Container(
                width: 50,
                height: 50,
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          promotionDetail,
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
                            Text(date, style: TextStyle(color: Colors.black)),
                            SizedBox(width: 10), // Add spacing between date and time
                            Icon(Icons.access_time, size: 25, color: Color(0xFFFBC079)), // Clock icon
                            SizedBox(width: 4),
                            Text(time, style: TextStyle(color: Colors.black)), // Display time
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
