import 'package:flutter/material.dart';
import 'package:mysecondprogram/lib/faq.dart';
import 'package:mysecondprogram/lib/notificationscreen.dart';
import 'package:mysecondprogram/lib/profilescreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0), // Apply left padding
                    child: Text('Profile',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0), // Apply left padding
                    child: Text('Notifications',style: TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NotificationScreen()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0), // Apply left padding
                    child: Text("FAQ's",style: TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MedicalFAQScreen()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
