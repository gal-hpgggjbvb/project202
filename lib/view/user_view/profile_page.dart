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
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  // EditProfileController editProfileController = Get.put(EditProfileController(DioConsumer(dio: Dio())));
  late EditProfileController editProfileController;

  @override
  void initState() {
    editProfileController =
        Get.put(EditProfileController(DioConsumer(dio: Dio())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: GetBuilder<EditProfileController>(
          builder: (controller) => Column(
            children: [
              // addVerticalSpace(30),
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
              // addVerticalSpace(30),
              //todo profile image v1
              // Obx(
              //   () => CircleAvatar(
              //     radius: 70,
              //     backgroundImage: editProfileController.image.value != null
              //         ? FileImage(editProfileController.image.value!)
              //         : const AssetImage("images/profileimage1.jpg")
              //             as ImageProvider,
              //     // child: const Align(
              //     //   alignment: Alignment.bottomRight,
              //     // child: CircleAvatar(
              //     //   radius: 15,
              //     //   backgroundColor: Colors.white,
              //     //   child: Icon(Icons.edit, size: 18,color: Colors.black,),
              //     // ),
              //     // ),
              //   ),
              // ),
              addVerticalSpace(10),
              //todo from here profile image api
              GetBuilder<EditProfileController>(
                  // init: EditProfileController(DioConsumer(dio: Dio())),
                  builder: (controller) {
                    // return controller.profileImage == null && CacheHelper().getData(key: 'profileImage') == null ?
                    return CacheHelper().getData(key: 'profileImage') == null ?
                     const CircleAvatar(
                       radius: 70,
                       backgroundImage: AssetImage("images/profileimage1.jpg"),
                     ) : CircleAvatar(
                      radius: 70,
                      // backgroundImage: FileImage(File(controller.profileImage!.path)),
                      backgroundImage: FileImage(File(CacheHelper().getData(key: 'profileImage'))),
                    );
                  }
              ),
              //todo to here
              addVerticalSpace(30),

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

              addVerticalSpace(90),

              /// Edit Button
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.edit,
                      color: context.theme.colorScheme.secondary),
                  label: Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontFamily: "Satoshi",
                        // color: Colors.white,
                        color: context.theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: context.theme.primaryColor,
                    // backgroundColor: context.theme.colorScheme.onBackground,
                    elevation: 10,
                    shadowColor: context.theme.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
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
