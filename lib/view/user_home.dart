import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/custom_widgets/custom_card.dart';

import '../cache/cache_helper.dart';
import 'auth/sign_in_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

   File? image ;

   Future<void> pickImageFromGallery() async {
     final ImagePicker imagePicker = ImagePicker();
     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery) ;
     // if(image == null) return ;

     // final imageTemporary = File(image!.path) ;
     setState(() {
       image = File(pickedFile!.path) ;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo profile image
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        "images/4 - Copy.jpg",
                        fit: BoxFit.cover,
                      ) ,
                  ) ,
              ),
              InkWell(
                onTap: (){
                  pickImageFromGallery() ;
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                        height: 120,
                        width: 120,
                        child: image == null ? Image.asset("images/4 - Copy.jpg", fit: BoxFit.cover,) :
                            Image.file(image!)
                    ) ,
                ),
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CacheHelper().getData(key: 'name'),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    CacheHelper().getData(key: 'email'),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              //todo sign-out button
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                onPressed: () {
                  // controller.sharedpref.clear();
                  CacheHelper().clearData();
                  // CacheHelper().saveData(key: 'signed', value: 2) ;
                  Get.off(() => const SignInPage());
                },
                child: const Text(
                  "sign out",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 30,),
              //todo pick image button
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.green,
                onPressed: () {
                  pickImageFromGallery() ;
                },
                child: const Text(
                  "pick profile image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: image == null ? Text('data') :
                  Image.file(image! , height: 200, width: 200,),
              ) ,
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, itemCount) {
            return CustomCard(
              title: "Food",
              image: "images/4 - Copy.jpg",
            );
          }),
    );
  }

}

