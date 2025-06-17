import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;

  final String image;

  const CustomCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 3),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          // margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              //I assumed you want to occupy the entire space of the card
              image: AssetImage(image),
            ),
          ),
          child: ListTile(
            leading: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
