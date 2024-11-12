import 'package:flutter/material.dart';

import 'doctorconsult.dart';



class DoctorInformationScreen extends StatefulWidget {
  @override
  _DoctorInformationScreenState createState() => _DoctorInformationScreenState();
}

class _DoctorInformationScreenState extends State<DoctorInformationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? selectedGender;
  String? selectedDate;
  String? selectedMonth;
  String? selectedYear;
  List<String> selectedSymptoms = [];
  int selectedWeight = 45;

  final List<int> weightList = List.generate(17, (index) => 20 + index * 5);
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> symptomsOptions = [
    'Fever',
    'Cough',
    'Headache',
    'Nausea',
    'Fatigue',
    'Shortness of breath',
    'Chest pain',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Appointment Form'),
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
              const Text(
                "Complete the form before appointing your doctor...",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Date of Birth Field
              const Text(
                'Date of Birth*',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      value: selectedDate,
                      items: List.generate(31, (index) => (index + 1).toString())
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                      hint: const Text('Date'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      value: selectedMonth,
                      items: List.generate(12, (index) => (index + 1).toString())
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                      hint: const Text('Month'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      value: selectedYear,
                      items: List.generate(100, (index) => (2024 - index).toString())
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                      hint: const Text('Year'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Weight Field with Horizontal List
              const Text(
                'Weight',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weightList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedWeight = weightList[index];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedWeight == weightList[index]
                                ? Colors.cyan
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: selectedWeight == weightList[index]
                              ? Colors.cyan
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            '${weightList[index]} kg',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Gender Field
              const Text(
                'Gender*',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: genderOptions.map((option) {
                  return ChoiceChip(
                    label: Text(option),
                    selected: selectedGender == option,
                    selectedColor: Colors.cyan,
                    backgroundColor: Colors.white,
                    onSelected: (isSelected) {
                      setState(() {
                        selectedGender = isSelected ? option : null;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Symptoms Field
              const Text(
                'Symptoms*',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...symptomsOptions.map((symptom) {
                return CheckboxListTile(
                  title: Text(symptom),
                  value: selectedSymptoms.contains(symptom),
                  activeColor: Colors.cyan,
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        selectedSymptoms.add(symptom);
                      } else {
                        selectedSymptoms.remove(symptom);
                      }
                    });
                  },
                );
              }).toList(),

              const SizedBox(height: 20),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Print values for debugging
                    print("Name: $name");
                    print("Date: $selectedDate/$selectedMonth/$selectedYear");
                    print("Weight: $selectedWeight kg");
                    print("Symptoms: $selectedSymptoms");
                    print("Gender: $selectedGender");

                    // Navigate to CallOptionsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Colors.cyan,
                ),
                child: const Text(
                  'CONTINUE',
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
  runApp(MaterialApp(home: DoctorInformationScreen()));
}
