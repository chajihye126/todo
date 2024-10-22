import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context: context),
        body: Column(
          children: [
            Text('Add Task'),
            Text('Task title'),
            Container(
              width: ssW(context),
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar({required BuildContext context}) => AppBar();
}
