import 'package:flutter/material.dart';
import 'package:taskati/components/buttons/main%20button.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/add%20tsk/add_task%20feild.dart';

class Hedar_Date extends StatelessWidget {
  const Hedar_Date({
    super.key,
    required this.formatDate,
    required this.formatTime,
  });

  final String formatDate;
  final String formatTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDate,
              style: Text_style.getTital(
                Size: 20,
                Font_Weight: FontWeight.bold,
              ),
            ),
            Text(
              formatTime,
              style: Text_style.getTital(
                Size: 20,
                Font_Weight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Main_Button(
          text: '+Add Task',
          onPressed: () {
            pushTO(context, AddEdit_Task());
          },
          width: 150,
        ),
      ],
    );
  }
}
