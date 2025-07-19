import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final IconData iconData;

  final String title;

  final String subtitle;

  final VoidCallback? onTap;
  final bool showDivider;
  final bool showCopyIcon;

  const CustomListTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.showDivider = true,
    this.showCopyIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData, color: context.theme.primaryColorDark),
          title: Text(
            title,
            style: TextStyle(
              color: context.theme.primaryColorDark,
              fontSize: 17,
              fontWeight: FontWeight.bold, // typing style
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: context.theme.primaryColorDark,
              fontSize: 17,
              fontWeight: FontWeight.normal, // typing style
            ),
          ),
          // visualDensity: VisualDensity.compact,
          trailing: showCopyIcon
              ? IconButton(
                  icon: Icon(Icons.copy,
                    color: context.theme.colorScheme.onSecondary,
                    size: 20,),
                  tooltip: 'Copy ID',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: subtitle));
                    Get.snackbar("Copied", "Your ID copied");
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     // margin: EdgeInsets.all(1),
                    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    //     content: Text(
                    //       '$title copied',
                    //       style: context.theme.textTheme.bodySmall,
                    //     ),
                    //     backgroundColor: context.theme.primaryColorLight,
                    //   ),);
                  },
                )
              : (onTap != null ? const Icon(Icons.chevron_right) : null),
          onTap: onTap,
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 0),
          ), // Thin line below
      ],
    );
  }
}
