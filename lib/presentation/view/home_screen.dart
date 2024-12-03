import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todo/core/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TaskModel> taskList = [
    TaskModel(taskTitle: 'Title', date: DateTime.now()),
  ];

  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        drawer: _drawer(),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return taskWidget(
                  title: taskList[index].taskTitle,
                  date: taskList[index].date,
                );
              },
            ),
          ],
        ),
        floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  FloatingActionButton _floatingActionButton() => FloatingActionButton(onPressed: () {

  },);

  Widget taskWidget({required String title, required DateTime date}) => Container(
    child: Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
        5.sbH,
        Text(date.toString(), style: TextStyle(fontSize: 14),),
      ],
    ),
  );

  Widget _calendarWidget() => Container();

  Drawer _drawer() => Drawer();

  AppBar _appBar() => AppBar(actions: [_searchButton(), 20.sbW]);

  Widget _searchButton() => const Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Icon(FeatherIcons.search),
      );
}

class TaskModel {
  final String taskTitle;
  final DateTime date;

  TaskModel({required this.taskTitle, required this.date});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(taskTitle: json['taskTitle'], date: json['date']);

  Map<String, dynamic> toJson() => {'taskTitle': taskTitle, 'date': date};
}