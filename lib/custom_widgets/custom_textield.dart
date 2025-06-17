import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;

  final TextInputType textInputType;

  final String hintText;

  final int maxLength;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.hintText,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLength: maxLength,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          hintText: hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "this field can't be empty";
        }
      },
    );
  }
}
