
//todo nothing here is used

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroPages extends StatelessWidget {
   IntroPages({super.key});
  final List<PageViewModel> introPages = [
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ) ,
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ) ,
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ) ,
  ] ;
  @override
  Widget build(BuildContext context) {
    return Container() ;
  }
}
