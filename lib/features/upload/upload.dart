import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/components/buttons/main%20button.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/extentions/snackbar.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20assets.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/home/home%20screen.dart';

// ignore: must_be_immutable, camel_case_types
class Upload_Screen extends StatefulWidget {
  Upload_Screen({super.key});

  @override
  State<Upload_Screen> createState() => _Upload_ScreenState();
}

class _Upload_ScreenState extends State<Upload_Screen> {
  // ignore: non_constant_identifier_names
  String? Path;

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: App_Color.white,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 25),
            child: TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && Path != null) {
                  Local_Helper.cachUserData(
                    Local_Helper.KeyName,
                    nameController.text,
                  );
                  Local_Helper.cachUserData(Local_Helper.KeyImage, Path);
                  Local_Helper.cachUserData(Local_Helper.KeyisUpload, true);

                  pushAndRemoveUntil(context, Home_Screen());
                } else if (nameController.text.isNotEmpty && Path == null) {
                  ShowErrorDialog(context, "please upload photo");
                } else if (nameController.text.isEmpty && Path == null) {
                  ShowErrorDialog(
                    context,
                    "please upload photo and enter name",
                  );
                } else {
                  ShowErrorDialog(context, "please enter name");
                }
              },
              child: Text(
                'Done',
                style: Text_style.getSmall(
                  color: App_Color.PrimaryColorBlue,
                  Font_Weight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: App_Color.PrimaryColorBlue,
                radius: 80,
                backgroundImage:
                    Path != null
                        ? FileImage(File(Path ?? ''))
                        : AssetImage(App_Assets.userPhoto),
              ),
              Gap(20),
              Main_Button(
                text: 'Upload From Camera',
                onPressed: () {
                  UploadImage(true);
                },
                width: 250,
              ),
              Gap(10),
              Main_Button(
                text: 'Upload From Galary',
                onPressed: () async {
                  UploadImage(false);
                },
                width: 250,
              ),
              Gap(30),
              Divider(
                thickness: 1,
                color: App_Color.grey,
                indent: 20,
                endIndent: 20,
              ),
              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Enter Your Name'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  UploadImage(bool isCamera) async {
    var imagePicker = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (imagePicker != null) {
      setState(() {
        Path = imagePicker.path;
      });
    }
  }
}
