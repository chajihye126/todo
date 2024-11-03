import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo/core/utils/size_utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDate = DateTime.now();
  final DateTime _selectedDate = DateTime.now();

  void updateScreen() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  String nowDateString({required String dateString}) {
    final date = DateFormat(dateString).format(DateTime.now());
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                30.sbH,
                title(context: context),
                10.sbH,
                dateWidget(context: context),
                20.sbH,
                todoListContainer(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget todoListItem({required BuildContext context, required bool isSelected, required String title, required String subText, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 2),
                ),
              ),
              3.sbH,
              SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: Colors.amber,
                  width: 2,
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: ssW(context) * 0.73,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          time,
                          style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    10.sbH,
                    Text(subText, style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(.5)),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget todoListContainer({required BuildContext context}) {
    return Column(
      children: [
        todoListItem(context: context, isSelected: false, title: 'Wakeup', subText: 'Early wakeup form bed and fresh', time: '7:00AM'),
      ],
    );
  }

  Widget dateWidget({required BuildContext context}) {
    final startOfWeek = _focusedDate.subtract(Duration(days: _focusedDate.weekday));
    final daysInWeek = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    // 오늘 날짜의 요일
    final dayOfWeek = _focusedDate.weekday;

    return Column(
      children: [
        SizedBox(
          width: ssW(context),
          height: 25,
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    DateFormat.E().format(DateTime(2024, 1, index)),
                    style: dayOfWeek == index ? TextStyle(fontSize: 16, color: Colors.amber) : TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(
          width: ssW(context),
          height: 40,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 7,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemBuilder: (context, index) {
              final date = daysInWeek[index];
              final isSelected = _selectedDate.year == date.year && _selectedDate.month == date.month && _selectedDate.day == date.day;

              return Column(
                children: [
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: isSelected
                              ? TextStyle(fontSize: 16, color: Colors.amber, fontWeight: FontWeight.bold)
                              : TextStyle(fontSize: 16),
                        ),
                        2.sbH,
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.amber : null,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget title({required BuildContext context}) {
    return SizedBox(
      width: ssW(context),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _focusedDate = _focusedDate.subtract(Duration(days: 7));
              });
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                nowDateString(dateString: 'MMM M, yyyy'),
                // 'May 5, 2020',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text('Today', style: TextStyle(fontSize: 18))
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _focusedDate = _focusedDate.add(Duration(days: 7));
              });
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}