import 'package:flutter/material.dart';
import 'package:flutter_application_1/recommended_page.dart';
import 'package:flutter_application_1/popular_coupons.dart';
import 'package:flutter_application_1/menucoupon_detail.dart';

class RealHomePage extends StatefulWidget {
  @override
  _RealHomePageState createState() => _RealHomePageState();
}

class _RealHomePageState extends State<RealHomePage> {
  String searchQuery = '';
  String? _selectedSize;
  bool _isSearching = false; // Track if search is active

final List<Map<String, String>> menuItems = [
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'menuName': 'Menu Item 1',
    'originalPrice': '\$20',
    'restaurantName': "Restaurant 1",
    'discount': "30",
    'location': "abc",
    'startDate': "2024-10-01", // Example date format (YYYY-MM-DD)
    'endDate': "2024-10-10", // Example date format (YYYY-MM-DD)
    'amount': "200",
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'menuName': 'Menu Item 2',
    'originalPrice': '\$30',
    'restaurantName': "Restaurant 2",
    'discount': "30",
    'location': "abc",
    'startDate': "2024-10-02",
    'endDate': "2024-10-11",
    'amount': "200",
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'menuName': 'Menu Item 3',
    'originalPrice': '\$40',
    'restaurantName': "Restaurant 3",
    'discount': "30",
    'location': "abc",
    'startDate': "2024-10-03",
    'endDate': "2024-10-12",
    'amount': "200",
  },
  // Add more menu items as needed
];





  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white, 
        appBar: AppBar(
          backgroundColor: Color(0xFFFBC079),
          toolbarHeight: 90,
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: _onSearchChanged,
                      onSubmitted: (value) {
                        setState(() {
                          // Clear the body on Enter press
                          _isSearching = true;
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 0.0),
                          child: Icon(Icons.search,
                              color: Color(0xFFFBC079), size: 30),
                        ),
                        suffixIcon: Theme(
                          data: Theme.of(context).copyWith(
                            popupMenuTheme: PopupMenuThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          child: PopupMenuButton<String>(
                            icon: Icon(Icons.more_vert,
                                color: Color(0xFFFBC079)),
                            offset: Offset(-20, 40),
                            color: Colors.white,
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Food Size',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      RadioListTile<String>(
                                        title: Text('1 - 2 คน'),
                                        value: '1-2',
                                        groupValue: _selectedSize,
                                        activeColor: Color(0xFFFBC079),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSize = value;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      RadioListTile<String>(
                                        title: Text('3 - 5 คน'),
                                        value: '3-5',
                                        groupValue: _selectedSize,
                                        activeColor: Color(0xFFFBC079),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSize = value;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      RadioListTile<String>(
                                        title: Text('6 คนขึ้นไป'),
                                        value: '6+',
                                        groupValue: _selectedSize,
                                        activeColor: Color(0xFFFBC079),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSize = value;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10),
                      ),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // Show placeholder or clear body when searching
              if (_isSearching) // Show vertical promotion list if searching
                _buildRestaurantCard(
                  imageUrl: 'https://via.placeholder.com/80',
                  restaurantName: 'Restaurant ABC',
                  description: 'A great place for delicious food!',
                ),
              if (_isSearching) // Show vertical promotion list if searching
                _buildVerticalPromotionList([
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store X',
    'promotionInfo': 'Special offer!',
    'location': '123 Main St',
    'startDate': '12/01/2024',  // New startDate field
    'endDate': '12/31/2024',    // New endDate field
    'couponsLeft': '5',
    'type': 'Discount',         // Add the type field here
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store Y',
    'promotionInfo': 'Limited time deal!',
    'location': '456 Elm St',
    'startDate': '11/01/2024',  // New startDate field
    'endDate': '11/30/2024',    // New endDate field
    'couponsLeft': '10',
    'type': 'Exclusive',        // Add the type field here
  },
]),

              if (_isSearching)   
                _buildMenuList(menuItems),

              if (!_isSearching)
              SizedBox(height: 10),

              if (!_isSearching)
                Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: Center(
                    child: Image.network(
                      'https://via.placeholder.com/390x100',
                    ),
                  ),
                ),

              if (!_isSearching)
              SizedBox(height: 10),
              
              if (!_isSearching)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recommended for you', style: TextStyle(fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        print('Arrow forward icon tapped!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecommendedPage(), // Navigate to the new page
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFEF6EB),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              if (!_isSearching)
              SizedBox(height: 10),

              if (!_isSearching)
                _buildPromotionList([
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store 1', 'promotionInfo': '20% off on all items!'},
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store 2', 'promotionInfo': 'Buy one get one free!'},
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store 3', 'promotionInfo': 'Free shipping on orders over \$50!'},
                ]),

              if (!_isSearching)
              SizedBox(height: 10),

              if (!_isSearching)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Coupons', style: TextStyle(fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        print('Arrow forward icon tapped!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PopularCouponsPage(), // Navigate to the new page
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFEF6EB),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              
              if (!_isSearching)
              SizedBox(height: 10),
              
              if (!_isSearching)
                _buildPromotionList([
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store A', 'promotionInfo': '15% off on your first purchase!'},
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store B', 'promotionInfo': 'Get a free gift with purchase!'},
                  {'imageUrl': 'https://via.placeholder.com/150', 'storeName': 'Store C', 'promotionInfo': '30% off on select items!'},
                ]),
              SizedBox(height: 20),
              if (!_isSearching)
                _buildVerticalPromotionList([
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store X',
    'promotionInfo': 'Special offer!',
    'location': '123 Main St',
    'startDate': '12/01/2024',  // New startDate field
    'endDate': '12/31/2024',    // New endDate field
    'couponsLeft': '5',
    'type': 'Discount',         // Add type here
  },
  {
    'imageUrl': 'https://via.placeholder.com/80',
    'storeName': 'Store Y',
    'promotionInfo': 'Limited time deal!',
    'location': '456 Elm St',
    'startDate': '11/01/2024',  // New startDate field
    'endDate': '11/30/2024',    // New endDate field
    'couponsLeft': '10',
    'type': 'Exclusive',        // Add type here
  },
])

            ],
          ),
        ),
      );

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  Widget _buildPromotionList(List<Map<String, String>> promotions) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: promotions.map((promotion) {
          return _buildPromotionCard(
            imageUrl: promotion['imageUrl']!,
            storeName: promotion['storeName']!,
            promotionInfo: promotion['promotionInfo']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPromotionCard({
  required String imageUrl,
  required String storeName,
  required String promotionInfo,
}) {
  return GestureDetector(
    onTap: () {
      // Add your action here, e.g., navigate to a detail page
      print('Tapped on $storeName promotion');
    },
    child: Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFEF6EB),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  imageUrl,
                  height: 90,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 90,
                      color: Colors.grey, // Placeholder color
                      child: Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: Text(
                storeName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
              child: Text(
                promotionInfo,
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
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



Widget _buildRestaurantCard({
  required String imageUrl,
  required String restaurantName,
  required String description,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    child: Column(
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Color(0xFFFBC079), width: 4),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  print('View Restaurant tapped!');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View Restaurant',
                      style: TextStyle(color: Colors.grey), // Set text color to black
                    ),
                    SizedBox(width: 0),
                    Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.grey, // Set icon color to black
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(color: Colors.grey, thickness: 1),
      ],
    ),
  );
}


Widget _buildMenuCard({
  required String imageUrl,
  required String menuName,
  required String originalPrice,
  required String discount,
  required String restaurantName,
  required String location,
  required String startDate,
  required String endDate,
  required String amount,
}) {
  const String saveText = "Save"; // Label for discount

  // Calculate new price from original price and discount
  double originalPriceValue = double.parse(originalPrice.replaceAll(RegExp(r'[^0-9.]'), '')); // Remove currency symbols
  double discountValue = double.parse(discount.replaceAll(RegExp(r'[^0-9.]'), '')); // Remove currency symbols
  double newPriceValue = originalPriceValue - discountValue; // Calculate new price
  String newPrice = newPriceValue.toStringAsFixed(2); // Format to two decimal places

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuCouponDetail(
            menuName: menuName,
            imageUrl: imageUrl,
            restaurantName: restaurantName,
            discount: discount,
            location: location,
            startDate: startDate,
            endDate: endDate,
            originalPrice: originalPrice,
            amount: amount,
          ),
        ),
      );
    },
    child: Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40, // Adjust as needed
            right: 0, // Adjust as needed
            child: Container(
              width: 120, // Width of the blue box
              height: 120, // Height of the blue box
              decoration: BoxDecoration(
                color: Color(0xFFFEF6EB),
                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
              ),
              child: Center(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0), // Only left padding
                child: Text(
                  menuName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          originalPrice,
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(newPrice, style: TextStyle(color: Color(0xFFD04040), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(saveText, style: TextStyle(color: Colors.grey, fontSize: 10)), // Changed to "Discount"
                        SizedBox(width: 3),
                        Text(discount, style: TextStyle(color: Color(0xFFD04040), fontSize: 10)), // Changed to discount
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0, // Position it lower
            right: 5,  // Position it to the right
            child: ElevatedButton(
              onPressed: () {
                print('Collect $menuName');
              },
              child: Text(
                'Collect',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFBC079),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                minimumSize: Size(50, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



Widget _buildMenuList(List<Map<String, String>> menuItems) {
  return Container(
    height: 165, // Adjust height as needed
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return _buildMenuCard(
          imageUrl: menuItems[index]['imageUrl']!,
          menuName: menuItems[index]['menuName']!,
          originalPrice: menuItems[index]['originalPrice']!,
          discount: menuItems[index]['discount']!,
          restaurantName: menuItems[index]['restaurantName']!,
          location: menuItems[index]['location']!,
          startDate: menuItems[index]['startDate']!,
          endDate: menuItems[index]['endDate']!,
          amount: menuItems[index]['amount']!,
        );
      },
    ),
  );
}







}
