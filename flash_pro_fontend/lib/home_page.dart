import 'package:flutter/material.dart';
import 'page/account_page.dart';
import 'page/mycoupons_page.dart';
import 'page/realhome_page.dart';

class HomePage extends StatefulWidget {
  final String token;
  final String id;

  HomePage({required this.token, required this.id});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  int _selectedIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      RealHomePage(token: widget.token, id: widget.id),
      MyCouponsPage(),
      AccountPage(
          token: widget.token, id: widget.id), // ส่ง token และ id ที่นี่
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAdDialog();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAdDialog() {
    final screenWidth = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 550,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Image.network(
                    'https://via.placeholder.com/550x300', // เปลี่ยน URL รูปภาพตามต้องการ
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex != 1 // แสดง AppBar เฉพาะในหน้า MyCoupons
          ? null
          : AppBar(
              backgroundColor: Color(0xFFFBC079),
              toolbarHeight: 90,
              title: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _onItemTapped(0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search,
                                  color: Color(0xFFFBC079), size: 30),
                              SizedBox(width: 0),
                              Text(
                                'Search',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.home, size: 30),
                  ),
                  Text('Home', style: TextStyle(fontSize: 16)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.receipt, size: 30),
                  ),
                  Text('My Coupons', style: TextStyle(fontSize: 16)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.account_circle, size: 30),
                  ),
                  Text('Account', style: TextStyle(fontSize: 16)),
                ],
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFFBC079),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
