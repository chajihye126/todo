import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/theme/app_theme.dart';
import 'package:todo/di/di.dart';
import 'package:todo/presentation/view/tab_screen/add_todo_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('MainTabScreen'),
        ),
        bottomNavigationBar: _bottomNavWidget(context: context),
        floatingActionButton: _floatingActionButton(context: context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  Widget _bottomNavWidget({required BuildContext context}) =>
      BottomNavigationBar(
        onTap: mainTabViewModel.bottomNavOnTap,
        currentIndex: mainTabViewModel.bottomNavCurrentIndex,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icon/calendar.svg'), label: 'calendar'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icon/calendar.svg'), label: 'calendar'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icon/calendar.svg'), label: 'calendar'),
          BottomNavigationBarItem(icon: Container(), label: '')
        ],
      );

  FloatingActionButton _floatingActionButton({required BuildContext context}) =>
      FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTodoScreen())),
        shape: CircleBorder(),
      );
}
