import 'package:flutter/material.dart';

class VaccinationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Vaccination'),
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
              'Available Vaccinations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildVaccinationOption('COVID-19 Vaccine', 'Protects against COVID-19'),
            const SizedBox(height: 16),
            _buildVaccinationOption('Flu Vaccine', 'Annual vaccine to prevent flu'),
            const SizedBox(height: 16),
            _buildVaccinationOption('Hepatitis B Vaccine', 'Protects against Hepatitis B'),
            const SizedBox(height: 16),
            _buildVaccinationOption('MMR Vaccine', 'Protects against Measles, Mumps, and Rubella'),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your scheduling logic here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Appointment Scheduled'),
                      content: const Text('Your vaccination appointment has been scheduled successfully.'),
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
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.cyan,
                ),
                child: const Text(
                  'Schedule Appointment',
                  style: TextStyle(fontSize: 18,
                  color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVaccinationOption(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
