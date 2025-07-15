import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void showSuccessDialog(BuildContext? context, {
  required String title,
  required String desc,
  VoidCallback? onOk,
}) {
  if (context == null) return; // ✅ prevent crash if null

  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.bottomSlide,
    title: title,
    desc: desc,
    btnOkText: "OK",
    btnOkOnPress: onOk ?? () {},
  ).show();
}
