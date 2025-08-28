import 'dart:io';

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:taskati/components/buttons/main%20button.dart';
import 'package:taskati/core/Model/task%20model.dart';
import 'package:taskati/core/extentions/snackbar.dart';
import 'package:taskati/core/services/List%20color%20task.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';

class AddEdit_Task extends StatefulWidget {
  AddEdit_Task({super.key, this.model});
  final Task_Model? model;
  @override
  State<AddEdit_Task> createState() => _AddEdit_TaskState();
}

class _AddEdit_TaskState extends State<AddEdit_Task> {
  var title = TextEditingController();
  var description = TextEditingController();
  var date = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var startTime = TextEditingController();
  var endTime = TextEditingController();
  int selectColor = 0;

  Time selectStartTime = Time(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );
  Time selectEndTime = Time(
    hour: DateTime.now().add(Duration(hours: 1)).hour,
    minute: DateTime.now().minute,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title.text = widget.model?.title ?? '';
    date.text =
        widget.model?.date ?? DateFormat("yyyy-MM-dd").format(DateTime.now());
    description.text = widget.model?.describtion ?? '';
    startTime.text =
        widget.model?.startTime ?? DateFormat("hh:mm a").format(DateTime.now());
    endTime.text =
        widget.model?.EndTime ??
        DateFormat("hh:mm a").format(DateTime.now().add(Duration(hours: 1)));
    selectColor = widget.model?.color ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: App_Color.PrimaryColorBlue),
        ),
        title: Center(
          child: Text(
            widget.model == null ? 'Add Task' : 'Update Task',
            style: Text_style.getTital(
              color: App_Color.PrimaryColorBlue,
              Font_Weight: FontWeight.bold,
            ),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
          child: Main_Button(
            text: widget.model == null ? 'Create Task' : 'Update Task',
            onPressed: () {
              String id = '';

              if (widget.model != null) {
                id = widget.model!.id;
              } else {
                id = DateTime.now().millisecondsSinceEpoch.toString();
              }
              if (formKey.currentState!.validate()) {
                Local_Helper.cachTaskData(
                  id,
                  Task_Model(
                    id: id,
                    title: title.text,
                    describtion: description.text,
                    startTime: startTime.text,
                    EndTime: endTime.text,
                    date: date.text,
                    color: selectColor,
                    isComplete: false,
                  ),
                );

                Navigator.pop(context);
                print(date.text);
              }
            },
            height: 60,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Title',
                    style: Text_style.getBody(
                      Font_Weight: FontWeight.w500,
                      Size: 17,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter title of task';
                    }
                  },
                  controller: title,
                  decoration: InputDecoration(hintText: 'Enter title'),
                ),
        
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Description',
                    style: Text_style.getBody(
                      Font_Weight: FontWeight.w500,
                      Size: 17,
                    ),
                  ),
                ),
                TextFormField(
                  controller: description,
        
                  maxLines: 3,
                  decoration: InputDecoration(hintText: 'Enter description'),
                ),
        
                Select_Date(context),
        
                Select_Time(context),
                Select_Color(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column Select_Date(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            textAlign: TextAlign.start,
            'Date',
            style: Text_style.getBody(Font_Weight: FontWeight.w500, Size: 17),
          ),
        ),
        TextFormField(
          onTap: () async {
            var selectDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365 * 3)),
            );
            if (selectDate != null) {
              setState(() {
                date.text = DateFormat("yyyy-MM-dd").format(selectDate);
              });
            }
          },
          readOnly: true,
          controller: date,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.calendar_month_sharp,
              color: App_Color.PrimaryColorBlue,
            ),
          ),
        ),
      ],
    );
  }

  Padding Select_Color() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                textAlign: TextAlign.start,
                'Colors',
                style: Text_style.getBody(
                  Font_Weight: FontWeight.w500,
                  Size: 17,
                ),
              ),
            ),
            Row(
              spacing: 10,
              children: List.generate(colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectColor = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: colors[index],
                    child:
                        selectColor == index
                            ? Icon(Icons.done, color: Colors.white)
                            : null,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Row Select_Time(BuildContext context) {
        bool isdark = Local_Helper.getUserData(Local_Helper.KeyisDark) ?? false;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Start Time',
                  style: Text_style.getBody(
                    Font_Weight: FontWeight.w500,
                    Size: 17,
                  ),
                ),
                Gap(10),
                TextFormField(
                  /* onTap: () async {
                          var selectStartTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectStartTime != null) {
                            startTime.text = selectStartTime.format(context);
                          }
                        },*/
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        backgroundColor:
                            isdark ? App_Color.black : App_Color.white,
                        context: context,
                        value: selectStartTime,
                        sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                        sunset: TimeOfDay(hour: 18, minute: 0), // optional
                        duskSpanInMinutes: 120, // optional
                        onChange: (newTime) {
                          setState(() {
                            selectStartTime = newTime;
                            startTime.text = selectStartTime.format(context);
                          });
                        },
                      ),
                    );
                  },
                  readOnly: true,
                  controller: startTime,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.access_time,
                      color: App_Color.PrimaryColorBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(20),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'End Time',
                  style: Text_style.getBody(
                    Font_Weight: FontWeight.w500,
                    Size: 17,
                  ),
                ),
                Gap(10),
                TextFormField(
                  onTap: () async {
                    Navigator.of(context).push(
                      showPicker(
                        backgroundColor:
                            isdark ? App_Color.black : App_Color.white,
                        context: context,
                        value: selectEndTime,
                        sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                        sunset: TimeOfDay(hour: 18, minute: 0), // optional
                        duskSpanInMinutes: 120, // optional
                        onChange: (newTime) {
                          setState(() {
                            selectEndTime = newTime;
                          });

                          int time_now =
                              selectEndTime.hour * 60 + selectEndTime.minute;
                          print(time_now);

                          int min_time =
                              selectStartTime.hour * 60 +
                              selectStartTime.minute;
                          print(min_time);

                          if (time_now > min_time) {
                            setState(() {
                              endTime.text = selectEndTime.format(context);
                            });
                          } else {
                            ShowErrorDialog(
                              context,
                              "The end of time must be after the start of time.",
                            );
                          }
                        },
                      ),
                    );
                  },
                  readOnly: true,
                  controller: endTime,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.access_time,
                      color: App_Color.PrimaryColorBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
