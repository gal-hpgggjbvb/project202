import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangListTile extends StatelessWidget {
  final String image;
  final String language;
  final bool? icon;
  final VoidCallback? onTap;

  const LangListTile({
    required this.image,
    required this.language,
    this.icon = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 3.0),
      child: Card(
        color: context.theme.colorScheme.surface,
        // color: Color(0xFFFDF8F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          leading: ClipOval(
            child: Image.asset(
              'images/languages/$image',
              // 'images/English_language.svg.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            language,
            style: TextStyle(
                fontFamily: "Satoshi",
                // color: context.theme.colorScheme.onSecondary,
                color: context.theme.colorScheme.onSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          // trailing: Radio(
          //   value: null,
          //   groupValue: null,
          //   onChanged: (Null? value) {  },
          // ),
          // trailing: Icon(Icons.check_circle_outline),
          trailing: icon!
              ? Icon(
                  Icons.check_circle_outline,
                  color: context.theme.primaryColor,
                  size: 28,
                )
              : null,
          // Icon(
          //         Icons.radio_button_unchecked,
          //         color: context.theme.primaryColor,
          //         size: 25,
          //       ),
          horizontalTitleGap: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          contentPadding: EdgeInsets.all(10),
          onTap: onTap,
        ),
      ),
    );
  }
}
