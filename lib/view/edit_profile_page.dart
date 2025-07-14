import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/edit_profile_controller.dart';
import '../custom_widgets/custom_textformfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileController editProfileController =
      Get.put(EditProfileController(DioConsumer(dio: Dio())));
  File? image;

  Future<void> pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Edit Profile"),backgroundColor: Colors.orange,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        //The keyboard to auto-close when tapping outside
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: editProfileController.editProfileFormKey,
          child: Column(
            children: [
              // const SizedBox(height: 30),
              // InkWell(
              //   onTap: () => pickImageFromGallery(),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(100),
              //     child: SizedBox(
              //       height: 120,
              //       width: 120,
              //       child: image == null
              //           ? Image.asset("images/4 - Copy.jpg", fit: BoxFit.cover)
              //           : Image.file(image!),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              Obx(() => GestureDetector(
                onTap: () => editProfileController.pickImage(),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: editProfileController.image.value != null
                      ? FileImage(editProfileController.image.value!)
                      // : const AssetImage("images/profileimage.jpg") as ImageProvider,
                      : const AssetImage("images/profileimage1.jpg") as ImageProvider,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 18,color: Colors.black,),
                    ),
                  ),
                ),
              ),),
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
                      editProfileController.deleteImage(); // 👈 your controller logic
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
                label: const Text("Remove Photo", style: TextStyle(color: Colors.red)),
              ) ,


              const SizedBox(height: 20),

              // Form Fields
              CustomTextFormField(
                controller: editProfileController.editNameController,
                textInputType: TextInputType.text,
                hintText: 'Name',
                maxLength: 20,
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: editProfileController.editPhoneController,
                textInputType: TextInputType.phone,
                hintText: 'Phone',
                maxLength: 10,
              ),
              const SizedBox(height: 12),

              CustomTextFormField(
                controller: editProfileController.editEmailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
              ),
              const SizedBox(height: 40),

              CustomTextFormField(
                controller: editProfileController.editPasswordController,
                textInputType: TextInputType.text,
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 100),

              ElevatedButton.icon(
                // onPressed: controller.saveProfile,
                onPressed: () async {
                  await editProfileController.editProfile();
                  // Get.back() ;
                },
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("Save Changes",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
      ),
    );
  }
}
