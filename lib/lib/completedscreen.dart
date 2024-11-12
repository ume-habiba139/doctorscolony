import 'package:flutter/material.dart';

class CompletedAppointmentsScreen extends StatelessWidget {
  final List<Map<String, String>> completedAppointments = [
    {
      "date": "2024-09-15",
      "doctor": "Dr. Jahanzaib",
      "status": "Completed",
      "notes": "Follow-up in 2 weeks."
    },
    {
      "date": "2024-09-10",
      "doctor": "Dr. Sarah Khan",
      "status": "Completed",
      "notes": "No issues reported."
    },
    {
      "date": "2024-09-05",
      "doctor": "Dr. Emily Smith",
      "status": "Completed",
      "notes": "Regular check-up."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: completedAppointments.length,
        itemBuilder: (context, index) {
          final appointment = completedAppointments[index];
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
                    'Status: ${appointment['status']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Notes: ${appointment['notes']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
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
