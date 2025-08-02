import 'package:get/get.dart';

class Languages implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'ar': {
          ///sign in page
          'lets':'هيا نقوم بتسجيل الدخول',
          'welcome':'مرحبا مجددا.',
          'sign_email':'اكتب حسابك هنا',
          'sign_password':'اكتب كلمة المرور',
          'sign_as':'المتابعة كـ: ',
          'normal':'مستخدم عادي',
          'delivery_man':'عامل توصيل',
          'sign_in':'تسجيل الدخول',
          'have_account':'ليس لديك حساب ؟',
          'register':'سجل هنا',

          ///sign up page
          'hello':'مرحبا..',
          'make_account':'دعنا نقوم بإنشاء حساب جديد',
          'sign_name':'اكتب اسمك هنا',
          'sign_phone':'اكتب رقمك هنا',
          'sign_confirm_password':'تأكيد كلمة المرور',
          'sign_up':'تسجيل الدخول',
          'already_have':'لديك حساب بالفعل ؟',

          ///menu
          'profile': 'الملف الشخصي',
          'main': 'الصفحة الرئيسية',
          'notification': 'الإشعارات',
          'settings': 'الإعدادات',

          ///profile
          'name':'الاسم',
          'id':'الرقم',
          'phone':'رقم الهاتف',
          'email':'الحساب',
          'password':'كلمة المرور',
          'edit_profile':'تعديل الملف الشخصي',
          'not_set':'لا يوجد',

          ///edit profile
          'remove_photo':'إزالة الصورة',
          'delete_photo':'إزالة الصورة؟',
          'sure_delete_photo':'هل أنت متأكد أنك تريد إزالة الصورة؟',
          'yes':'نعم',
          // 'cancel':'كلا',
          'change_password':'تغيير كلمة المرور',
          'save_changes':'حفظ التغييرات',
          ///edit password
          'edit_password':'تغيير كلمة المرور',
          'old_password':'كلمة المرور القديمة',
          'new_password':'كلمة المرور الجديدة',
          'confirm_new_password':'تأكيد كلمة المرور الجدبدة',

          ///user page
          'want something': 'هل تريد شيئا بسرعة ؟',
          'just': 'فقط أضف طلب و اترك البافي لنا.',
          'add': 'أضف طلب',
          'show': 'عرض طلباتي',

          ///bottomsheet
          'make': 'إضافة طلب',
          'what': 'ماذا تريد',
          'pickup': 'من أين',
          'drop': 'إلى أين',
          'type': 'اكتب هنا',

          ///user & delivery man orders page
          'pending':'قيد الإنتظار',
          'in_progress':'قيد التوصبل',
          'completed':'تم التسليم',
          'order_id1':'رقم الطلب:\n ',
          'order_name1':'      اسم الطلب: ',
          'status1':'  الحالة:\n  ',
          'order_id2':'رقم الطلب:        ',
          'order_name2':'اسم الطلب:       ',
          'status2':'الحالة:             ',
          'source':'المصدر:            ',
          'destination':'الوجهة:            ',
          'created':'وقت الإنشاء:     ',
          'updated':'وقت التحديث:   ',
          'source1':'من:  ',
          'destination1':'إلى:  ',

          'edit':'تعديل',
          'edit_order':'تعديل الطلب ',
          'delete_order':'حذف الطلب الذي رقمه ',
          'question_mark':' ؟ ',
          'delete':'حذف',
          'delivery_man_id':'رقم عامل التوصبل:        ',
          'delivery_man_name':'اسم عامل التوصيل:       ',
          'delivery_man_phone':'هاتف عامل التوصيل:     ',
          'no_orders':'لا يوجد طلبات حاليا..',

          'available_orders':'طلبات متاحة',
          'in_progress_orders':'طلبات قيد التوصيل',
          'completed_orders':'طلبات تم توصيلها',
          'pick_order':'اختيار الطلب ',
          'complete_order':'إكمال الطلب ',
          'cancel_order':'إلغاء الطلب ',
          'no_av_orders':'لا طلبات متاحة حاليا..',
          'no_pr_orders':'لا طلبات قيد التوصيل..',
          'no_co_orders':'لا طلبات تم توصيلها..',
          'customer_id':'رقم صاحب الطلب:     ',
          'customer_name':'اسم صاحب الطلب:     ',
          'customer_phone':'هاتف صاحب الطلب:   ',
          // 'pick_order_d':'اختيار الطلب ',
          // 'complete_order_d':'Complete Order',
          // 'cancel_order_d':'Cancel Order',


          ///settings
          'dark': 'الوضع المظلم',
          'change_language': 'تغيير اللغة',
          'notifications': 'الإشعارات',
          'terms': 'الشروط و السياسة',
          'contact': 'تواصل معنا',
          'sign_out': 'تسجيل الخروج',
          'delete_account': 'حذف الحساب',
          'version': 'الإصدار 1.0.0',
          'contact_us': 'تواصل معنا على :',
          'copy': 'نسخ الإيميل',
          'close': 'إغلاق',
          'sign_sure':'هل أنت متأكد أنك تريد تسجيل الخروج؟ \n ستحتاج لتسجيل الدخول مجددا.',
          'cancel':'إلغاء',
          'delete_mark':'حذف الحساب!',
          'delete_sure':'هل أنت متأكد أنك تريد حذف الحساب؟ \n كل بياناتك سيتم حذفها.',

          ///language page
          'change':'اللغات',
          'device':'لغة الجهاز',
          'english':'الإنكليزية',
          'arabic':'العربية',

          ///terms page
          'terms_of_service':'1. شروط الخدمة',
          'terms1': 'باستخدامك هذا التطبيق، فإنك توافق على الالتزام بشروطنا وأحكامنا. أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور الخاصة بك...',
          'user_responsibilities':'2. مسؤوليات المستخدم',
          'user1':"أنت توافق على عدم إساءة استخدام التطبيق بأي شكل من الأشكال، بما في ذلك على سبيل المثال لا الحصر الأنشطة الاحتيالية، أو الإساءة، أو نشر المعلومات المضللة.",
          'privacy_policy':'3. سياسة الخصوصية',
          'policy1':"نحن نحترم خصوصيتك. سيتم تخزين أي بيانات شخصية تم جمعها بشكل آمن ولن يتم بيعها أو مشاركتها مع أطراف ثالثة دون موافقتك.",
          'data_usage':'4. استخدام البيانات',
          'data1':"قد نجمع إحصاءات الاستخدام لتحسين التطبيق. هذه البيانات مجهولة الهوية وتستخدم للتحليل فقط.",
          'update_terms':'5. تحديث للشروط',
          'update1':"قد يتم تحديث هذه الشروط من وقت لآخر. سيتم إبلاغك بالتغييرات الهامة داخل التطبيق أو عبر البريد الإلكتروني.",
          'read_check1':'لقد قرأت وأوافق على الشروط وسياسة الخصوصية.',
          'read_check2':'لقد قمت بالفعل بقبول الشروط.',
          'accept':'القبول و المتابعة',
          'accepted':'تم القبول!',
          'thanks':'شكراً لموافقتك على الشروط.',
          'ok':'حسنا',


        },
        'en': {
          ///sign in page
          'lets':'Let s Sign You In',
          'welcome':'Welcome Back.',
          'sign_email':'Your Email',
          'sign_password':'Your Password',
          'sign_as':'Signin as :',
          'normal':'Normal User',
          'delivery_man':'Delivery Man',
          'sign_in':'Sign In',
          'have_account':'Don t Have an Account ?',
          'register':'Register',

          ///sign up page
          'hello':'Hello..',
          'make_account':'Let s Make a New Account',
          'sign_name':'Your Name',
          'sign_phone':'Your Phone Number',
          'sign_confirm_password':'Confirm Your Password',
          'sign_up':'SignUp',
          'already_have':'Already Have an Account ?',

          ///menu
          'profile': 'Profile',
          'main': 'Main Page',
          'notification': 'Notifications',
          'settings': 'Settings',

          ///profile
          'name':'Name',
          'id':'ID',
          'phone':'Phone',
          'email':'Email',
          'password':'Password',
          'edit_profile':'Edit Profile',
          'not_set':'Not Set',

          ///edit profile
          'remove_photo':'Remove Photo',
          'delete_photo':'Delete Photo?',
          'sure_delete_photo':'Are you sure you want to remove your profile image?',
          'yes':'Yes',
          // 'cancel':'Cancel',
          'change_password':'Change Password',
          'save_changes':'Save Changes',
          ///edit password
          'edit_password':'Cahnge Password',
          'old_password':'Old Password',
          'new_password':'New Password',
          'confirm_new_password':'Confirm New Password',

          ///user page
          'want something': 'Want Something Fast ?',
          'just': 'Just add an Order and Leave it to Us.',
          'add': ' add order',
          'show': ' show my orders',

          ///bottomsheet
          'make': 'Make an Order',
          'what': 'what do you want to deliver',
          'pickup': 'pickup location',
          'drop': 'drop location',
          'type': 'type here',

          ///user orders page
          'pending':'Pending',
          'in_progress':'in Progress',
          'completed':'Completed',
          'order_id1':'OrderID: \n',
          'order_name1':'   Order Name: ',
          'status1':'Status: \n',
          'order_id2':'OrderId :           ',
          'order_name2':'OrderName :     ',
          'status2':'Status :              ',
          'source':'Source :             ',
          'destination':'Destination :      ',
          'created':'Createdat :        ',
          'updated':'Updatedat :       ',
          'source1':'   Source: ',
          'destination1':'   Destination:  ',

          'edit':'Edit',
          'edit_order':'Edit Order ',
          'delete_order':'Delete Order with ID ',
          'question_mark':' ? ',
          'delete':'Delete',
          'delivery_man_id':'DeliveryMan ID :                    ',
          'delivery_man_name':'DeliveryMan Name :              ',
          'delivery_man_phone':'DeliveryMan Phone :             ',
          'no_orders':'No Orders Yet..',

          'available_orders':'available\n  orders',
          'in_progress_orders':'in progress\n    orders',
          'completed_orders':'completed\n    orders',
          'pick_order':'Pick Delivery',
          'complete_order':'Complete Order',
          'cancel_order':'Cancel Order',
          'no_av_orders':'No available orders yet..',
          'no_pr_orders':'No in progress orders..',
          'no_co_orders':'No completed orders..',

          'customer_id':'Customer ID :              ',
          'customer_name':'Customer Name :        ',
          'customer_phone':'Customer Phone :        ',
          // 'pick_order_d':'Pick Order ',
          // 'complete_order_d':'Complete Order',
          // 'cancel_order_d':'Cancel Order',

          ///settings
          'dark': 'Dark Mode',
          'change_language': 'Change Language',
          'notifications': 'Notifications',
          'terms': 'Terms & Policy',
          'contact': 'Contact Us',
          'sign_out': 'Sign Out',
          'delete_account': 'Delete Account',
          'version': 'Version 1.0.0',
          'contact_us': 'Contact Us at :',
          'copy': 'Copy Email',
          'close': 'Close',
          'sign_sure':'Are you sure you want to sign out? \n you will need to sign in again.',
          'cancel':'Cancel',
          'delete_mark':'Delete Account!',
          'delete_sure':'Are you sure you want to delete your account ? \n All your data wilol be deleted.',
          ///language page
          'change':'Languages',
          'device':'Device Language',
          'english':'English',
          'arabic':'Arabic',

          ///terms page
          'terms_of_service':'1. Terms of Service',
          'terms1': "By using this app, you agree to comply with our terms and conditions. "
              "You are responsible for maintaining the confidentiality of your account and password...",
          'user_responsibilities':'2. User Responsibilities',
          'user1':"You agree not to misuse the app in any way, including but not limited to fraudulent activity, abuse, or spreading misinformation.",
          'privacy_policy':'3. Privacy Policy',
          'policy1':"We respect your privacy. Any personal data collected will be stored securely and never sold or shared with third parties without your consent.",
          'data_usage':'4. Data Usage',
          'data1':"We may collect usage statistics to improve the app. This data is anonymized and used for analysis only.",
          'update_terms':'5. Update to Terms',
          'update1':"These terms may be updated from time to time. You will be notified of significant changes within the app or via email.",
          'read_check1':'I have read and accept the Terms and Privacy Policy.',
          'read_check2':'You already accepted the terms.',
          'accept':'Accept and Continue',
          'accepted':'Accepted!',
          'thanks':'Thank you for agreeing to the terms.',
          'ok':'Ok',

        }
      };
}
