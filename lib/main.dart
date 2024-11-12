import 'package:flutter/material.dart';
import 'package:mysecondprogram/database/database_helper.dart';
import 'package:mysecondprogram/welcome_screen.dart';

void main() async {
  runApp(const DoctorsColony());
}

void initializeDatabase() async {
  DatabaseHelper databaseHelper = DatabaseHelper();
  await databaseHelper.database;
}

class DoctorsColony extends StatelessWidget {
  const DoctorsColony({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDatabase();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
