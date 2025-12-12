import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/components/buttons/main%20button.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/home/home%20screen.dart';

// ignore: must_be_immutable, camel_case_types
class EditProfile_Screen extends StatefulWidget {
  const EditProfile_Screen({super.key});

  @override
  State<EditProfile_Screen> createState() => _EditProfile_ScreenState();
}

class _EditProfile_ScreenState extends State<EditProfile_Screen> {
  String? Path;

  @override
  Widget build(BuildContext context) {
    bool isdark = Local_Helper.getUserData(Local_Helper.KeyisDark) ?? false;

    String name = Local_Helper.getUserData(Local_Helper.KeyName);
    var image = Local_Helper.getUserData(Local_Helper.KeyImage);
    TextEditingController nameController = TextEditingController(text: name);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                isdark = !isdark;
                Local_Helper.cachUserData(Local_Helper.KeyisDark, isdark);
                setState(() {
                  log('$isdark');
                });
              },
              icon: isdark ? Icon(Icons.dark_mode_rounded) : Icon(Icons.sunny),
              color: App_Color.PrimaryColorBlue,
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            pushReplacement(context, Home_Screen());
          },
          child: Icon(Icons.arrow_back, color: App_Color.PrimaryColorBlue),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              ButtomSheetImage(context, isdark);
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 81,
                  backgroundColor: App_Color.PrimaryColorBlue,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: App_Color.white,
                    backgroundImage:
                        Path != null
                            ? FileImage(File(Path!))
                            : FileImage(File(image)),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: isdark ? App_Color.black : App_Color.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: App_Color.PrimaryColorBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(50),
      
          Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
            color: App_Color.PrimaryColorBlue,
          ),
          Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: Text_style.getTital(
                    color: App_Color.PrimaryColorBlue,
                    Font_Weight: FontWeight.w600,
                    Size: 22,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ButtomSheetName(context, nameController, isdark);
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: App_Color.PrimaryColorBlue,
                    child: CircleAvatar(
                      backgroundColor:
                          isdark ? App_Color.black : App_Color.white,
                      radius: 17,
                      child: Icon(
                        Icons.edit,
                        color: App_Color.PrimaryColorBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> ButtomSheetName(
    BuildContext context,
    TextEditingController nameController,
    bool isdark,
  ) {
    return showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      builder: (contsxt) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: isdark ? App_Color.black : App_Color.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: TextFormField(controller: nameController),
                ),
          
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Main_Button(
                    height: 60,
                    text: 'Update Your Name',
                    onPressed: () {
                      setState(() {
                        Local_Helper.cachUserData(
                          Local_Helper.KeyName,
                          nameController.text,
                        );
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> ButtomSheetImage(BuildContext context, bool isdark) {
    return showModalBottomSheet(
      context: context,
      builder: (contsxt) {
        return Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: isdark ? App_Color.black : App_Color.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Main_Button(
                  height: 60,
                  text: 'Upload from Camera',
                  onPressed: () async {
                    String? path = await Image_Picker(true);
                    if (path != null) {
                      Navigator.pop(context);
                      Local_Helper.cachUserData(Local_Helper.KeyImage, path);
                    }
                  },
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Main_Button(
                  height: 60,
                  text: 'Upload from Gallary',
                  onPressed: () async {
                    String? path = await Image_Picker(false);
                    if (path != null) {
                      Navigator.pop(context);
                      Local_Helper.cachUserData(Local_Helper.KeyImage, path);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> Image_Picker(bool isCamera) async {
    var Picker = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (Picker != null) {
      setState(() {
        Path = Picker.path;
      });
    }
    return Path;
  }
}
