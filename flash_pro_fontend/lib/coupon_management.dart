import 'package:flutter/material.dart';
import 'edit_coupon.dart';
import 'add_coupon.dart';

class CouponManagementPage extends StatefulWidget {
  const CouponManagementPage({super.key});

  @override
  _CouponManagementPageState createState() => _CouponManagementPageState();
}

class _CouponManagementPageState extends State<CouponManagementPage> {
  int _sortByValue = 1;
  bool _filterAll = false;
  int _filterBranchValue = 2;
  List<String> _coupons = ['Coupon 1', 'Coupon 2']; // Dummy list for coupons

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.tune,
              color: Color(0xFFFBC079),
              size: 30,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return _buildBottomSheetContent(setState);
                    },
                  );
                },
              );
            },
          ),
        ],
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
              itemCount: _coupons.length,
              itemBuilder: (context, index) {
                return CouponCard(
                  title: _coupons[index],
                  onDelete: () => _showDeleteCouponDialog(context, index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCouponScreen(),
                      ),
                    );
                  },
        backgroundColor: const Color(0xFFFBC079),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBottomSheetContent(StateSetter setState) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sort by',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _buildRadioOption('Recently added', 1, _sortByValue, (value) {
                  setState(() {
                    _sortByValue = value!;
                  });
                }),
                _buildRadioOption('Expired Date', 2, _sortByValue, (value) {
                  setState(() {
                    _sortByValue = value!;
                  });
                }),
                _buildRadioOption('Discount', 3, _sortByValue, (value) {
                  setState(() {
                    _sortByValue = value!;
                  });
                }),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Filter',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _buildCheckboxOption('All', _filterAll, (value) {
                  setState(() {
                    _filterAll = value!;
                  });
                }),
                const Divider(),
                _buildRadioOption('ใช้ได้เฉพาะสาขา', 1, _filterBranchValue,
                    (value) {
                  setState(() {
                    _filterBranchValue = value!;
                  });
                }),
                _buildRadioOption('ใช้ได้ทุกสาขา', 2, _filterBranchValue,
                    (value) {
                  setState(() {
                    _filterBranchValue = value!;
                  });
                }),
                const Divider(),
                _buildRadioOption('ใช้ได้เฉพาะเมนู', 3, _filterBranchValue,
                    (value) {
                  setState(() {
                    _filterBranchValue = value!;
                  });
                }),
                _buildRadioOption('ใช้ได้ทุกเมนู', 4, _filterBranchValue,
                    (value) {
                  setState(() {
                    _filterBranchValue = value!;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(
      String title, int value, int groupValue, ValueChanged<int?> onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Radio<int>(
        value: value,
        groupValue: groupValue,
        activeColor: Colors.orange,
        onChanged: onChanged,
      ),
      title: Text(title),
    );
  }

  Widget _buildCheckboxOption(
      String title, bool isChecked, ValueChanged<bool?> onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Checkbox(
        value: isChecked,
        activeColor: Colors.orange,
        onChanged: onChanged,
      ),
      title: Text(title),
    );
  }

  void _showDeleteCouponDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: const Text(
              'Are you sure to Delete?',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "You can't restore it",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
              left: 24.0,
              right: 24.0,
              bottom: 10.0,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _coupons.removeAt(index);
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 215, 81, 71),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 75.0,
                      ),
                    ),
                    child: const Text('Delete', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 75.0,
                      ),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CouponCard extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;

  const CouponCard({super.key, required this.title, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFF7E7), // Light background color as in the first image
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
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/image_logo/kamu_logo.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Discount 20 Baht',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditCouponScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: onDelete,
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
