import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/edit_profile_controller.dart';
import 'package:project2/custom_widgets/custom_listtile.dart';
import 'package:project2/functions/add_space.dart';
import 'package:project2/view/edit_profile_page.dart';

import '../../cache/cache_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  String? path = CacheHelper().getData(key: 'image_path');

  Future<void> pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    // if(image == null) return ;

    // final imageTemporary = File(image!.path) ;
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  EditProfileController editProfileController =
      Get.put(EditProfileController(DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: GetBuilder<EditProfileController>(
          builder: (controller) => Column(
            children: [
              const SizedBox(height: 30),
              // InkWell(
              //   onTap: () => pickImageFromGallery(),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(100),
              //     child: SizedBox(
              //       height: 120,
              //       width: 120,
              //       child: image != null
              //           ? Image.file(editProfileController.image.value!)
              //           : Image.asset("images/4 - Copy.jpg", fit: BoxFit.cover),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              Obx(
                () => CircleAvatar(
                  radius: 60,
                  backgroundImage: editProfileController.image.value != null
                      ? FileImage(editProfileController.image.value!)
                      : const AssetImage("images/profileimage1.jpg")
                          as ImageProvider,
                  // child: const Align(
                  //   alignment: Alignment.bottomRight,
                  // child: CircleAvatar(
                  //   radius: 15,
                  //   backgroundColor: Colors.white,
                  //   child: Icon(Icons.edit, size: 18,color: Colors.black,),
                  // ),
                  // ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Profile Info Tiles
              //todo name
              CustomListTile(
                iconData: Icons.person,
                title: 'Name',
                subtitle:
                    '${CacheHelper().getData(key: 'name') ?? 'name here'}',
              ),

              //todo id
              CustomListTile(
                iconData: Icons.badge,
                title: 'ID',
                subtitle:
                    '${CacheHelper().getData(key: 'id')?.substring(0, 7) ?? 'id'}...',
                showCopyIcon: true,
              ),

              //todo phone
              CustomListTile(
                iconData: Icons.phone,
                title: 'Phone',
                subtitle: '${CacheHelper().getData(key: 'phone') ?? 'Not set'}',
              ),

              //todo email
              CustomListTile(
                iconData: Icons.email,
                title: 'Email',
                subtitle:
                    '${CacheHelper().getData(key: 'email') ?? 'email here'}',
              ),

              const SizedBox(height: 100),

              // Edit Button
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orange,
                    elevation: 10,
                    shadowColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  onPressed: () => Get.to(() => const EditProfilePage()),
                ),
              ),

              addVerticalSpace(100),
              // Push version to bottom visually

              //todo App Version Text
              const Text(
                'v1.0.0',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              addVerticalSpace(10),
              // MaterialButton(
              //   onPressed: () {
              //     print(CacheHelper().getData(key: 'name'));
              //   },
              //   child: Text('print'),
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
