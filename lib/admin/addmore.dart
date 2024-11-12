import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mysecondprogram/database/database_helper.dart';

class ApplyVisaScreen extends StatefulWidget {
  @override
  _ApplyVisaScreenState createState() => _ApplyVisaScreenState();
}

class _ApplyVisaScreenState extends State<ApplyVisaScreen> {
  final fullNameController = TextEditingController();
  final specialtyController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  @override
  void dispose() {
    fullNameController.dispose();
    specialtyController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _addDoctor() async {
    String fullName = fullNameController.text.trim();
    String specialty = specialtyController.text.trim();

    if (fullName.isEmpty || specialty.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    String? imagePath;
    if (_image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imageFileName = '${DateTime.now().millisecondsSinceEpoch}.png';
      final savedImage = await _image!.copy('${directory.path}/$imageFileName');
      imagePath = savedImage.path;//this is a new line
    }

    final addDoctor = AddDoctors(
      fullName: fullName,
      specialty: specialty,
      imagePath: imagePath,
    );

    await DatabaseHelper().insertDoctorInfo(addDoctor);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Doctor info added successfully!")),
    );

    // Clear the fields after successful submission
    fullNameController.clear();
    specialtyController.clear();
    setState(() {
      _image = null;
    });
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 229, 226, 229),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Doctors"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: fullNameController,
                decoration: _inputDecoration('Doctor Name'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: specialtyController,
                decoration: _inputDecoration('Speciality'),
              ),
              SizedBox(height: 20),
              _image != null
                  ? Image.file(
                _image!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Text("No image selected."),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addDoctor,
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.cyan,
                ),
                child: Text(
                  'Add Doctor',
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
