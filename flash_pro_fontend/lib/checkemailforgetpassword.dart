import 'package:flutter/material.dart';
import 'package:flash_pro_fontend/login.dart';

class CheckMailboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckMailboxScreen(),
    );
  }
}

class CheckMailboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            // Envelope icon or image
            Center(
              child: Image.asset(
                'access/verifymail2.png',
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 20),
            // Title
            Center(
              child: Text(
                'Check your mailbox',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Subtitle
            Center(
              child: Text(
                'We sent you a link to reset password.\nIf you can\'t find the email,\nPlease check your SPAM or junk mail folder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 40),
            // Send Email Again Button
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for resending the email
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password reset email sent again.'),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Colors.teal, width: 2), // Border color
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Send Email Again',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            // Back to Log in link
            Center(
              child: TextButton(
                onPressed: () {
                  runApp(Login());
                },
                child: Text(
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
