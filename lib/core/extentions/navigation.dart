import 'package:flutter/material.dart';

Future pushTO(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

pushReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

pushAndRemoveUntil(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}
