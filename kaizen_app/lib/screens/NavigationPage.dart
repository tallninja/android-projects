import 'package:flutter/material.dart';
import 'package:kaizen_app/screens/ContentPage.dart';
import 'package:kaizen_app/widgets/custom_tab_bar.dart';

import 'HomePage.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavigationPage> {
  final List<Widget> _screens = [
    HomePage(),
    //Notifications(),
    //VideoPlayerApp(),
    //Courses(),
    //CoursesPage(),
    // WelcomeScreen(),
    ContentPage(),

    //LeaderBoard(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.assignment_rounded,
    //Icons.notifications,
    // Icons.assistant_photo_rounded,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        // appBar: AppBar(title: Text('Kaizen App')),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
