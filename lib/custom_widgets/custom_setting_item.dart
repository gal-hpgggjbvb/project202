import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/functions/add_space.dart';

class CustomSettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CustomSettingItem({
    required this.title,
    required this.icon,
    this.iconBackgroundColor = Colors.grey,
    this.iconColor = Colors.white,
    this.onTap,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          // title: Text(title , style: const TextStyle(fontSize: 20),),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: "Satoshi",
              color: context.theme.colorScheme.onSecondary,
              fontSize: 18,
              fontWeight: FontWeight.normal, // typing style
            ),
          ),
          trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 15),
          onTap: onTap,
        ),
        addVerticalSpace(10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            height: 0,
          ),
        ),
        addVerticalSpace(10),
      ],
    );
  }
}

// Card(
// margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// child: ListTile(
// leading: Container(
// width: 35,
// height: 35,
// decoration: BoxDecoration(
// color: iconBackgroundColor,
// // shape: BoxShape.circle,
// borderRadius: BorderRadius.circular(8),
// ),
// child: Icon(icon, color: iconColor, size: 20),
// ),
// title: Text(title , style: const TextStyle(fontSize: 20),),
// trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 15),
// onTap: onTap,
// ),
// );
