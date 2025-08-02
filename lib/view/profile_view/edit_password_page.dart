import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/profile_controller/edit_password_controller.dart';

import '../../controller/auth/sign_status.dart';
import '../../custom_widgets/custom_textformfield.dart';
import '../../functions/add_space.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  late EditPasswordController editPasswordController;

  @override
  void initState() {
    editPasswordController =
        Get.put(EditPasswordController(DioConsumer(dio: Dio())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        // title: Text(
        //   "Edit Password",
        //   style: TextStyle(
        //     fontFamily: "Satoshi",
        //     color: context.theme.colorScheme.primary,
        //     fontSize: 20,
        //     fontWeight: FontWeight.w500, // typing style
        //   ),
        // ),
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
              key: editPasswordController.editPasswordFormKey,
              child: Column(
                children: [
                  addVerticalSpace(20),
                  Text(
                    "change_password".tr,
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.onSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpace(20),

                  ///todo old password field
                  CustomTextFormField(
                    controller: editPasswordController.oldPasswordController,
                    textInputType: TextInputType.text,
                    hintText: 'old_password'.tr,
                    isPassword: true,
                    isPrefixIcon: true,
                    icon: Icons.lock_open_outlined,
                  ),
                  addVerticalSpace(20),

                  ///todo new password field
                  CustomTextFormField(
                    controller: editPasswordController.newPasswordController,
                    textInputType: TextInputType.text,
                    hintText: 'new_password'.tr,
                    isPassword: true,
                    isPrefixIcon: true,
                    icon: Icons.lock_outline,
                  ),
                  addVerticalSpace(20),

                  ///todo confirm password
                  CustomTextFormField(
                    controller:
                        editPasswordController.confirmNewPasswordController,
                    textInputType: TextInputType.text,
                    hintText: 'confirm_new_password'.tr,
                    isPassword: true,
                    isPrefixIcon: true,
                    icon: Icons.lock_outline,
                    compareWithController:
                        editPasswordController.newPasswordController,
                  ),
                  addVerticalSpace(100),

                  ElevatedButton.icon(
                    // onPressed: controller.saveProfile,
                    onPressed: () async {
                      if (editPasswordController
                          .editPasswordFormKey.currentState!
                          .validate()) {
                        await editPasswordController.editPassword();
                      }
                    },
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: Text(
                      "save_changes".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<SignStatus>(builder: (controller) {
              if (controller.loadingProgress) {
                return LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.orangeAccent, size: 100.0);
              } else {
                return const Text('');
              }
            }),
          ],
        ),
      ),
    );
  }
}
