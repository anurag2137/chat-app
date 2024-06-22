import 'package:flutter/material.dart';
import 'package:wallify_ui/update_user.dart';
import 'package:wallify_ui/wheight_history.dart';

import 'bmi_calculator.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/update_user': (context) => UpdateUserSettingsWidget(),
        '/weight_history': (context) => WeightHistoryGraphWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    BMICalculatorWidget(),
    UpdateUserSettingsWidget(),
    WeightHistoryGraphWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Tracker'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'BMI Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Update User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Weight History',
          ),
        ],
      ),
    );
  }
}
