import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart'; // Import OneSignal

import '../chat.dart';
import 'categories.dart';
import 'home.dart';
import 'search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> types;
  late Home home;
  late Search search;
  late Categories categories;
  late Widget currentPage;

  @override
  void initState() {
    home = Home();
    search = Search();
    categories = Categories();
    types = [home, search, categories];
    currentPage = Home();
    // initOneSignal(); // Initialize OneSignal
    super.initState();
  }

  // Future<void> initOneSignal() async {
  //   await OneSignal.shared.init("YOUR_ONESIGNAL_APP_ID"); // Initialize OneSignal with your App ID
  //   OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  //   // Handle notification received event
  //   OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
  //     // Handle notification received, you can show a notification or update UI here
  //   });
  //   // Handle notification opened event
  //   OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //     // Handle notification opened, navigate to the message inbox or specific screen here
  //   });
  // }

  void goToMessageInbox() {
    // Implement navigation to the message inbox screen
    // For example:
    Navigator.push(context, MaterialPageRoute(builder: (context) => MessengerScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        height: 65,
        color: Color.fromARGB(225, 84, 87, 93),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(Icons.search_outlined, color: Colors.white),
          Icon(Icons.category, color: Colors.white),
          Icon(Icons.message, color: Colors.white), // Add message icon to bottom navigation bar
        ],
      ),
      body: types[currentTabIndex],
    );
  }
}
