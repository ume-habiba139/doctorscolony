import 'package:flutter/material.dart';
import 'package:mysecondprogram/login.dart';
import 'lib/navbar.dart';
import 'lib/signUp_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: const Text(
            'Doctors Colony',
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
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavBar()));
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView( // Added SingleChildScrollView here
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('images/img.png'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Doctors Appointment',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Appoint Your Doctor'),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: const Text('Login',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    child: const Text('SignUp',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
