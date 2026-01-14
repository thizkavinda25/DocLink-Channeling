import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomMessage {
  static void customMessage(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      showCloseIcon: false,
      
      title: "Success",
      desc: "Password reset email sent successfully",
      btnOkOnPress: () {},
    ).show();
  }
}
