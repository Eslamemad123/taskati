import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20assets.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';
import 'package:taskati/features/home/home%20screen.dart';
import 'package:taskati/features/upload/upload.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
 @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){

    bool isUploadImage=Local_Helper.getUserData(Local_Helper.KeyisUpload)??false;
    isUploadImage?pushReplacement(context, Home_Screen())
    :  pushReplacement(context, Upload_Screen());
    });
    super.initState();
  }
 
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(App_Assets.taskLottie),
        
            Gap(25),
            Text('Taskati',style: Text_style.getTital()),
            Gap(15),
            Text('It\'s Time to Get Organized',style: Text_style.getSmall(color: App_Color.grey),),
          ],
        ),
      ),
    );
  }
}