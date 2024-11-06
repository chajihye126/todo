import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todo/di/di.dart';
import 'package:todo/presentation/view/tab_screen/add_todo_screen.dart';
import 'package:todo/presentation/view/tab_screen/calendar_screen.dart';
import 'package:todo/presentation/view/tab_screen/search_screen.dart';
import 'package:todo/presentation/view_model/main_tab_view_model.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  final MainTabViewModel mainTabViewModel = DI().get<MainTabViewModel>();

  @override
  void initState() {
    super.initState();

    mainTabViewModel.addListener(updateScreen);
  }

  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      // HomeScreen(),
      CalendarScreen(),
      SearchScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: mainTabViewModel.bottomNavCurrentIndex,
          children: screens,
        ),
        bottomNavigationBar: _bottomNavWidget(context: context),
        floatingActionButton: _floatingActionButton(context: context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _bottomNavWidget({required BuildContext context}) =>
      BottomNavigationBar(
        onTap: mainTabViewModel.bottomNavOnTap,
        currentIndex: mainTabViewModel.bottomNavCurrentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff212529),
        items: [
          // BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.calendar), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(FeatherIcons.search), label: 'search'),
        ],
      );

  FloatingActionButton _floatingActionButton({required BuildContext context}) =>
      FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTodoScreen())),
        shape: CircleBorder(),
        child: Icon(FeatherIcons.plus),
      );
}
