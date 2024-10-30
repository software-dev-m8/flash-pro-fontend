import 'package:flutter/material.dart';

class MyCouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _buildVerticalPromotionList([
                {
                  'imageUrl': 'https://via.placeholder.com/80',
                  'storeName': 'Store X',
                  'promotionInfo': 'Special offer!',
                  'location': '123 Main St',
                  'startDate': '2024-12-01T00:00:00',
                  'endDate': '2024-12-31T23:59:59',
                  'timeRemaining': '10 days, 5 hours',
                  'type': 'Discount'
                },
                {
                  'imageUrl': 'https://via.placeholder.com/80',
                  'storeName': 'Store Y',
                  'promotionInfo': 'Limited time deal!',
                  'location': '456 Elm St',
                  'startDate': '2024-11-01T00:00:00',
                  'endDate': '2024-11-30T23:59:59',
                  'timeRemaining': '2 days, 3 hours',
                  'type': 'Coupon'
                },
              ]),
            ],
          ),
        ),
      );

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
            startDate: promotion['startDate']!,
            endDate: promotion['endDate']!,
            timeRemaining: promotion['timeRemaining']!,
            type: promotion['type']!, // New parameter
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
    required String timeRemaining,
    required String type, // New parameter
  }) {
    final DateTime startDateTime = DateTime.parse(startDate);
    final DateTime endDateTime = DateTime.parse(endDate);

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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                        Row(
                          children: [
                            Text(
                              promotionDetail,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(width: 8), // Small gap between promotionDetail and type
                            Text(
                              type, // Displaying the 'type' parameter right after promotionDetail
                              style: TextStyle(fontSize: 16, color: Colors.grey), // Font size 16 and grey color
                            ),
                          ],
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
                            Text('${startDateTime.toLocal().toString().split(' ')[0]} - ${endDateTime.toLocal().toString().split(' ')[0]}', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Time remaining: $timeRemaining', style: TextStyle(color: Color(0xFFD04040))),
                            Spacer(), // Pushes the button to the right
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Use', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xFFFBC079), width: 2),
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
