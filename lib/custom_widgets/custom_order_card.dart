import 'package:flutter/material.dart';

class CustomOrderCard extends StatelessWidget {
  final String title;

  final String subtitle;

  final int leading;

  final String trailing;

  const CustomOrderCard(
      {super.key, required this.title, required this.subtitle, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: ListTile(
            leading: Text('$leading'),
            title: Text(title),
            // subtitle: Text(subtitle),
            trailing: Text(trailing),
          ),
        ),
      ),
    );
  }
}
