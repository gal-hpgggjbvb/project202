import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/profile_controller/profile_info_controller.dart';
import 'package:project2/custom_widgets/custom_listtile.dart';
import 'package:project2/functions/add_space.dart';
import 'package:project2/view/profile_view/edit_profile_page.dart';

import '../../cache/cache_helper.dart';
import '../../controller/auth/sign_status.dart';

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

  // late UpdateProfileController updateProfileController;

  late ProfileInfoController profileInfoController;

  @override
  void initState() {
    // updateProfileController =
    //     Get.put(UpdateProfileController(DioConsumer(dio: Dio())));
    profileInfoController =
        Get.put(ProfileInfoController(DioConsumer(dio: Dio())));
    profileInfoController.fetchProfileInfo();
    super.initState();
  }

  @override
  void dispose() {
    // profileInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          alignment: Alignment.center,
          children: [
            ///todo profile page data
            GetBuilder<ProfileInfoController>(
              builder: (controller) => Column(
                children: [
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
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("images/profileimage1.jpg"),
                  ),

                  ///todo from here profile image api
                  // GetBuilder<UpdateProfileController>(
                  //     // init: EditProfileController(DioConsumer(dio: Dio())),
                  //     builder: (controller) {
                  //   // return controller.profileImage == null && CacheHelper().getData(key: 'profileImage') == null ?
                  //   return CacheHelper().getData(key: 'profileImage') == null
                  //       ? const CircleAvatar(
                  //           radius: 70,
                  //           backgroundImage: AssetImage("images/profileimage1.jpg"),
                  //         )
                  //       : CircleAvatar(
                  //           radius: 70,
                  //           // backgroundImage: FileImage(File(controller.profileImage!.path)),
                  //           backgroundImage: FileImage(
                  //               File(CacheHelper().getData(key: 'profileImage'))),
                  //         );
                  // }),
                  ///todo to here
                  addVerticalSpace(30),

                  // Profile Info Tiles
                  //todo name
                  CustomListTile(
                    iconData: Icons.person,
                    title: 'Name',
                    subtitle:
                        // '${CacheHelper().getData(key: 'name') ?? 'name here'}',
                        controller.name ?? 'Not set',
                  ),

                  //todo id
                  CustomListTile(
                    iconData: Icons.badge,
                    title: 'ID',
                    subtitle:
                        // '${CacheHelper().getData(key: 'id')?.substring(0, 7) ?? 'id'}...',
                        '${controller.id}',
                    showCopyIcon: true,
                  ),

                  //todo phone
                  CustomListTile(
                    iconData: Icons.phone,
                    title: 'Phone',
                    subtitle:
                        // '${CacheHelper().getData(key: 'phone') ?? 'Not set'}',
                        controller.phone ?? 'Not set',
                  ),

                  //todo email
                  CustomListTile(
                    iconData: Icons.email,
                    title: 'Email',
                    subtitle:
                        // '${CacheHelper().getData(key: 'email') ?? 'email here'}',
                        controller.email ?? 'Not set',
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
                  // TextButton(onPressed: (){
                  //   print(CacheHelper().getData(key: 'email'));
                  //   print(CacheHelper().getData(key: 'password'));
                  // }, child: Text('print')),
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
            ),

            ///todo loading progress
            GetBuilder<SignStatus>(
                builder: (controller) {
                  if(controller.loadingProgress){
                    return LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.orangeAccent, size: 100.0);
                  }
               else{return const Text('') ;}
            }),
          ],
        )),
      ),
    );
  }
}
