import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/Edit%20Profile/Edit_Profile.dart';

class Home_Header extends StatelessWidget {
  Home_Header( {super.key, this.name, this.image});
  bool isdark = Local_Helper.getUserData(Local_Helper.KeyisDark) ?? false;

  var name;
  var image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hellow ${name.toString().split(' ')[0]}',
              style: Text_style.getTital(
                color: App_Color.PrimaryColorBlue,
                Font_Weight: FontWeight.bold,
              ),
            ),
            Text('Have A Nice Day.', style: Text_style.getBody()),
          ],
        ),
        GestureDetector(
          onTap: () {

            pushTO(context, EditProfile_Screen());
          },
          child: CircleAvatar(
            radius: 29,
            backgroundColor: App_Color.PrimaryColorBlue,
            child: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(File(image)),
            ),
          ),
        ),
      ],
    );
  }
}
