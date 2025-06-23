import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../cache/cache_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            //todo profile image

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child: SizedBox(
            //     height: 120,
            //     width: 120,
            //     child: Image.asset(
            //       "images/4 - Copy.jpg",
            //       fit: BoxFit.cover,
            //     ) ,
            //   ) ,
            // ),
            const SizedBox(height: 30,) ,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   CacheHelper().getData(key: 'name'),
                //   style: const TextStyle(
                //       fontSize: 20, fontWeight: FontWeight.w500),
                // ),
                Text(
                  '${CacheHelper().getData(key: 'name') ?? 'name here'}' ,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 10,),
                Text(
                  'number : ${CacheHelper().getData(key: 'phone') ?? 'number here'}' ,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 10,),
                Text(
                  CacheHelper().getData(key: 'email') ?? 'email here',
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
