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
          leading: Icon(iconData, color: context.theme.primaryColor),
          // title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(
            title,
            style: TextStyle(
              color: context.theme.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.bold, // typing style
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: context.theme.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.normal, // typing style
            ),
          ),
          // visualDensity: VisualDensity.compact,
          trailing: showCopyIcon
              ? IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: 'Copy',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: subtitle));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$title copied',
                          style: context.theme.textTheme.bodySmall,
                        ),
                        backgroundColor: context.theme.colorScheme.secondary,
                      ),
                    );
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
