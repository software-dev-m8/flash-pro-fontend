import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'edit_profile_page.dart';
import 'coupon_management.dart';

class RestaurantManagementPage extends StatelessWidget {
  const RestaurantManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            'KAMU KAMU',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFBC079),
                    width: 2.0,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/image_logo/kamu_logo.png'),
                  radius: 24,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFFBC079),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Coupon Management',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CouponManagementPage()),
                  );
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                'Log Out',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              ),
              trailing: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
