import 'package:flutter/material.dart';

class HealthCheckupScreen extends StatefulWidget {
  @override
  _HealthCheckupScreenState createState() => _HealthCheckupScreenState();
}

class _HealthCheckupScreenState extends State<HealthCheckupScreen> {
  // Variable to keep track of which container is selected
  int? selectedMetricIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Health Checkup'),
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
              'Your Health Metrics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildHealthMetric(0, 'Heart Rate', '72 bpm'),
            const SizedBox(height: 16),
            _buildHealthMetric(1, 'Blood Pressure', '120/80 mmHg'),
            const SizedBox(height: 16),
            _buildHealthMetric(2, 'Blood Sugar', '90 mg/dL'),
            const SizedBox(height: 16),
            _buildHealthMetric(3, 'Cholesterol', '180 mg/dL'),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your checkup scheduling logic here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Checkup Scheduled'),
                      content: const Text('Your health checkup has been scheduled.'),
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
                  'Schedule Checkup',
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

  // Helper method to build the health metric container
  Widget _buildHealthMetric(int index, String metricName, String value) {
    final bool isSelected = selectedMetricIndex == index; // Check if the metric is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMetricIndex = index; // Update selected metric index on tap
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.cyan : Colors.transparent, // Change border color when selected
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              metricName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
