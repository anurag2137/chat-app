import 'package:flutter/material.dart';

class BMICalculatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BMICalculator();
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  String _selectedHeightUnit = 'cm';
  String _selectedWeightUnit = 'kg';
  double _bmi = 0.0;

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    if (height > 0 && weight > 0) {
      setState(() {
        _bmi = weight / ((height / 100) * (height / 100));
      });
    }
  }

  Color _getIndicatorColor() {
    if (_bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (_bmi < 25) {
      return Colors.green; // Normal weight
    } else if (_bmi < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obese
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bmi.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Calculate Your BMI',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Height',
                              labelStyle: TextStyle(fontSize: 20.0, color: Colors.black.withOpacity(0.6)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        DropdownButton<String>(
                          value: _selectedHeightUnit,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          elevation: 16,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedHeightUnit = newValue ?? '';
                            });
                          },
                          items: <String>['cm', 'm', 'ft', 'in']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Weight',
                              labelStyle: TextStyle(fontSize: 20.0, color: Colors.black.withOpacity(0.6)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        DropdownButton<String>(
                          value: _selectedWeightUnit,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          elevation: 16,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedWeightUnit = newValue ?? '';
                            });
                          },
                          items: <String>['kg', 'lbs']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _calculateBMI();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your BMI'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Your BMI is ${_bmi.toStringAsFixed(1)}'),
                            SizedBox(height: 10.0),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getIndicatorColor(),
                              ),
                              child: Center(
                                child: Text(
                                  _bmi.toStringAsFixed(1),
                                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Calculate', style: TextStyle(fontSize: 18.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
