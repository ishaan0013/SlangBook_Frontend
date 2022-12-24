import 'package:flutter/material.dart';
import 'package:slang_app_user/screens/home/home_screen.dart';
import 'package:slang_app_user/screens/search_screen.dart';
import 'package:slang_app_user/screens/subscription/subscription_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const id = '/BottomNavScreen';

  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    SubscriptionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: 'Subscription'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
      ),
      body: screens[selectedIndex],
    );
  }
}
