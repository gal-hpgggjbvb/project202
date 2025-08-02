import 'package:get/get.dart';

import '../controller/lang/lang_controller.dart';
import '../controller/theme_controller.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(LangController());
  }
}