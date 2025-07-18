import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class CustomOrderField extends StatelessWidget {
  final TextEditingController controller;

  // final TextInputType textInputType;

  final String hintText;
  final String labelText;

  const CustomOrderField(
      {super.key,
      required this.controller,
      // required this.textInputType,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        // keyboardType: textInputType,
        //Add this to your TextFields to let users jump to next field with the keyboard
        textInputAction: TextInputAction.next,
        // decoration: InputDecoration(
        //     labelText: labelText,
        //     // labelStyle: context.theme.textTheme.bodySmall!.copyWith(color: Colors.orangeAccent),
        //     // border: const OutlineInputBorder(
        //     //     borderSide: BorderSide(color: Colors.orangeAccent),
        //     // borderRadius: BorderRadius.all(Radius.circular(25)),),
        //     // focusedBorder: const OutlineInputBorder(
        //     //   borderSide: BorderSide(color: Colors.orangeAccent),
        //     //   borderRadius: BorderRadius.all(Radius.circular(25)),
        //     // ),
        //     hintText: hintText,
        //     // hintStyle: const TextStyle(color: Colors.blue)
        // ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,),

        style: context.theme.textTheme.bodyMedium,
        // style: const TextStyle(
        //   color: Colors.deepOrange,     // Text color while typing
        //   fontSize: 18,                 // Size of typed text
        //   fontWeight: FontWeight.bold, // Bold, normal, etc.
        //   fontFamily: 'Roboto',        // Use custom font if declared in pubspec.yaml
        // ),

        validator: (value) {
          if (value!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
}
