import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedFunctions {

  static void showingToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

    static showLoaderDialog(BuildContext context){
      AlertDialog alert=AlertDialog(
        content: SizedBox(
          height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator())),
      );
      showDialog(barrierDismissible: false,
        context:context,
        builder:(BuildContext context){
          return alert;
        },
      );

  }


}