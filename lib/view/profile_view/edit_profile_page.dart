import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';
import 'package:project2/functions/add_space.dart';
import 'package:project2/view/profile_view/edit_password_page.dart';

import '../../controller/auth/sign_status.dart';
import '../../controller/profile_controller/update_profile_controller.dart';
import '../../custom_widgets/custom_textformfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // File? image;
  // Future<void> pickImageFromGallery() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     image = File(pickedFile!.path);
  //   });
  // }

  // EditProfileController editProfileController = Get.put(EditProfileController(DioConsumer(dio: Dio())));
  late UpdateProfileController updateProfileController;

  @override
  void initState() {
    updateProfileController =
        Get.put(UpdateProfileController(DioConsumer(dio: Dio())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w500, // typing style
          ),
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        //The keyboard to auto-close when tapping outside
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Form(
              key: updateProfileController.editProfileFormKey,
              child: Column(
                children: [
                  // addVerticalSpace(20),
                  //todo profile image v1
                  // Obx(
                  //   () => GestureDetector(
                  //     onTap: () => editProfileController.pickImage(),
                  //     child: CircleAvatar(
                  //       radius: 70,
                  //       backgroundImage: editProfileController.image.value != null
                  //           ? FileImage(editProfileController.image.value!)
                  //           // : const AssetImage("images/profileimage.jpg") as ImageProvider,
                  //           : const AssetImage("images/profileimage1.jpg")
                  //               as ImageProvider,
                  //       child: const Align(
                  //         alignment: Alignment.bottomRight,
                  //         child: CircleAvatar(
                  //           radius: 20,
                  //           backgroundColor: Colors.white,
                  //           child: Icon(
                  //             Icons.camera_alt,
                  //             size: 25,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  addVerticalSpace(20),
                  //todo from here profile image v2
                  GetBuilder<UpdateProfileController>(
                      // init: EditProfileController(DioConsumer(dio: Dio())),
                      builder: (controller) {
                    return CircleAvatar(
                      radius: 70,
                      // backgroundImage: controller.profileImage == null && CacheHelper().getData(key: 'profileImage') == null ?
                      backgroundImage: CacheHelper().getData(key: 'profileImage') ==
                              null
                          ? const AssetImage("images/profileimage1.jpg")
                          :
                          // FileImage(File(controller.profileImage!.path))
                          FileImage(
                                  File(CacheHelper().getData(key: 'profileImage')))
                              as ImageProvider,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              // ImagePicker().pickImage(source: ImageSource.gallery)
                              //     .then((value) =>
                              //// controller.uploadProfileImage(value!)) ;
                              //     controller.setProfileImage(File(value!.path))) ;
                              // CacheHelper().saveData(key: 'profileImage', value: controller.profileImage!.path);
                              controller.pickImageFromGallery();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  //todo to here profile image v2
                  TextButton.icon(
                    // onPressed: editProfileController.deleteImage,
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Delete Photo?',
                        desc: 'Are you sure you want to remove your profile image?',
                        btnCancelOnPress: () {},
                        btnOkText: "Yes",
                        btnOkOnPress: () {
                          updateProfileController
                              .deleteImage(); // 👈 your controller logic
                        },
                      ).show();
                      // Get.defaultDialog(
                      //   title: "Delete Photo",
                      //   middleText: "Are you sure you want to remove your profile photo?",
                      //   confirm: ElevatedButton(
                      //     onPressed: () {
                      //       editProfileController.deleteImage();
                      //       Get.back();
                      //     },
                      //     child: Text("Yes"),
                      //   ),
                      //   cancel: TextButton(
                      //     onPressed: () => Get.back(),
                      //     child: Text("Cancel"),
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: Text("Remove Photo",
                        style: context.theme.textTheme.bodySmall!
                            .copyWith(color: Colors.red)),
                  ),

                  addVerticalSpace(20),

                  ///todo name field
                  CustomTextFormField(
                    controller: updateProfileController.editNameController,
                    textInputType: TextInputType.text,
                    hintText: 'Name',
                    maxLength: 20,
                    isPrefixIcon: true,
                    icon: Icons.person,
                  ),
                  addVerticalSpace(10),

                  ///todo phone field
                  CustomTextFormField(
                    controller: updateProfileController.editPhoneController,
                    textInputType: TextInputType.phone,
                    hintText: 'Phone',
                    maxLength: 10,
                    isPrefixIcon: true,
                    icon: Icons.phone,
                  ),
                  addVerticalSpace(10),

                  ///todo email field
                  CustomTextFormField(
                    controller: updateProfileController.editEmailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Email',
                    isPrefixIcon: true,
                    icon: Icons.email,
                  ),
                  addVerticalSpace(35),
                  ///todo change password
                  Center(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.lock,
                          color: context.theme.colorScheme.secondary),
                      label: Text(
                        "Change Password",
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
                      onPressed: () => Get.to(() => const EditPasswordPage()),
                    ),
                  ),

                  ///todo password field
                  // CustomTextFormField(
                  //   controller: updateProfileController.editPasswordController,
                  //   textInputType: TextInputType.text,
                  //   hintText: 'Password',
                  //   isPassword: true,
                  //   isPrefixIcon: true,
                  //   icon: Icons.password,
                  // ),
                  ///todo confirm password
                  // CustomTextFormField(
                  //   controller: updateProfileController.editPasswordController,
                  //   textInputType: TextInputType.text,
                  //   hintText: 'Password',
                  //   isPassword: true,
                  //   isPrefixIcon: true,
                  //   icon: Icons.password,
                  // ),
                  addVerticalSpace(100),

                  ///todo save changes button
                  ElevatedButton.icon(
                    onPressed: () async {
                      await updateProfileController.editProfile();
                      // AwesomeDialog(
                      //   context: context,
                      //   width: double.infinity,
                      //   dialogType: DialogType.noHeader,
                      //   customHeader: const Icon(
                      //     Icons.lock,
                      //     color: Colors.redAccent,
                      //     size: 70,
                      //   ),
                      //   animType: AnimType.topSlide,
                      //   dialogBorderRadius: BorderRadius.circular(20),
                      //   body: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      //     child: Column(
                      //       children: [
                      //         Text('Enter password to save changes',
                      //         style: TextStyle(
                      //           fontFamily: "Satoshi",
                      //           color: context.theme.colorScheme.onSecondary,
                      //           fontSize: 17,
                      //           fontWeight: FontWeight.normal, // typing style
                      //         ),),
                      //         addVerticalSpace(20),
                      //         CustomTextFormField(
                      //           controller: updateProfileController.editPasswordController,
                      //           hintText: 'enter password',
                      //           textInputType: TextInputType.visiblePassword,
                      //           isPassword: true,
                      //         ),
                      //         addVerticalSpace(20),
                      //       ],
                      //     ),
                      //   ),
                      //   btnOkText: "Save Changes",
                      //   btnCancelText: "Cansel",
                      //   buttonsTextStyle: const TextStyle(
                      //     fontFamily: "Satoshi",
                      //     color: Colors.white,
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.normal, // typing style
                      //   ),
                      //   btnCancelOnPress: () {},
                      //   btnOkOnPress: () async {
                      //     await updateProfileController.editProfile();
                      //   },
                      // ).show();
                    },
                    icon: Icon(Icons.save, color: context.theme.colorScheme.secondary,),
                    label: Text(
                      "Save Changes",
                      style: TextStyle(
                        color: context.theme.colorScheme.secondary,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<SignStatus>(
                builder: (controller) {
                  if(controller.loadingProgress){
                    return LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.orangeAccent, size: 100.0);
                  }
                  else{return const Text('') ;}
                }),
          ],
        ),
      ),
    );
  }
}
