import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/functions/add_space.dart';

import '../cache/cache_helper.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool accepted = false;
  bool acceptedTerms = false;

  @override
  void initState() {
    super.initState();
    acceptedTerms = CacheHelper().getData(key: 'acceptedTerms') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms & Privacy Policy",
          style: TextStyle(
              fontFamily: "Satoshi",
              color: context.theme.colorScheme.onSecondary,
              fontSize: 21,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: "1. Terms of Service"),
                    const SectionText(
                      text:
                          "By using this app, you agree to comply with our terms and conditions. "
                          "You are responsible for maintaining the confidentiality of your account and password...",
                    ),
                    addVerticalSpace(20),
                    const SectionHeader(title: "2. User Responsibilities"),
                    const SectionText(
                      text:
                          "You agree not to misuse the app in any way, including but not limited to fraudulent activity, abuse, or spreading misinformation.",
                    ),
                    addVerticalSpace(20),
                    const SectionHeader(title: "3. Privacy Policy"),
                    const SectionText(
                      text:
                          "We respect your privacy. Any personal data collected will be stored securely and never sold or shared with third parties without your consent.",
                    ),
                    addVerticalSpace(20),
                    const SectionHeader(title: "4. Data Usage"),
                    const SectionText(
                      text:
                          "We may collect usage statistics to improve the app. This data is anonymized and used for analysis only.",
                    ),
                    addVerticalSpace(20),
                    const SectionHeader(title: "5. Updates to Terms"),
                    const SectionText(
                      text:
                          "These terms may be updated from time to time. You will be notified of significant changes within the app or via email.",
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            ),
          ),
          //todo Checkbox + Button Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: acceptedTerms ? acceptedTerms : accepted,
                      activeColor: Colors.green,
                      checkColor: Colors.blue,
                      onChanged: (val) {
                        setState(() => accepted = val ?? false);
                        // accepted = val ?? false ;
                      },
                    ),
                    Expanded(
                      child: Text(
                        // accepted ? "You already accepted the terms." :
                        acceptedTerms
                            ? "You already accepted the terms."
                            : "I have read and accept the Terms and Privacy Policy.",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 14,
                          color: acceptedTerms || accepted
                              ? Colors.green
                              // : Colors.black87,
                              : context.theme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                ElevatedButton(
                  onPressed: accepted
                      ? () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.scale,
                            dismissOnTouchOutside: false,
                            title: "Accepted!",
                            desc: "Thank you for agreeing to the terms.",
                            titleTextStyle: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500, // typing style
                            ),
                            descTextStyle: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 17,
                              fontWeight: FontWeight.w500, // typing style
                            ),
                            dialogBackgroundColor:
                                context.theme.primaryColorLight,
                            dialogBorderRadius: BorderRadius.circular(30),
                            btnOkText: 'Ok',
                            buttonsTextStyle: const TextStyle(
                              fontFamily: "Satoshi",
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500, // typing style
                            ),
                            btnOkOnPress: () {
                              Get.back();
                            },
                          ).show();
                          CacheHelper()
                              .saveData(key: 'acceptedTerms', value: true);
                        }
                      : null, // Disabled if not accepted
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                  ),
                  child: const Text(
                    "Accept and Continue",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                addVerticalSpace(15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, height: 1.5),
    );
  }
}
