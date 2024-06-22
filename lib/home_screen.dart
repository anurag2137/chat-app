// import 'package:flutter/material.dart';
// import 'package:wallify_ui/update_user.dart';
// import 'package:wallify_ui/wheight_history.dart';
// import 'bmi_calculator.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//
//   static List<Widget> _widgetOptions = <Widget>[
//     HomeWidget(),
//     UpdateUserSettingsWidget(),
//     BMICalculatorWidget(),
//     WeightHistoryGraphWidget(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Health App'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calculate),
//             label: 'BMI Calculator',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.show_chart),
//             label: 'Weight History',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home Screen'));
//   }
// }
