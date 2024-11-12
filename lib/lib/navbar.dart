import 'package:flutter/material.dart';
import 'package:mysecondprogram/lib/homescreen.dart';
import 'package:mysecondprogram/lib/messages_screen.dart';
import 'package:mysecondprogram/lib/schedulescreen.dart';
import 'package:mysecondprogram/lib/settingscreen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBar createState() => _NavBar();
}
class _NavBar extends State<NavBar> {
  int _currentIndex = 0;
  final _screens = [
    //home screen
   HomeScreen(),
    //message screen
    MessagesScreen(),
    // schedule screen
    ScheduleScreen(),
    // setting screen
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ) ,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Home',  activeIcon: Icon(Icons.home,color: Colors.cyan,), ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages', activeIcon: Icon(Icons.message,color: Colors.cyan,),),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule', activeIcon: Icon(Icons.schedule,color: Colors.cyan,),),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings', activeIcon: Icon(Icons.settings,color: Colors.cyan,),),

        ],
      ),
    );
  }
}