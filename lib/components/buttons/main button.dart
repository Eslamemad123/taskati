import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';

class Main_Button extends StatelessWidget {
  Main_Button({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 45,
    required this.onPressed,
    this.color = App_Color.PrimaryColorBlue,
  });

  final String text;
  final double width;
  final double height;
  final Color color;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        child: Text(text, style: Text_style.getBody(color: App_Color.white)),
      ),
    );
  }
}
