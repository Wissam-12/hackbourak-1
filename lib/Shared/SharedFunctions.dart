import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackbourak/screens/PopUp.dart';

import 'package:url_launcher/url_launcher.dart';

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

    static showLoaderDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: CircularProgressIndicator())),
      );
      showDialog(barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

  static showPopup(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: SizedBox(
          width: 500,
            height: 500,
            child: PopUp()
        ),
      )
    );
    showDialog(barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

      static Future<void> openMap(double latitude, double longitude) async {
        String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          throw 'Could not open the map.';
        }
      }

}