import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { success, error, warning }


  Color _choseBuildColor(ToastState state) {
    Color color;
    switch (state) {
      case ToastState.success:
        color = Colors.green;
        break;
      case ToastState.error:
        color = Colors.red;
        break;
      case ToastState.warning:
        color = Colors.amberAccent;
        break;
    }
    return color;
  }

  void customToast({required String msg, required ToastState state}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: _choseBuildColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
  }

