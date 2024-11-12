import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
        backgroundColor: Colors.cyan,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            backgroundColor: Colors.cyan,
          ),
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your logout logic here
                Navigator.of(context).pop(); // Dismiss the dialog
                // Optionally navigate to the login screen or home screen
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LogoutScreen(),
    routes: {
      '/login': (context) => const LoginScreen(), // Define your LoginScreen here
    },
  ));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(child: const Text('Login Screen')),
    );
  }
}
