import 'package:flutter/material.dart';
import 'package:flutter_application_1/choose_favorite_account.dart';
import 'package:flutter_application_1/history_page.dart';
import 'package:flutter_application_1/editprofile_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFFBC079), width: 6),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 150,
              title: Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFFBC079),
                          width: 4,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage('https://example.com/account_image.jpg'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Account Name',
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditprofilePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Container(
                height: 60,
                child: ListTile(
                  title: Text('Favorite kind of food', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseFavoriteAccount()),
                    );
                  },
                ),
              ),
              // Divider(color: Colors.grey),
              // Container(
              //   height: 60,
              //   child: ListTile(
              //     title: Text('My Coupons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //     trailing: Icon(Icons.chevron_right),
              //     onTap: () {
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(builder: (context) => HistoryPage()),
              //       // );
              //     },
              //   ),
              // ),
              Divider(color: Colors.grey),
              Container(
                height: 60,
                child: ListTile(
                  title: Text('History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage()),
                    );
                  },
                ),
              ),
              Divider(color: Colors.grey),
              Container(
                height: 60,
                child: ListTile(
                  title: Text('Log Out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.logout, color: Color(0xFFD04040)),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ),
              Divider(color: Colors.grey),
            ],
          ),
        ),
      );

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(child: Text('Log Out?', style: TextStyle(fontWeight: FontWeight.bold))),
          content: SizedBox(
            height: 20, // Adjust height here
            child: Center(child: Text('You can come back anytime', style: TextStyle(fontSize: 18))),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD04040)),
                      child: Text('Log Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      onPressed: () {
                        print('Log Out confirmed');
                        Navigator.of(context).pop();
                        // Add your logout logic here
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Space between buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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
