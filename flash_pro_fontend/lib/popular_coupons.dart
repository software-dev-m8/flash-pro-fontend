import 'package:flutter/material.dart';

class PopularCouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Increased AppBar height
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white, // Set the AppBar background color to white
              title: Text(
                'Popular Coupons',
                style: TextStyle(
                  color: Colors.black, // Change text color to black for contrast
                  fontWeight: FontWeight.bold, // Make the title bold
                ),
              ),
              elevation: 0, // Remove the default shadow
            ),
            SizedBox(height: 10),
            Container(
              height: 4.0,
              decoration: BoxDecoration(
                color: Color(0xFFFBC079),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Set horizontal padding here
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildVerticalPromotionList([
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store A',
    'promotionInfo': 'Best deal!',
    'location': '789 Oak St',
    'startDate': '12/01/2024', // Start date
    'endDate': '12/31/2024',   // End date
    'couponsLeft': '3',
    'type': 'Discount', // Add type here
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store B',
    'promotionInfo': 'Hot discount!',
    'location': '321 Pine St',
    'startDate': '11/01/2024', // Start date
    'endDate': '11/30/2024',   // End date
    'couponsLeft': '8',
    'type': 'Exclusive', // Add type here
  },
])

          ],
        ),
      ),
    );
  }

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
                            onPressed: () {},
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
