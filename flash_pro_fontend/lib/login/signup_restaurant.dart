import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flash_pro_fontend/login/login.dart';

class SignUpRestaurant extends StatefulWidget {
  const SignUpRestaurant({super.key});

  @override
  _SignUpRestaurantState createState() => _SignUpRestaurantState();
}

class _SignUpRestaurantState extends State<SignUpRestaurant> {
  // Add controllers to manage text input
  final TextEditingController restaurantNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is removed from the widget tree
    restaurantNameController.dispose();
    emailController.dispose();
    telController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Allow resizing when the keyboard is shown
      backgroundColor: const Color(0xFFFFE0B2), // Light orange background
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      // Orange top section with back arrow
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFE0B2),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                // Back to the previous screen
                                Navigator.pop(context);
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Expanded container for sign-up form
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),

                              // Sign Up Title
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Restaurant's Name Field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: restaurantNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Restaurant\'s name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Email Field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Tel Field (Phone Number)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: telController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Tel.',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Address Field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Address',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Password Field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Confirm Password Field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: TextField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    labelText: 'Confirm password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // Sign Up Button
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Sign up action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      side: const BorderSide(
                                          color: Colors.orange),
                                    ),
                                    child: const Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Already have an account? Log in
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Already have an account? ",
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Log in',
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()),
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
