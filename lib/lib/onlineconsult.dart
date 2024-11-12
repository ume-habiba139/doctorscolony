import 'package:flutter/material.dart';
import 'consultaionafter.dart';

class OnlineConsultationScreen extends StatefulWidget {
  @override
  _OnlineConsultationScreenState createState() => _OnlineConsultationScreenState();
}

class _OnlineConsultationScreenState extends State<OnlineConsultationScreen> {
  int? selectedDoctorIndex;

  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. M. Jahanzaib Jvaid',
      'specialty': 'Therapist',
      'imageUrl': 'images/Dr1.jpg',
    },
    {
      'name': 'Dr. John Doe',
      'specialty': 'Cardiologist',
      'imageUrl': 'images/doctor2.png',
    },
    {
      'name': 'Dr. Sarah Smith',
      'specialty': 'Dermatologist',
      'imageUrl': 'images/doctor3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Online Appointment'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Appoint a Doctor Online',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Choose a doctor for your online appointment.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildDoctorCard(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedDoctorIndex != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorInformationScreen(
                          // Pass necessary data here.
                        ),
                      ),
                    );
                  } else {
                    _showNoDoctorSelectedDialog();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.cyan,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(int index) {
    final isSelected = selectedDoctorIndex == index;
    final doctor = doctors[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDoctorIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: isSelected ? Colors.cyan : Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                doctor['imageUrl']!, // Use Image.asset here
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  doctor['specialty']!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showNoDoctorSelectedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Doctor Selected'),
        content: const Text('Please select a doctor to start the consultation.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
