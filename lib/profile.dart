import 'package:flutter/material.dart';



class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(''), // Replace with your image asset
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ProfileTextField(
                label: 'Name',
                initialValue: 'Robin Hoda',
              ),
              SizedBox(height: 20),
              ProfileTextField(
                label: 'Phone Number',
                initialValue: '+880 1778253294',
              ),
              SizedBox(height: 20),
              ProfileTextField(
                label: 'Email',
                initialValue: 'sahabuddinu@gmail.com',
              ),
              SizedBox(height: 20),
              ProfileTextField(
                label: 'DOB',
                initialValue: 'DD/MM/YY',
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: <String>['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // Handle change
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle update profile button press
                },
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  ProfileTextField({required this.label, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}