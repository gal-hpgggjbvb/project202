import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final int? maxLength;
  final bool isPassword;
  final bool isPrefixIcon ;
  final IconData? icon;
  final TextEditingController? compareWithController;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    this.maxLength,
    this.isPassword = false,
    this.isPrefixIcon = false,
    this.icon,
    this.compareWithController,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.next,
      obscureText: widget.isPassword ? _obscureText : false,
      maxLength: widget.maxLength,

      // autofocus: true,
      style: TextStyle(
        color: context.theme.primaryColor,
        fontSize: 17,
        fontWeight: FontWeight.normal, // typing style
      ),
      decoration: InputDecoration(
        // prefixIcon: widget.icon! != null ? Icon(widget.icon) : null,
        prefixIcon: widget.isPrefixIcon ? Icon(widget.icon) : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: context.theme.colorScheme.secondary,
          fontSize: 15,
          // fontStyle: FontStyle.italic,
        ),
        counterStyle: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 13,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.2,
        ),
         // border: UnderlineInputBorder(
         //   borderSide: BorderSide(color: Colors.black),
         // ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.theme.primaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        }

        if (widget.hintText.toLowerCase().contains("email") &&
            !value.contains('@')) {
          return "Enter a valid email address";
        }

        if (widget.isPassword && value.length < 8) {
          return "Password must be at least 8 characters";
        }

        if (widget.compareWithController != null &&
            value != widget.compareWithController!.text) {
          return "Passwords do not match";
        }

        return null;
      },

      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "This field can't be empty";
      //   }
      //   if(widget.isPassword){
      //     if(value.length < 8){
      //       return "password must be at least 8 characters";
      //     }
      //   }
      //   return null;
      // },
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
