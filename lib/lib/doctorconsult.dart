import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDoctor;
  String? selectedDate;
  String? selectedTime;
  String patientName = '';

  final List<String> doctors = ['Dr. Smith', 'Dr. Jones', 'Dr. Lee'];
  final List<String> times = ['10:00 AM', '11:00 AM', '1:00 PM', '2:00 PM'];

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Book Appointment'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Doctor Image
              Image.asset('images/Dr1.jpg', height: 100, width: 100),

              // Select Date
              const Text('Select Date*', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date (YYYY-MM-DD)*',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date.';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Select Time
              const Text('Select Time*', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                value: selectedTime,
                items: times.map((time) {
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
                hint: const Text('Choose a time'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a time.';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSnackBar("Request sent! You will be notified shortly.");
                    print("Appointment booked for $patientName with $selectedDoctor on $selectedDate at $selectedTime");
                  } else {
                    _showSnackBar("Please fill out all the fields.");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Colors.cyan,
                ),
                child: const Text(
                  'BOOK APPOINTMENT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: BookAppointmentScreen()));
}
