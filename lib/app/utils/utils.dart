import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // static toastMessage(String message) {
  //   Fluttertoast.showToast(msg: message, backgroundColor: Colors.black);
  // }

  static flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          message: message,
          borderRadius: BorderRadius.circular(10),
          duration: Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.black,
          reverseAnimationCurve: Curves.easeIn,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            color: Colors.red,
            size: 30,
          ),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    ));
  }
}
