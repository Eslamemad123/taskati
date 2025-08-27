import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';

class Text_style {
  static TextStyle getTital({
    double? Size,
    FontWeight? Font_Weight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: Size ?? 18,
      fontWeight: Font_Weight ?? FontWeight.normal,
      color: color ,
    );
  }

  static TextStyle getBody({
    Color? color,
    double? Size,
    FontWeight? Font_Weight,
  }) {
    return TextStyle(
      fontSize: Size ?? 16,
      fontWeight: Font_Weight ?? FontWeight.normal,
      color: color ,
    );
  }

  static TextStyle getSmall({
    Color? color,
    FontWeight? Font_Weight,
    double? Size,
  }) {
    return TextStyle(
      color: color ,
      fontSize: Size ?? 14,
      fontWeight: Font_Weight ?? FontWeight.normal,
    );
  }
}
