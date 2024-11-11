import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void buildShowToastFunction(
    {required String message, num durationInSeconds = 3}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: durationInSeconds > 2 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
    timeInSecForIosWeb: durationInSeconds.toInt(), // Set the duration
  );
}
