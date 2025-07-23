import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/profile/profile_info_model.dart';

class ProfileInfoController extends GetxController {
  final ApiConsumer api;

  ProfileInfoController(this.api);

  late SignStatus signStatus;

  @override
  onInit() {
    super.onInit();
    signStatus = Get.put(SignStatus());
  }

  String? name;

  int? id;

  String? phone;

  String? email;
  ProfileInfoModel? profileInfoModel;

  fetchProfileInfo() async {
    try {
      signStatus.changeLoadingProgress() ;
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get("http://10.0.2.2:8000/api/user/profile",
          // isFormData: true,
          // data: {
          //   'email': CacheHelper().getData(key: 'email'),
          //   'password': CacheHelper().getData(key: 'password'),
          //   'password': '00001111',}
            );
      if (await CacheHelper().getData(key: 'statusCode') == 200) {
        profileInfoModel = ProfileInfoModel.fromJson(response);
        name = profileInfoModel!.user.name;
        id = profileInfoModel!.user.id;
        phone = profileInfoModel!.user.phone;
        email = profileInfoModel!.user.email;
        await CacheHelper().saveData(key: 'name', value: name);
        await CacheHelper().saveData(key: 'phone', value: phone);
        await CacheHelper().saveData(key: 'email', value: email);
        // signStatus.signSuccess('Fetched Profile Info', 'Done');
        signStatus.changeLoadingProgress();
        // print('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/');
        // print(signStatus.loadingProgress);
      } else {
        signStatus.changeLoadingProgress();
        return null;
      }
      // print('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/');
      // print(name);
      // print(id);
      // print(phone);
      // print(email);
      // print("✅ POST status: ${await CacheHelper().getData(key: 'statusCode')}+++++++++++++++++++++++++++");
      // print(response);
      // signStatus.signSuccess('', 'Done') ;
      update();
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
  }
}
