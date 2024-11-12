import 'package:flutter/material.dart';
import 'package:mysecondprogram/lib/editprofile.dart';
import 'package:mysecondprogram/lib/logoutscreen.dart';

import 'changepassword.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),


          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Name Section
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/dr3.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.black),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_circle, color: Colors.cyan),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('John Doe', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.email, color: Colors.cyan),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('johndoe@example.com', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.cyan),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('0333333333', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.cake, color:Colors.cyan),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('January 1, 1990', style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 20),


              Text(
                'Account Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color:  Colors.black),
              ),
              SizedBox(height: 10),

              InkWell(
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Editprofile()));
                  // Navigate to edit profile screen
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings, color:Colors.cyan),
                      SizedBox(width: 10),
                      Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

             InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  ChangePasswordScreen()));
                  // Navigate to change password screen
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock, color:Colors.cyan),
                      SizedBox(width: 10),
                      Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

             InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  LogoutScreen()));
                  // Handle logout
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color:Colors.cyan,),
                      SizedBox(width: 10),
                      Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}