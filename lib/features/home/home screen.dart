import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/home/HeaderDate/hedar__date.dart';
import 'package:taskati/features/home/ListItem/list_of_task.dart';
import 'package:taskati/features/home/header/home_header.dart';

// ignore: must_be_immutable
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  DateTime now = DateTime.now();

  late var formatDate = DateFormat.yMMMMd('en_US').format(now);

  late var formatTime = DateFormat.EEEE('en_US').format(now);

  String selectDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    var name = Local_Helper.getUserData(Local_Helper.KeyName);
    var image = Local_Helper.getUserData(Local_Helper.KeyImage);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Home_Header(name: name, image: image),
              Gap(15),
              Hedar_Date(formatDate: formatDate, formatTime: formatTime),
              Gap(10),
              DatePicker(
                width: 80,
                dayTextStyle: Text_style.getSmall(),
                monthTextStyle: Text_style.getSmall(),
                dateTextStyle: Text_style.getBody(Font_Weight: FontWeight.w600),
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: App_Color.PrimaryColorBlue,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    selectDate = DateFormat("yyyy-MM-dd").format(date);
                    log(selectDate);
                  });
                },
              ),
              Gap(15),
              ListOfTask(selectDate: selectDate),
            ],
          ),
        ),
      ),
    );
  }
}
