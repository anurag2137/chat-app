import 'package:flutter/material.dart';

class UpdateUserSettingsWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  double? height;
  double? weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Height (cm or feet)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  final heightValue = double.tryParse(value);
                  if (heightValue == null) {
                    return 'Please enter a valid height';
                  }
                  return null;
                },
                onSaved: (value) {
                  height = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight (kg or pounds)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  final weightValue = double.tryParse(value);
                  if (weightValue == null) {
                    return 'Please enter a valid weight';
                  }
                  return null;
                },
                onSaved: (value) {
                  weight = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Update user details in Firestore
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
