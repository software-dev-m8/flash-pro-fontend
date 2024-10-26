import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/login/login.dart';

class PasswordVerify extends StatelessWidget {
  const PasswordVerify({super.key});

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
            // Envelope icon or image
            Center(
              child: Image.asset(
                'assets/verifymail2.png',
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 20),
            // Title
            const Center(
              child: Text(
                'Check your mailbox',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            Center(
              child: RichText(
                textAlign: TextAlign.center, // Align the text in the center
                text: const TextSpan(
                  text:
                      "We sent you a link to verify your email.\nIf you can’t find the email,\nPlease check your ",
                  style: TextStyle(color: Colors.black), // Default style
                  children: [
                    TextSpan(
                      text: 'SPAM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold), // Make SPAM bold
                    ),
                    TextSpan(
                      text: ' or',
                      style: TextStyle(color: Colors.black), // Default;
                    ),
                    TextSpan(
                      text: '  junk mail folder.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset email sent again.'),
                      ),
                    );
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
                    'Send Email Again',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Back to Log in link
            Center(
              child: TextButton(
                onPressed: () {
                  runApp(const Login());
                },
                child: const Text(
                  'Back to Log in',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
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
