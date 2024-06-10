import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../chat.dart';
import 'categories.dart';
import 'home.dart';
import 'search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

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
          // Navigation logic added here
          if (index == 3) { // Assuming chat icon is at index 3
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          }
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(Icons.search_outlined, color: Colors.white),
          Icon(Icons.category, color: Colors.white),
          // Assuming this is the chat icon
          Icon(Icons.chat, color: Colors.white),
        ],
      ),
      body: types[currentTabIndex],
    );
  }
}
