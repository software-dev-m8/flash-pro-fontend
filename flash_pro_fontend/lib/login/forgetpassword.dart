import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/login/login.dart';
import 'package:flash_pro_fontend/login/checkemailforgetpassword.dart';

class ForgotPasswordApp extends StatefulWidget {
  const ForgotPasswordApp({super.key});

  @override
  _ForgotPasswordAppState createState() => _ForgotPasswordAppState();
}

class _ForgotPasswordAppState extends State<ForgotPasswordApp> {
  // TextEditingController for managing email input
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the tree
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Lock Icon
            Center(
              child: Image.asset(
                'access/lock1.png',
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            // Title
            const Center(
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            const Center(
              child: Text(
                "Don't worry! Enter your email and we'll send you a password reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Email Input
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: const Color(0xE1ECECEC),
                labelStyle: const TextStyle(
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Send Button
            Center(
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    // Handle the email sending logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password reset link sent to $email'),
                      ),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckMailbox()));
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Colors.teal, width: 2), // Border color
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
