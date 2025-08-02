import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/lang/lang_controller.dart';
import 'package:project2/custom_widgets/lang_listtile.dart';
import 'package:project2/functions/add_space.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  bool langValue1 = false;
  bool langValue2 = false;

  late LangController langController;

  @override
  void initState() {
    langController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(20),
            Center(
              child: Text(
                "change".tr,
                style: TextStyle(
                    fontFamily: "Satoshi",
                    color: context.theme.colorScheme.onSecondary,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            addVerticalSpace(30),

            ///language 1
            CheckboxListTile(
                title: Text(
                  "English",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.onSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                value: langValue1,
                onChanged: (val) {
                  langValue1 = val!;
                  setState(() {});
                }),

            ///language 2
            CheckboxListTile(
                title: Text(
                  "Arabic",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.onSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                value: langValue2,
                onChanged: (val) {
                  langValue2 = val!;
                  setState(() {});
                }),

            LangListTile(
              image: 'English_language.svg.png',
              language: 'device'.tr,
              icon:
                  CacheHelper().getData(key: 'language') == null ? true : false,
              onTap: () {
                langController.deviceLang();
              },
            ),
            LangListTile(
              image: 'english.png',
              language: 'english'.tr,
              icon: CacheHelper().getData(key: 'language') == 'en' ? true : false,
              onTap: () {
                langController.changeLang('en');
              },
            ),
            LangListTile(
              image: 'arabian-flag-large.jpg',
              language: 'arabic'.tr,
              icon: CacheHelper().getData(key: 'language') == 'ar' ? true : false,
              onTap: () {
                langController.changeLang('ar');
              },
            ),
            TextButton(
                onPressed: () {
                  print(CacheHelper().getData(key: 'language'));
                },
                child: Text('print language')),
          ],
        ),
      ),
    );
  }
}
