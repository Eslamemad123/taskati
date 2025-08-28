import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/Model/task%20model.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/List%20color%20task.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20assets.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/add%20tsk/add_task%20feild.dart';

class ListOfTask extends StatelessWidget {
  const ListOfTask({super.key, this.selectDate});

  final selectDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: Local_Helper.taskBox.listenable(),
        builder: (context, box, child) {
          List<Task_Model> tasks = [];
          for (var model in box.values) {
            if (selectDate == model.date) {
              tasks.add(model);
            }
          }
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(App_Assets.noDataLottie),
                  Gap(20),
                  Text(
                    textAlign: TextAlign.center,
                    '!yet tasks any have not do You.\n roductive. days your make to tasks new Add',
                    style: Text_style.getSmall(),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return ItemListTask(
                  model: tasks[index],
                  onComplete: () {
                    box.put(tasks[index].id, tasks[index].copyWith(isCompleted: true));
                  },
                  onDelete: () {
                    Local_Helper.taskBox.delete(tasks[index].id);
                  },
                );
              },

              separatorBuilder: (context, index) {
                return Gap(10);
              },
              itemCount: tasks.length,
            );
          }
        },
      ),
    );
  }
}

class ItemListTask extends StatefulWidget {
  const ItemListTask({
    super.key,
    required this.model,
    required this.onComplete,
    required this.onDelete,
  });
  final Task_Model model;

  final Function() onComplete;
  final Function() onDelete;

  @override
  State<ItemListTask> createState() => _ItemListTaskState();
}

class _ItemListTaskState extends State<ItemListTask> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
     // height: 120,
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            widget.onComplete();
          } else {
            widget.onDelete();
          }
        },

        background: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: App_Color.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(Icons.done_outline_rounded, color: App_Color.white),
              Gap(8),
              Text(
                'Complete',
                style: Text_style.getSmall(
                  Size: 15,
                  color: App_Color.white,
                  Font_Weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        secondaryBackground: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: App_Color.red,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete_forever_rounded, color: App_Color.white),
              Gap(8),
              Text(
                'Delete',
                style: Text_style.getSmall(
                  Size: 15,
                  color: App_Color.white,
                  Font_Weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            pushTO(context, AddEdit_Task(model: widget.model));
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.model.isComplete?App_Color.green:colors[widget.model.color],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.title,
                        style: Text_style.getTital(
                          color: App_Color.white,
                          Font_Weight: FontWeight.bold,
                        ),
                      ),
                      Gap(8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: App_Color.white,
                          ),
                          Gap(8),
                          Text(
                            '${widget.model.startTime} - ${widget.model.EndTime}',
                            style: Text_style.getSmall(
                              color: App_Color.white,
                              Font_Weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(8),
                      Text(
                        widget.model.describtion ?? 'No description',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Text_style.getTital(
                          color: App_Color.white,
                          Font_Weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(5),
                SizedBox(
                  height: 100,
                  child: VerticalDivider(
                    thickness: 2,
                    color: App_Color.grey,
                    endIndent: 5,
                    indent: 5,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    widget.model.isComplete ? 'Completed' : 'TODO',
                    style: Text_style.getTital(
                      color: App_Color.white,
                      Font_Weight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
