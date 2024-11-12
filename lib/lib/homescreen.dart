import 'package:flutter/material.dart';
import 'package:mysecondprogram/lib/healthcheckup.dart';
import 'package:mysecondprogram/lib/onlineconsult.dart';
import 'package:mysecondprogram/lib/vaccination.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Medical Appointment App'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const Text(
                'Popular Doctors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDoctorCard(
                      name: 'Dr. Jahanzaib',
                      specialty: 'Therapist',
                      imageUrl: 'images/Dr1.jpg',
                    ),
                    _buildDoctorCard(
                      name: 'Dr. John Doe',
                      specialty: 'Cardiologist',
                      imageUrl: 'images/doctor2.png',
                    ),
                    _buildDoctorCard(
                      name: 'Dr. Sarah Smith',
                      specialty: 'Dermatologist',
                      imageUrl: 'images/doctor3.png',
                    ),
                    _buildDoctorCard(
                      name: 'Dr. Emily White',
                      specialty: 'Pediatrician',
                      imageUrl: 'images/doctor4.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OnlineConsultationScreen()));
                },
                child: _buildServiceCard(
                  title: 'Online Appointment',
                  imageUrl: 'images/appoint.jpg',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HealthCheckupScreen()));
                },
                child: _buildServiceCard(
                  title: 'Health Checkup',
                  imageUrl: 'images/bpop.webp',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VaccinationScreen()));
                },
                child: _buildServiceCard(
                  title: 'Vaccination',
                  imageUrl: 'images/vaccination.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard({required String name, required String specialty, required String imageUrl}) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 120,
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
        children: [
          ClipOval(
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            specialty,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({required String title, required String imageUrl}) {
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}