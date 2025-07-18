import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';

import '../cache/cache_helper.dart';

class EditProfileController extends GetxController {
  final ApiConsumer api;

  EditProfileController(this.api);

  TextEditingController editNameController = TextEditingController();

  TextEditingController editPhoneController = TextEditingController();

  TextEditingController editEmailController = TextEditingController();

  TextEditingController editPasswordController = TextEditingController();

  GlobalKey<FormState> editProfileFormKey = GlobalKey();

  Rx<File?> image = Rx<File?>(null);

  // final nameController = TextEditingController();
  // final phoneController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  //
  // final editProfileFormKey = GlobalKey<FormState>();
  //

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      image.value = File(picked.path); // update image
    }
    CacheHelper().saveData(key: 'imagePath', value: image.value!.path);
    SignStatus().signSuccess('Profile Image Updated', '');
    update();
  }

  void deleteImage() {
    image.value = null; // reset to null
    CacheHelper().removeData(key: 'image_path');
    SignStatus().signSuccess('Profile Image Removed', '');
    update();
  }

  @override
  void onInit() {
    editNameController.text = CacheHelper().getData(key: 'name') ?? '';
    editPhoneController.text = CacheHelper().getData(key: 'phone') ?? '';
    editEmailController.text = CacheHelper().getData(key: 'email') ?? '';
    editPasswordController.text = CacheHelper().getData(key: 'password') ?? '';
    //for image update
    final path = CacheHelper().getData(key: 'imagePath');
    if (path != null) image.value = File(path);
    super.onInit();
  }

  editProfile() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      // print('here send token **********************************************') ;
      final response =
          await api.put('http://10.0.2.2:8000/api/user/profile', data: {
        'name': editNameController.text,
        'phone': editPhoneController.text,
        'email': editEmailController.text,
        'password': editPasswordController.text,
      });
      // print('here save data **********************************************') ;
      CacheHelper().saveData(key: 'name', value: editNameController.text);
      CacheHelper().saveData(key: 'phone', value: editPhoneController.text);
      CacheHelper().saveData(key: 'email', value: editEmailController.text);
      CacheHelper().saveData(key: 'password', value: editPasswordController.text);
      // print('here sign status **********************************************') ;
      SignStatus().signSuccess('Profile Updated Successfully', 'Done');
      print(response);
    } on ServerExceptions catch (e) {
      // print('here failed  **********************************************') ;
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }
}
