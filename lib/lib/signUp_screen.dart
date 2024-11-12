import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../login.dart';
import 'navbar.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for form fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();
  final _databaseHelper = DatabaseHelper();

  // Password visibility toggles
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'SignUp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 250),
              child: const Text(
                'Create your account first to get started!',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('images/gif1.gif', width: 200, height: 200),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 280, right: 35, left: 35),
              child: Column(
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.abc_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.abc_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: phoneNoController,
                    decoration: InputDecoration(
                      hintText: 'Phone no',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.phone_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.email_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Password field with toggle visibility
                  TextField(
                    controller: passwordController,
                    obscureText: _isPasswordObscured,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Confirm password field with toggle visibility
                  TextField(
                    controller: confirmedPasswordController,
                    obscureText: _isConfirmPasswordObscured,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Sign-up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          if (passwordController.text == confirmedPasswordController.text) {
                            try {
                              // Register the user in the database
                              await _databaseHelper.registerUser(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                phoneNoController.text,
                                passwordController.text,
                                confirmedPasswordController.text,
                                int.tryParse(ageController.text) ?? 0,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('User signed up successfully')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => NavBar()),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error signing up')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Passwords do not match')),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          padding: const EdgeInsets.symmetric(horizontal: 95),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ],
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
