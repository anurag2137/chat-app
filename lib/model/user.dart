import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserSettings extends StatefulWidget {
  @override
  _UpdateUserSettingsState createState() => _UpdateUserSettingsState();
}

class _UpdateUserSettingsState extends State<UpdateUserSettings> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _heightController,
          decoration: InputDecoration(labelText: 'Height (cm)'),
        ),
        TextField(
          controller: _weightController,
          decoration: InputDecoration(labelText: 'Weight (kg)'),
        ),
        ElevatedButton(
          onPressed: () {
            FirebaseFirestore.instance.collection('users').doc('user_id').update({
              'height': double.parse(_heightController.text),
              'weight': double.parse(_weightController.text),
            });
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
