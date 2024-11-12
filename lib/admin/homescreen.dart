import 'package:flutter/material.dart';
import 'package:mysecondprogram/admin/addmore.dart';
import 'package:mysecondprogram/lib/healthcheckup.dart';
import 'package:mysecondprogram/lib/onlineconsult.dart';
import 'package:mysecondprogram/lib/vaccination.dart';
import 'package:mysecondprogram/database/database_helper.dart';

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
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: DatabaseHelper().getDoctors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error fetching data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No doctors found'));
                    } else {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...snapshot.data!.map(
                                (doctor) => _buildDoctorCard(
                              name: doctor['fullname'],
                              specialty: doctor['specialty'],
                              imagePath: doctor['imagePath'],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 16), // Added spacing before Add More
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplyVisaScreen()),
                  );
                },
                child: _buildDoctorCard(
                  name: 'Add More',
                  specialty: '',
                  imagePath: 'images/addicon.png',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineConsultationScreen()));
                },
                child: _buildServiceCard(
                  title: 'Online Appointment',
                  imageUrl: 'images/appoint.jpg',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HealthCheckupScreen()));
                },
                child: _buildServiceCard(
                  title: 'Health Checkup',
                  imageUrl: 'images/bpop.webp',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinationScreen()));
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

  Widget _buildDoctorCard({required String name, required String specialty, required String imagePath}) {
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
              imagePath,
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
