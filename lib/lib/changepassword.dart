import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the password change operation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password changed successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Change Password', style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Password Field
              TextFormField(
                controller: _currentPasswordController,
                obscureText: _isCurrentPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.cyan),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isCurrentPasswordObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCurrentPasswordObscured = !_isCurrentPasswordObscured;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // New Password Field
              TextFormField(
                controller: _newPasswordController,
                obscureText: _isNewPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.cyan),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isNewPasswordObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isNewPasswordObscured = !_isNewPasswordObscured;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Confirm New Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _isConfirmPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.cyan),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                validator: (value) {
                  if (value == null || value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),

              // Change Password Button
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.cyan,
                  ),
                  child: Text('Change Password',  style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
