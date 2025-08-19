import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';

class Text_style {
  static TextStyle getTital({double? Size, FontWeight? Weight, Color? color}) {
    return TextStyle(
      fontSize: Size ?? 18,
      fontWeight: Weight ?? FontWeight.normal,
      color: color ?? App_Color.black,
    );
  }

  static TextStyle getBody({
    Color? color,
    double? Size,
    FontWeight? Weight,
  }) {
    return TextStyle(
      fontSize: Size ?? 16,
      fontWeight: Weight ?? FontWeight.normal,
      color: color ?? App_Color.black,
    );
  }

  static TextStyle getSmall({
    Color? color,
    FontWeight? Weight,
    double? Size,
  }) {
    return TextStyle(color: color??App_Color.black,fontSize: Size??14,fontWeight: Weight??FontWeight.normal);
  }
}
