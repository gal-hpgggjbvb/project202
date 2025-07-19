//todo used in intro_screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/functions/add_space.dart';

class CustomIntroPage extends StatelessWidget {
  final String title;

  final String body;

  final String img;

  const CustomIntroPage(
      {super.key, required this.title, required this.body, required this.img});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 10, left: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Lottie.asset("images/$img")),
            // child: Image.asset("images/$img")),
          ),
          addVerticalSpace(100),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Satoshi",
              color: context.theme.primaryColorDark,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          addVerticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              body,
              style: TextStyle(
                fontFamily: "Satoshi",
                color: context.theme.primaryColorDark,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          addVerticalSpace(50),
        ],
      ),
    );
  }
}
