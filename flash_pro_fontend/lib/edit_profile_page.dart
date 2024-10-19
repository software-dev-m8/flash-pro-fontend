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

class Branch {
  String name;
  String address;
  String tel;

  Branch({required this.name, required this.address, required this.tel});
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<Branch> _branches = [
    Branch(name: 'Future Park Rangsit', address: 'Address 1', tel: '123456789'),
    Branch(name: 'Central Westgate', address: 'Address 2', tel: '987654321'),
    Branch(
        name: 'โรงอาหารพระเทพ KMITL', address: 'Address 3', tel: '555555555'),
    Branch(name: 'หอสมุด KMITL', address: 'Address 4', tel: '444444444')
  ];

  Branch? _selectedBranch;
  bool _isDropdownOpen = false;
  bool _isChangePasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
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
                  Text("Restaurant's name",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: 'KAMU KAMU',
                    style: Theme.of(context).textTheme.bodyLarge!,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 100.0,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("kamu@gmail.com",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: 'kamu@gmail.com',
                    style: Theme.of(context).textTheme.bodyLarge!,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 100.0,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Tel.",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  TextFormField(
                    initialValue: '0987654321',
                    style: Theme.of(context).textTheme.bodyLarge!,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 100.0,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Address",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  TextFormField(
                    maxLines: null,
                    minLines: 5,
                    initialValue: '123 ลาดกระบัง กรุงเทพฯ 10000',
                    style: Theme.of(context).textTheme.bodyLarge!,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const MultiSelectDropdownExample(),
                  const SizedBox(height: 10),
                  Text("Branch",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDropdownOpen = !_isDropdownOpen;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedBranch?.name ?? 'Select Branch',
                                  style: Theme.of(context).textTheme.bodyLarge!,
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xFFFBC079),
                          shape: BoxShape.rectangle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.black),
                          onPressed: () {
                            _showAddBranchDialog(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  if (_isDropdownOpen)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _branches.length,
                        itemBuilder: (context, index) {
                          final branch = _branches[index];
                          return ListTile(
                            title: Text(branch.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteBranchDialog(context, index);
                              },
                            ),
                            onTap: () {
                              setState(() {
                                _selectedBranch = branch;
                                _isDropdownOpen = false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 20),
                  // Change Password Section
                  if (_isChangePasswordVisible) ...[
                    Center(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end, // Align button to the right
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFBC079),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              setState(() {
                                _isChangePasswordVisible = false;
                              });
                            },
                            child: Text(
                              'Change password',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 15.0),
                              side: const BorderSide(
                                  color: Color(0xFFFBC079), width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            obscureText: true,
                            style: Theme.of(context).textTheme.bodyLarge!,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                gapPadding: 100.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 10.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "New password",
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 10.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Confirm password",
                            style: Theme.of(context).textTheme.headlineSmall!,
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 10.0),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 15.0),
                                side: const BorderSide(
                                    color: Color(0xFFFBC079), width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isChangePasswordVisible = true;
                                });
                              },
                              child: const Text('Save password'),
                            ),
                          ),
                        ],
                      ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteBranchDialog(BuildContext context, int index) {
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
                        _branches.removeAt(index);
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

  void _showAddBranchDialog(BuildContext context) {
    final branchNameController = TextEditingController();
    final addressController = TextEditingController();
    final telController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          titlePadding: const EdgeInsets.only(top: 20.0),
          title: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Add new branch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -10,
                top: -15,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Branch name"),
              const SizedBox(height: 6),
              TextFormField(
                controller: branchNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Address"),
              const SizedBox(height: 6),
              TextFormField(
                controller: addressController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Tel."),
              const SizedBox(height: 6),
              TextFormField(
                controller: telController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Save'),
                onPressed: () {
                  setState(() {
                    if (branchNameController.text.isNotEmpty) {
                      _branches.add(Branch(
                          name: branchNameController.text,
                          address: addressController.text,
                          tel: telController.text));
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
