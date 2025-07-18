import 'package:flutter/material.dart';
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
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.normal, // typing style
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.secondary,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            // fontStyle: FontStyle.italic,
          ),
          labelStyle: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            // fontStyle: FontStyle.italic,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: context.theme.colorScheme.secondary,
              width: 0.7,
            ),
          ),
          // focusColor: context.theme.colorScheme.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: context.theme.colorScheme.secondary,
              width: 0.7,
            ),
          ),
        ),
        // style: context.theme.textTheme.bodyMedium,

        validator: (value) {
          if (value!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
}
