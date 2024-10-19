import 'package:flutter/material.dart';
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
  final List<String> _foodItems = ['Beverage, ชานมไข่มุก', 'Dessert', 'Snack'];
  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kind of food",
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
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

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // List to store branch options dynamically
  final List<String> _branches = [
    'โรงอาหารพระเทพ KMITL',
    'Other Branch',
    'Robinson',
    'Central Westgate',
    'Siam'
  ];

  // Initially selected branch
  String _selectedBranch = 'โรงอาหารพระเทพ KMITL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        titleSpacing: 0,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/image_logo/kamu_logo.png'),
                          radius: 50,
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
                    const SizedBox(height: 10),
                    const Text(
                      'KAMU KAMU',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... Your other form fields ...

                  const SizedBox(height: 10),
                  Text("Branch",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedBranch,
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                          items: _branches
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBranch = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: Color(0xFFFBC079),
                          shape: BoxShape.rectangle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add,
                              color: Colors.black, size: 30),
                          onPressed: () {
                            _showAddBranchDialog(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddBranchDialog(BuildContext context) {
    final branchNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Stack(
            children: [
              const Align(
                alignment: Alignment.center, // Center the title text
                child: Text('Add new branch'),
              ),
              Positioned(
                right: -10,
                top: -15,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Branch", style: Theme.of(context).textTheme.headlineSmall!),
              const SizedBox(height: 6),
              TextFormField(
                controller: branchNameController,
                style: Theme.of(context).textTheme.bodyLarge!,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFBC079),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Save'),
                onPressed: () {
                  // Add the new branch to the list of branches
                  setState(() {
                    if (branchNameController.text.isNotEmpty) {
                      _branches.add(branchNameController.text);
                    }
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
