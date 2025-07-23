
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/controller/profile_controller/profile_info_controller.dart';
import 'package:project2/model/profile/update_profile_model.dart';

import '../../api/api_consumer.dart';
import '../../api/dio_consumer.dart';
import '../../cache/cache_helper.dart';
import '../../model/errors/exceptions.dart';
import '../auth/sign_status.dart';

class UpdateProfileController extends GetxController {
  final ApiConsumer api;

  UpdateProfileController(this.api);

  late ProfileInfoController profileInfoController;
  late SignStatus signStatus ;

  TextEditingController editNameController = TextEditingController();

  TextEditingController editPhoneController = TextEditingController();

  TextEditingController editEmailController = TextEditingController();

  TextEditingController editPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> editProfileFormKey = GlobalKey();

  Rx<File?> image = Rx<File?>(null);

  // XFile? profileImage ;
  // File? imageFile ;

  File? profileImage;

  // final nameController = TextEditingController();
  // final phoneController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  //
  // final editProfileFormKey = GlobalKey<FormState>();
  //
  //todo v2
  setProfileImage(File img) {
    profileImage = img;
    CacheHelper().saveData(key: 'profileImage', value: profileImage!.path);
    update();
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    setProfileImage(File(picked!.path));
    // if (picked != null) {
    //   profileImage = File(picked.path); // update image
    // }
    // CacheHelper().saveData(key: 'profileImage', value: profileImage!.path);
    update();
  }

  //todo v1
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
    CacheHelper().removeData(key: 'profileImage');
    SignStatus().signSuccess('Profile Image Removed', '');
    update();
  }

  @override
  void onInit() {
    editNameController.text = CacheHelper().getData(key: 'name') ?? '';
    editPhoneController.text = CacheHelper().getData(key: 'phone') ?? '';
    editEmailController.text = CacheHelper().getData(key: 'email') ?? '';
    // editPasswordController.text = CacheHelper().getData(key: 'password') ?? '';
    profileInfoController =
        Get.put(ProfileInfoController(DioConsumer(dio: Dio())));
    signStatus = Get.put(SignStatus());
    // profileInfoController.fetchProfileInfo();
    // editNameController.text = profileInfoController.name! ;
    // editPhoneController.text = profileInfoController.phone!;
    // editEmailController.text = profileInfoController.email!;
    //for image update
    final path = CacheHelper().getData(key: 'imagePath');
    if (path != null) image.value = File(path);
    super.onInit();
  }
  UpdateProfileModel? updateProfileModel ;

  editProfile() async {
    try {
      signStatus.changeLoadingProgress();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      // print('here send token **********************************************') ;
      final response =
      await api.put('http://10.0.2.2:8000/api/user/profile', data: {
        'name': editNameController.text,
        'phone': editPhoneController.text,
        'email': editEmailController.text,
        // 'password': editPasswordController.text,
        // 'password_confirmation': editPasswordController.text,
      });
      if(CacheHelper().getData(key: 'statusCode') == 200){
        print('++++++++++++++++++++++++++++++++++++++++++++++');
        updateProfileModel = UpdateProfileModel.fromJson(response);
        await CacheHelper().saveData(key: 'name', value: updateProfileModel!.data.name);
        await CacheHelper().saveData(key: 'phone', value: updateProfileModel!.data.phone);
        await CacheHelper().saveData(key: 'email', value: updateProfileModel!.data.email);
        // print(updateProfileModel!.data.name);
        // print(updateProfileModel!.data.phone);
        // print(updateProfileModel!.data.email);
        // print(updateProfileModel!.data.role);
        // print(updateProfileModel!.data.createdAt);
        // print(updateProfileModel!.data.updatedAt);
        signStatus.changeLoadingProgress();
        SignStatus().signSuccess('Profile Updated Successfully', 'Done');
        profileInfoController.fetchProfileInfo();
        CacheHelper().removeData(key: 'statusCode');
      }else{
        signStatus.changeLoadingProgress();
        return null ;
      }
      // print('here save data **********************************************') ;
      // await CacheHelper().saveData(key: 'name', value: editNameController.text);
      // await CacheHelper()
      //     .saveData(key: 'phone', value: editPhoneController.text);
      // await CacheHelper()
      //     .saveData(key: 'email', value: editEmailController.text);
      // await CacheHelper()
      //     .saveData(key: 'password', value: editPasswordController.text);
      // print('here sign status **********************************************') ;
      // SignStatus().signSuccess('Profile Updated Successfully', 'Done');
      update();
      // print(response);
    } on ServerExceptions catch (e) {
      // print('here failed  **********************************************') ;
      signStatus.changeLoadingProgress();
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }

// uploadProfileImage(XFile image){
//   profileImage = image ;
//   update();
// }

// Future<void> saveImageToPrefs(XFile file) async {
//   final bytes = await file.readAsBytes();
//   final base64String = base64Encode(bytes);
//   await CacheHelper().saveData(key: 'profileImage', value: base64String);
//   update();
// }
// Future<void> pickImageFromGallery() async {
//   final picker = ImagePicker();
//   final picked = await picker.pickImage(source: ImageSource.gallery);
//
//   if (picked != null) {
//     profileImage = File(picked.path);
//   }
//   CacheHelper().saveData(key: 'imagePath', value: image.value!.path);
//   SignStatus().signSuccess('Profile Image Updated', '');
//   update();
// }
}
