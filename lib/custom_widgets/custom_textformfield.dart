import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController controller;

  final TextInputType textInputType;

  final String hintText;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          decoration:  InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              hintText: hintText ),
          validator: (value) {
            if (value!.isEmpty) {
              return "this field can't be empty";
            }
          },
    );
  }
}


// import 'package:flutter/material.dart';
//
// class CustomTextFormField extends StatelessWidget {
//
//   final String fieldName;
//
//   final TextEditingController controller;
//
//   final TextInputType textInputType;
//
//   final String hintText;
//
//   const CustomTextFormField(
//       {super.key,
//       required this.fieldName,
//       required this.controller,
//       required this.textInputType,
//       required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           fieldName,
//           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//         ),
//         TextFormField(
//           controller: controller,
//           keyboardType: textInputType,
//           decoration:  InputDecoration(
//               focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue)),
//               hintText: hintText ),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "this field can't be empty";
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
