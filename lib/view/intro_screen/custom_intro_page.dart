//todo used in intro_screen

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
          Text(title, style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
          ),
          Text(body, style: const TextStyle(fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black),),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
