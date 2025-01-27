import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Helpers {
  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 100), () {
      try {
        loader.remove();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }
  // static Future<bool> verifyInternet() async {
  //   try {
  //     var connectivityResult = await Connectivity().checkConnectivity();
  //     if (connectivityResult == ConnectivityResult.mobile ||
  //         connectivityResult == ConnectivityResult.wifi) {

  //       return true;

  //     }
  //   } catch (e) {
  //     // Handle any exceptions
  //     return false;
  //   }
  //   return false;
  // }

  static createErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(
            fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
      ),
    ));
  }

  /*static Future<bool> verifyInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }*/
  static String errorString(String errorList) {
    var parts = errorList.split('[');
    var prefix = parts[1].trim();
    var pre = prefix.split(']');
    var fix = pre[0].trim();
    debugPrint(fix);
    return fix;
  }

  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}
