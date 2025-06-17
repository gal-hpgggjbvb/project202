// import 'package:flutter/material.dart';
//
// class CustomPasswordField extends StatelessWidget {
//
//   final String fieldName;
//
//   final TextEditingController controller;
//
//   final TextInputType textInputType;
//
//   final String hintText;
//
//   const CustomPasswordField(
//       {super.key,
//         required this.fieldName,
//         required this.controller,
//         required this.textInputType,
//         required this.hintText,});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//          Text(
//           fieldName,
//           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//         ),
//         //todo password text_field
//         TextFormField(
//           controller: controller,
//           keyboardType: textInputType,
//           obscureText: obscureText,
//           // maxLength: 20,
//           decoration: InputDecoration(
//               focusColor: Colors.red,
//               focusedBorder:  const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue)),
//               hintText: hintText,
//               suffixIcon: IconButton(
//                 icon: Icon(obscureText
//                     ? Icons.visibility
//                     : Icons.visibility_off),
//                 onPressed: () {
//                   obscureText = !obscureText;
//                 },
//               )),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return "this field can't be empty";
//             } else if (value.length < 8) {
//               return "password must be at least 8 characters";
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
