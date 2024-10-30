import 'package:flutter/material.dart';
import 'package:flutter_application_1/coupon_detail_before.dart';

class MyCouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _buildVerticalPromotionList(context, [
                {
                  'imageUrl': 'https://via.placeholder.com/80',
                  'storeName': 'Store X',
                  'promotionInfo': 'Special offer!',
                  'location': '123 Main St',
                  'startDate': '2024-12-01',
                  'endDate': '2024-12-31',
                  'timeRemaining': '10 days, 5 hours',
                  'type': 'Discount'
                },
                {
                  'imageUrl': 'https://via.placeholder.com/80',
                  'storeName': 'Store Y',
                  'promotionInfo': 'Limited time deal!',
                  'location': '456 Elm St',
                  'startDate': '2024-11-01',
                  'endDate': '2024-11-30',
                  'timeRemaining': '2 days, 3 hours',
                  'type': 'Coupon'
                },
              ]),
            ],
          ),
        ),
      );

  Widget _buildVerticalPromotionList(BuildContext context, List<Map<String, String>> promotions) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: promotions.map((promotion) {
          return _buildVerticalPromotionCard(
            context,  // Pass the context here
            imageUrl: promotion['imageUrl']!,
            storeName: promotion['storeName']!,
            promotionDetail: promotion['promotionInfo']!,
            location: promotion['location']!,
            startDate: promotion['startDate']!,
            endDate: promotion['endDate']!,
            timeRemaining: promotion['timeRemaining']!,
            type: promotion['type']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVerticalPromotionCard(
    BuildContext context, { // Add context as a parameter
    required String imageUrl,
    required String storeName,
    required String promotionDetail,
    required String location,
    required String startDate,
    required String endDate,
    required String timeRemaining,
    required String type,
  }) {
    final DateTime startDateTime = DateTime.parse(startDate);
    final DateTime endDateTime = DateTime.parse(endDate);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouponDetail(
              imageUrl: imageUrl,
              restaurantName: storeName,
              discount: promotionDetail,
              location: location,
              startDate: startDate,
              endDate: endDate,
            ),
          ),
        );
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
                              type,
                              style: TextStyle(fontSize: 16, color: Colors.grey),
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
                            Spacer(),
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
