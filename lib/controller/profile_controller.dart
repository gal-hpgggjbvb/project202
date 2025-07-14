// import 'package:get/get.dart';
//
// import '../cache/cache_helper.dart';
//
// class ProfileController extends GetxController {
//   RxString name = ''.obs;
//   RxString phone = ''.obs;
//   RxString email = ''.obs;
//   RxString password = ''.obs;
//   RxString id = ''.obs;
//   RxString? imagePath = ''.obs;
//
//   @override
//   void onInit() {
//     loadProfile();
//     super.onInit();
//   }
//
//   void loadProfile() {
//     name.value = CacheHelper().getData(key: 'name') ?? '';
//     phone.value = CacheHelper().getData(key: 'phone') ?? '';
//     email.value = CacheHelper().getData(key: 'email') ?? '';
//     password.value = CacheHelper().getData(key: 'password') ?? '';
//     id.value = CacheHelper().getData(key: 'id') ?? '';
//     imagePath?.value = CacheHelper().getData(key: 'image_path');
//   }
// }
