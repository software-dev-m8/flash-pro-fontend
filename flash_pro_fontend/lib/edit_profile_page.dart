import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
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
              padding:
                  const EdgeInsets.all(16.0), // Padding just for image and info
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
            // const SizedBox(height: 20),
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
                    maxLines:null, // Set the max number of lines to make it larger
                    minLines: 5, // Ensures the field is at least 3 lines tall
                    initialValue: '123 ลาดกระบัง กรุงเทพฯ 10000',
                    style: Theme.of(context).textTheme.bodyLarge!,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Kind of food",
                      style: Theme.of(context).textTheme.headlineSmall!),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: 'Beverage, ชานมไข่มุก',
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.headlineSmall!,
                      border: const OutlineInputBorder(),
                    ),
                    items: <String>['Beverage, ชานมไข่มุก', 'Dessert', 'Snack']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: 'โรงอาหารพระเทพ KMITL',
                    decoration: InputDecoration(
                      labelText: "Branch",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                    ),
                    items: <String>['โรงอาหารพระเทพ KMITL', 'Other Branch']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text('Change password'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                      ),
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
