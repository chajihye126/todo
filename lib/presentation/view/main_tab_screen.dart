import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('MainTabScreen'),
        ),
      ),
    );
  }

  Widget _bottomNavWidget({required BuildContext context}) => BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: SvgPicture.asset('assets/calendar.svg'), label: 'calendar'),

    ],
  );
}
