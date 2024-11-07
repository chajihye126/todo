import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todo/core/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        drawer: _drawer(),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }

  Widget _calendarWidget() => Container();

  Drawer _drawer() => Drawer();

  AppBar _appBar() => AppBar(actions: [_searchButton(), 20.sbW]);

  Widget _searchButton() => const Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Icon(FeatherIcons.search),
      );
}
