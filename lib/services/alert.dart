import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alert {
  static successLogin({type = "Login"}) {
    return Fluttertoast.showToast(
        msg: "$type Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(25, 135, 84, 1),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static success() {
    return Fluttertoast.showToast(
        msg: "Record Successfully Submited",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(25, 135, 84, 1),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static successMessage(String text) {
    return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromRGBO(25, 135, 84, 1),
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static error() {
    return Fluttertoast.showToast(
        msg: "Something Went Worng!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(220, 53, 69, 1),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static errorMessage(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(220, 53, 69, 1),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
