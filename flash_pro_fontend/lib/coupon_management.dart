import 'package:flutter/material.dart';
import 'edit_coupon.dart';

class CouponManagementPage extends StatelessWidget {
  const CouponManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        titleSpacing: 0,
        title: Text(
          'Coupon Management',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
            width: double.infinity,
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
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CouponCard();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  const CouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(
          0xFFFFF7E7), // Light background color as in the first image
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: const Color(0xFFFBC079),
                      width: 3.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        16.0), // Match the container's border radius
                    child: Image.asset(
                      'assets/image_logo/kamu_logo.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit
                          .contain, // Ensure the image is contained within the border
                    ),
                  ),
                ),

                const SizedBox(width: 16.0),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KAMU KAMU',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Discount 20 Baht',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Place the icons in a Column to align them vertically with the text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.edit, color: Colors.black, size: 20),
                      onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCouponScreen(),
      ),
    );
  },
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.delete, color: Colors.red, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16.0,
                  color: Colors.orange,
                ),
                SizedBox(width: 4.0),
                Text('โรบินสัน ลาดกระบัง'),
              ],
            ),
            const SizedBox(height: 4.0),
            const Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16.0,
                  color: Colors.orange,
                ),
                SizedBox(width: 4.0),
                Text('1 Aug 2024 - 15 Aug 2024'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



