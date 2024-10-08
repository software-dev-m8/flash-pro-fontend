import 'package:flutter/material.dart';

class EditprofilePage extends StatefulWidget {
  @override
  _EditprofilePageState createState() => _EditprofilePageState();
}

class _EditprofilePageState extends State<EditprofilePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool showPasswordFields = false; // Track whether to show password fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Wrap content in SingleChildScrollView
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    toolbarHeight: 80,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    iconTheme: IconThemeData(color: Colors.black),
                  ),
                  Container(
                    height: 6,
                    color: Color(0xFFFBC079),
                  ),
                ],
              ),
            ),
            Container(
              height: 4,
              color: Colors.black.withOpacity(0.1),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Implement change profile picture functionality
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Placeholder for profile image
                child: Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0), // Increased horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Full name', 'Enter your full name', fullNameController),
                  SizedBox(height: 10),
                  _buildTextField('Email', 'Enter your email', emailController),
                  SizedBox(height: 10),
                  _buildTextField('Tel.', 'Enter your telephone number', phoneController),
                  if (!showPasswordFields) // Show button if password fields are not visible
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0), // Add top padding
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showPasswordFields = true; // Show password fields
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFBC079),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            minimumSize: Size(150, 50),
                          ),
                          child: Text(
                            'Change password',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (showPasswordFields) ...[
                    SizedBox(height: 10),
                    _buildTextField('password', '', currentPasswordController),
                    SizedBox(height: 10),
                    _buildTextField('New password', '', newPasswordController),
                    SizedBox(height: 10),
                    _buildTextField('Confirm password', '', confirmPasswordController),
                  ],
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle save functionality here
                          // Example: Validate inputs and save changes
                          
                          // After saving, navigate back to the previous page
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFFFBC079), width: 3.0),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          minimumSize: Size(140, 50),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 6),
        Container(
          height: 50,
          child: TextField(
            controller: controller,
            obscureText: label.toLowerCase().contains('password'), // Obscure text for password fields
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
