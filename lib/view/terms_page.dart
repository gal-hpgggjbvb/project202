import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: const Text("Terms & Privacy Policy" , style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: "1. Terms of Service"),
                    SectionText(
                      text:
                          "By using this app, you agree to comply with our terms and conditions. "
                          "You are responsible for maintaining the confidentiality of your account and password...",
                    ),
                    SizedBox(height: 20),

                    SectionHeader(title: "2. User Responsibilities"),
                    SectionText(
                      text:
                          "You agree not to misuse the app in any way, including but not limited to fraudulent activity, abuse, or spreading misinformation.",
                    ),
                    SizedBox(height: 20),

                    SectionHeader(title: "3. Privacy Policy"),
                    SectionText(
                      text:
                          "We respect your privacy. Any personal data collected will be stored securely and never sold or shared with third parties without your consent.",
                    ),
                    SizedBox(height: 20),

                    SectionHeader(title: "4. Data Usage"),
                    SectionText(
                      text:
                          "We may collect usage statistics to improve the app. This data is anonymized and used for analysis only.",
                    ),
                    SizedBox(height: 20),

                    SectionHeader(title: "5. Updates to Terms"),
                    SectionText(
                      text:
                          "These terms may be updated from time to time. You will be notified of significant changes within the app or via email.",
                    ),
                    SizedBox(height: 20),
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
                      activeColor: Colors.orange,
                      onChanged: (val) {
                        setState(() => accepted = val ?? false);
                         // accepted = val ?? false ;
                      },
                    ),
                     Expanded(
                      child: Text(
                        // accepted ? "You already accepted the terms." :
                        acceptedTerms ?
                        "You already accepted the terms." :
                        "I have read and accept the Terms and Privacy Policy.",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                          acceptedTerms || accepted ? Colors.green :
                          Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: accepted
                      ? () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.scale,
                      title: "Accepted!",
                      desc: "Thank you for agreeing to the terms.",
                      btnOkOnPress: () {
                        Get.back();
                      },
                    ).show();
                    CacheHelper().saveData(key: 'acceptedTerms', value: true) ;
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class TermsPage extends StatelessWidget {
//   const TermsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Terms & Privacy Policy"),
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               SectionHeader(title: "1. Terms of Service"),
//               SectionText(
//                 text:
//                 "By using this app, you agree to comply with our terms and conditions. "
//                     "You are responsible for maintaining the confidentiality of your account and password...",
//               ),
//               SizedBox(height: 20),
//
//               SectionHeader(title: "2. User Responsibilities"),
//               SectionText(
//                 text:
//                 "You agree not to misuse the app in any way, including but not limited to fraudulent activity, abuse, or spreading misinformation.",
//               ),
//               SizedBox(height: 20),
//
//               SectionHeader(title: "3. Privacy Policy"),
//               SectionText(
//                 text:
//                 "We respect your privacy. Any personal data collected will be stored securely and never sold or shared with third parties without your consent.",
//               ),
//               SizedBox(height: 20),
//
//               SectionHeader(title: "4. Data Usage"),
//               SectionText(
//                 text:
//                 "We may collect usage statistics to improve the app. This data is anonymized and used for analysis only.",
//               ),
//               SizedBox(height: 20),
//
//               SectionHeader(title: "5. Updates to Terms"),
//               SectionText(
//                 text:
//                 "These terms may be updated from time to time. You will be notified of significant changes within the app or via email.",
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
