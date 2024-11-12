import 'package:flutter/material.dart';
import 'cancelledscreen.dart';
import 'completedscreen.dart';
import 'upcomingschedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;

  final List<Widget> _scheduleWidgets = [
    UpcomingSchedule(),
    CompletedAppointmentsScreen(),
    CancelledAppointmentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: false,
        title: const Text(
          'Schedule',
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('Upcoming', 0),
                _buildTabButton('Completed', 1),
                _buildTabButton('Cancelled', 2),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(child: _scheduleWidgets[_buttonIndex]),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _buttonIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: _buttonIndex == index ? Colors.cyan : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
