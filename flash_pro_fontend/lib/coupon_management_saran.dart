import 'package:flutter/material.dart';

class CouponManagementPage extends StatelessWidget {
  const CouponManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Increased AppBar height
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white, // Set the AppBar background color to white
              title: const Text(
                'Coupon Management',
                style: TextStyle(
                  color: Colors.black, // Change text color to black for contrast
                  fontWeight: FontWeight.bold, // Make the title bold
                ),
              ),
              elevation: 0, // Remove the default shadow
            ),
            const SizedBox(height: 10),
            Container(
              height: 4.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFBC079),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( // Enables scrolling for the content
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Set horizontal padding here
          child: Column(
            children: [
              const SizedBox(height: 20), // Spacing from the top
              _buildVerticalPromotionList([
                 {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store A',
    'promotionInfo': 'Best deal!',
    'location': '789 Oak St',
    'startDate': '2024-12-01',  // Updated startDate format
    'endDate': '2024-12-31',    // Updated endDate format
    'couponsLeft': '3',
    'type': 'Discount',
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store B',
    'promotionInfo': 'Hot discount!',
    'location': '321 Pine St',
    'startDate': '2024-11-01',  // Updated startDate format
    'endDate': '2024-11-30',    // Updated endDate format
    'couponsLeft': '8',
    'type': 'Exclusive',
  },
                // You can add more promotion items here if needed
              ], context), // Pass context here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalPromotionList(List<Map<String, String>> promotions, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
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
            type: promotion['type']!,
            context: context, // Pass context to the card
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
    required BuildContext context, // Add context as a parameter
  }) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF6EB),
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
                decoration: const BoxDecoration(
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
                  margin: const EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFFBC079), width: 4),
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
                          style: const TextStyle(
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
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '  $type', // Add type immediately after detail
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey, // Smaller font and grey color for the type
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 25, color: Color(0xFFFBC079)),
                            const SizedBox(width: 4),
                            Text(location, style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.date_range, size: 25, color: Color(0xFFFBC079)),
                            const SizedBox(width: 4),
                            Text('$startDate - $endDate', style: const TextStyle(color: Colors.black)),
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