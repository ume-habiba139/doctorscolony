import 'package:flutter/material.dart';

class CancelledAppointmentsScreen extends StatelessWidget {
  final List<Map<String, String>> cancelledAppointments = [
    {
      "date": "2024-09-20",
      "doctor": "Dr. John Doe",
      "reason": "Patient rescheduled.",
    },
    {
      "date": "2024-09-18",
      "doctor": "Dr. Alice Brown",
      "reason": "Doctor unavailable.",
    },
    {
      "date": "2024-09-15",
      "doctor": "Dr. Emily Clark",
      "reason": "Emergency appointment.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: cancelledAppointments.length,
        itemBuilder: (context, index) {
          final appointment = cancelledAppointments[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment['doctor']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: ${appointment['date']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Reason: ${appointment['reason']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
