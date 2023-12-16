import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackabr(BuildContext context, String Msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        Msg,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      backgroundColor: Colors.amber,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void showLoadingBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
