import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectDropdownExample extends StatefulWidget {
  const MultiSelectDropdownExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MultiSelectDropdownExampleState createState() =>
      _MultiSelectDropdownExampleState();
}

class _MultiSelectDropdownExampleState
    extends State<MultiSelectDropdownExample> {
  final List<String> _foodItems = [
    'โรงอาหารพระเทพ KMITL',
    'Central',
    'Terminal 21',
  ];
  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: MultiSelectDialogField(
            items:
                _foodItems.map((item) => MultiSelectItem(item, item)).toList(),
            title: const Text("Select Food"),
            selectedColor: const Color(0xFFFBC079),
            buttonIcon: const Icon(
              Icons.arrow_drop_down,
            ),
            buttonText: Text(
              "Beverage, ชานมไข่มุก",
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            onConfirm: (results) {
              setState(() {
                _selectedItems = results.cast<String>();
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              items: _selectedItems
                  .map((item) => MultiSelectItem(item, item))
                  .toList(),
              onTap: (value) {
                setState(() {
                  _selectedItems.remove(value);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AddCouponScreen extends StatefulWidget {
  const AddCouponScreen({super.key});

  @override
  State<AddCouponScreen> createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends State<AddCouponScreen> {
  int _selectedCouponType = 0;
  int _selectedDiscountType = 0;
  bool _isBranchSelected = false; // For tracking the checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        titleSpacing: 0,
        title: Text(
          'Add Coupon',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container with Camera Icon
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
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
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Coupon Type
              Text(
                'Coupon type',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                title: const Text('ใช้ได้กับรายการอาหาร'),
                leading: Radio(
                  value: 1,
                  groupValue: _selectedCouponType,
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      _selectedCouponType = value!;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      title: const Text('ใช้ได้เฉพาะรายการ'),
                      leading: Radio(
                        value: 2,
                        groupValue: _selectedCouponType,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            _selectedCouponType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Discount Section
              Text(
                'Discount',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          const Text('Percent'),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 40,
                            height: 35,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8.0),
                                isDense: true,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: _selectedDiscountType,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            _selectedDiscountType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          const Text('Baht'),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 40,
                            height: 35,
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8.0),
                                isDense: true,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ],
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: _selectedDiscountType,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            _selectedDiscountType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              // Amount (Optional)
              Text(
                'Amount (Optional)',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: '1000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),

              // Start and End Date
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Date',
                          style: Theme.of(context).textTheme.headlineSmall!,
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.calendar_today, size: 20),
                            hintText: '01 AUG 2024',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Date',
                          style: Theme.of(context).textTheme.headlineSmall!,
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.calendar_today, size: 20),
                            hintText: '15 AUG 2024',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Checkbox for branch selection
              Row(
                children: [
                  Checkbox(
                    value: _isBranchSelected,
                    activeColor: const Color(
                        0xFFFBC079), // Fill with orange when selected
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isBranchSelected = newValue!;
                      });
                    },
                  ),
                  const Text('ใช้ได้เฉพาะสาขา'),
                ],
              ),

              // Show this part when the checkbox is checked
              if (_isBranchSelected) ...[
                Text(
                  'Select branch',
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
                const SizedBox(height: 8),
                const MultiSelectDropdownExample(),
                const SizedBox(height: 16),
              ],

              // Detail (Optional)
              Text(
                'Detail (Optional)',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'เมื่อซื้อขั้นต่ำ 100 บาท',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(height: 24),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFBC079), // Button color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
