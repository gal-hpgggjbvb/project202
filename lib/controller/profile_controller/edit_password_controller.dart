import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/controller/profile_controller/profile_info_controller.dart';
import 'package:project2/model/errors/exceptions.dart';

class EditPasswordController extends GetxController {
  final ApiConsumer api;

  EditPasswordController(this.api);

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> editPasswordFormKey = GlobalKey();

  late ProfileInfoController profileInfoController;

  late SignStatus signStatus;

  @override
  void onInit() {
    profileInfoController =
        Get.put(ProfileInfoController(DioConsumer(dio: Dio())));
    signStatus = Get.put(SignStatus());
    super.onInit();
  }

  editPassword() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      signStatus.changeLoadingProgress();
      await api.put('http://10.0.2.2:8000/api/user/profile',
          data: {
            'current_password': oldPasswordController.text,
            'password': newPasswordController.text,
            'password_confirmation': confirmNewPasswordController.text,
          });
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        signStatus.changeLoadingProgress();
        signStatus.signSuccess('updated password successfully', '');
        // await profileInfoController.fetchProfileInfo();
        CacheHelper().removeData(key: 'statusCode');
      }
      else{
        signStatus.changeLoadingProgress();
        return null ;
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
      signStatus.changeLoadingProgress();
    }
  }
}
