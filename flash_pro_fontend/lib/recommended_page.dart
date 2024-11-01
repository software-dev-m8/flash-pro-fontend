// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/coupon_detail.dart';
// import 'package:http/http.dart' as http;

// class RecommendedPage extends StatefulWidget {
//   @override
//   State<RecommendedPage> createState() => _RecommendedPageState();
// }

// class _RecommendedPageState extends State<RecommendedPage> {
//   List<Map<String, dynamic>> coupons = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCoupons();
//   }

//   Future<List<Map<String, dynamic>>> fetchCoupons() async {
//     final apiUrl = Uri.parse('https://flash.mupingdev.org/api/coupons');
//     try {
//       final response = await http.get(apiUrl);
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         return data
//             .map((coupon) => {
//                   'imageUrl': coupon['couponImage'] ?? '',
//                   'storeName': coupon['restaurantBranch'] ?? 'Unknown Branch',
//                   'promotionInfo':
//                       '${coupon['discountPercent'] ?? 0}% off on ${coupon['foodName']}',
//                   'location': coupon['restaurantBranch'] ?? 'Not specified',
//                   'startDate': coupon['startDate'] ?? '',
//                   'endDate': coupon['endDate'] ?? '',
//                   'couponsLeft': coupon['amount'].toString(),
//                   'type': coupon['couponType'] ?? 'General',
//                 })
//             .toList();
//       } else {
//         throw Exception('Failed to load coupons');
//       }
//     } catch (e) {
//       print('Error fetching coupons: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: Column(
//           children: [
//             AppBar(
//               backgroundColor: Colors.white,
//               title: Text(
//                 'Recommended for you',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               elevation: 0,
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: 4.0,
//               decoration: BoxDecoration(
//                 color: Color(0xFFFBC079),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     offset: Offset(0, 2),
//                     blurRadius: 4.0,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: coupons,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error loading coupons'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No coupons available'));
//           }
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: _buildVerticalPromotionList(snapshot.data!, context),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildVerticalPromotionList(
//       List<Map<String, String>> promotions, BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 0),
//       child: Column(
//         children: promotions.map((promotion) {
//           return _buildVerticalPromotionCard(
//             imageUrl: promotion['imageUrl']!,
//             storeName: promotion['storeName']!,
//             promotionDetail: promotion['promotionInfo']!,
//             location: promotion['location']!,
//             startDate: promotion['startDate']!,
//             endDate: promotion['endDate']!,
//             couponsLeft: promotion['amount']!,
//             type: promotion['couponType']!,
//             context: context, // Pass context to the card
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildVerticalPromotionCard({
//     required String imageUrl,
//     required String storeName,
//     required String promotionDetail,
//     required String location,
//     required String startDate,
//     required String endDate,
//     required String couponsLeft,
//     required String type, // Add type as a parameter
//     required BuildContext context, // Add context as a parameter
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CouponDetail(
//               // menuName: menuName,
//               imageUrl: imageUrl,
//               restaurantName: storeName,
//               discount: promotionDetail,
//               location: location,
//               startDate: startDate,
//               endDate: endDate,
//               // originalPrice: originalPrice,
//               amount: couponsLeft,
//               type: type,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 16),
//         child: Stack(
//           children: [
//             Positioned(
//               right: 0,
//               child: Container(
//                 height: 180,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFEF6EB),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 358,
//               top: 55,
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 80,
//                   height: 80,
//                   margin: EdgeInsets.only(left: 0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: Color(0xFFFBC079), width: 4),
//                     image: DecorationImage(
//                       image: NetworkImage(imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           storeName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: promotionDetail,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text:
//                                     '  $type', // Add type immediately after detail
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors
//                                       .grey, // Smaller font and grey color for the type
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on,
//                                 size: 25, color: Color(0xFFFBC079)),
//                             SizedBox(width: 4),
//                             Text(location,
//                                 style: TextStyle(color: Colors.black)),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.date_range,
//                                 size: 25, color: Color(0xFFFBC079)),
//                             SizedBox(width: 4),
//                             Text('$startDate - $endDate',
//                                 style: TextStyle(color: Colors.black)),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text('$couponsLeft coupons left',
//                                 style: TextStyle(color: Color(0xFFD04040))),
//                             SizedBox(width: 8),
//                             ElevatedButton(
//                               onPressed: () {
//                                 _showCollectPopup(
//                                     context); // Use passed context
//                               },
//                               child: Text(
//                                 'Collect',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFFFBC079),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 8, vertical: 4),
//                                 minimumSize: Size(80, 30),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(7),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showCollectPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white, // Set the background color to white
//           content: Text(
//             "When you collect the coupon, you'll have 2 hours to use it.",
//             textAlign: TextAlign.center, // Center align the text itself
//             style: TextStyle(
//               fontWeight: FontWeight.bold, // Make the text bold
//               fontSize: 18, // Increase font size (adjust as needed)
//             ),
//           ),
//           actions: <Widget>[
//             Center(
//               // Center the Column horizontally
//               child: Column(
//                 mainAxisSize: MainAxisSize
//                     .min, // Ensure the column takes only as much space as needed
//                 children: [
//                   // Agree Button
//                   Container(
//                     decoration: BoxDecoration(
//                       color:
//                           Color(0xFFFBC079), // Sausage color (adjust as needed)
//                       borderRadius:
//                           BorderRadius.circular(30), // Rounded corners
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         // Handle agree action
//                         Navigator.of(context).pop(); // Close the dialog
//                         print('User agreed to the coupon terms');
//                       },
//                       child: Text(
//                         'Agree',
//                         style: TextStyle(
//                           fontWeight:
//                               FontWeight.bold, // Make the button text bold
//                           fontSize:
//                               18, // Increase button text size (adjust as needed)
//                           color: Colors.black, // Text color
//                         ),
//                       ),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10,
//                             horizontal: 40), // Add padding for height and width
//                         minimumSize:
//                             Size(200, 30), // Increased minimum button width
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10), // Add space between buttons
//                   // Back Button
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors
//                           .grey, // Make it the same color as the Agree button
//                       borderRadius:
//                           BorderRadius.circular(30), // Rounded corners
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         // Handle back action
//                         Navigator.of(context).pop(); // Close the dialog
//                       },
//                       child: Text(
//                         'Back',
//                         style: TextStyle(
//                           fontWeight:
//                               FontWeight.bold, // Make the button text bold
//                           fontSize:
//                               18, // Increase button text size (adjust as needed)
//                           color: Colors.white, // Text color
//                         ),
//                       ),
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10,
//                             horizontal: 40), // Add padding for height and width
//                         minimumSize:
//                             Size(200, 30), // Increased minimum button width
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/coupon_detail.dart';
import 'dart:convert';

class RecommendedPage extends StatefulWidget {
  @override
  _RecommendedPageState createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage> {
  late Future<List<Map<String, dynamic>>> coupons;

  @override
  void initState() {
    super.initState();
    coupons = fetchCoupons();
  }

  Future<List<Map<String, dynamic>>> fetchCoupons() async {
    final apiUrl = Uri.parse('https://flash.mupingdev.org/api/coupons');
    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data
            .map((coupon) => {
                  'imageUrl': coupon['couponImage'] ?? '',
                  'storeName': coupon['restaurantBranch'] ?? 'Unknown Branch',
                  'promotionInfo':
                      '${coupon['discountPercent'] ?? 0}% off on ${coupon['foodName']}',
                  'location': coupon['restaurantBranch'] ?? 'Not specified',
                  'startDate': coupon['startDate'] ?? '',
                  'endDate': coupon['endDate'] ?? '',
                  'couponsLeft': coupon['amount'].toString(),
                  'type': coupon['couponType'] ?? 'General',
                })
            .toList();
      } else {
        throw Exception('Failed to load coupons');
      }
    } catch (e) {
      print('Error fetching coupons: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Recommended for you',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0,
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: coupons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading coupons'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No coupons available'));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildVerticalPromotionList(snapshot.data!, context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVerticalPromotionList(
      List<Map<String, dynamic>> promotions, BuildContext context) {
    return Column(
      children: promotions.map((promotion) {
        return _buildVerticalPromotionCard(
          imageUrl: promotion['imageUrl'],
          storeName: promotion['storeName'],
          promotionDetail: promotion['promotionInfo'],
          location: promotion['location'],
          startDate: promotion['startDate'],
          endDate: promotion['endDate'],
          couponsLeft: promotion['couponsLeft'],
          type: promotion['type'],
          context: context,
        );
      }).toList(),
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
    required String type,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouponDetail(
              userId: '',
              couponId: '',
              imageUrl: imageUrl,
              restaurantName: storeName,
              discount: promotionDetail,
              location: location,
              startDate: startDate,
              endDate: endDate,
              amount: couponsLeft,
              type: type,
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
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
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
                                text: '  $type',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 25, color: Color(0xFFFBC079)),
                            SizedBox(width: 4),
                            Text(location,
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range,
                                size: 25, color: Color(0xFFFBC079)),
                            SizedBox(width: 4),
                            Text('$startDate - $endDate',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Text('$couponsLeft coupons left',
                            style: TextStyle(color: Color(0xFFD04040))),
                        ElevatedButton(
                          onPressed: () {
                            _showCollectPopup(context);
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
                          ),
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

  void _showCollectPopup(BuildContext context) {
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Agree',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFFBC079),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
