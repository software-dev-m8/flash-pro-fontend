import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/login.dart';

class MailVerify extends StatelessWidget {
  const MailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            // Envelope icon or image
            Center(
              child: Image.asset(
                'access/verifymail.png',
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            // Title
            const Center(
              child: Text(
                'Verify your email!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Subtitle
            Center(
              child: RichText(
                textAlign: TextAlign.center, // Align the text in the center
                text: const TextSpan(
                    text:
                        "To complete your profile and start using\nFlash Pro. You’ll need to verify your email.",
                    style: TextStyle(color: Colors.black) // Default style
                    ),
              ),
            ),
            const SizedBox(height: 40),
            // Send Email Again Button
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for resending the email
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
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
                    'Verify',
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
