import 'package:flutter/material.dart';
import 'package:mysecondprogram/admin/homescreen.dart';

import 'database/database_helper.dart';

import 'lib/navbar.dart';
import 'lib/signUp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginState();
}

class _loginState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedRole = 'User';
  final _databaseHelper = DatabaseHelper();

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      var user = await _databaseHelper.loginUser(email, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        if (selectedRole == "Admin") {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
           );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
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
                margin: const EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Image.asset('images/gif2.gif', width: 200, height: 200),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        fillColor: Colors.cyan,
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.cyan,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                        width: 320,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            hintText: "Select Role",
                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedRole,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: [
                                DropdownMenuItem(child: Text("User"), value: "User"),
                                DropdownMenuItem(child: Text("Admin"), value: "Admin"),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedRole = newValue!;
                                });
                              },
                            ),
                          ),
                        )),

                     SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 0, right: 0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.cyan, // Background color
                              padding: const EdgeInsets.only(left: 100, right: 100), // Padding
                              textStyle: const TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                              ), // Text style
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ), // Shape
                            ),
                            onPressed: () {
                              _login(); // Call the _login function here
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ],
                    )
                        ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
