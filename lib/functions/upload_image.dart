// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future uploadImage(XFile image) async {
//   return MultipartFile.fromFile(image.path ,
//     filename : image.path.split('/').last) ;
//
// }

import 'dart:io';
import 'package:dio/dio.dart';

Future<void> uploadFileImage(File imageFile) async {
  String fileName = imageFile.path.split('/').last;

  FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(
      imageFile.path,
      filename: fileName,
      // contentType is optional unless your API requires it
      // contentType: MediaType('image', 'jpeg'), // use this if needed
    ),
  });

  // try {
  //   Response response = await Dio().post(
  //     'https://yourapi.com/upload', // 🔁 replace with your real endpoint
  //     data: formData,
  //     options: Options(
  //       headers: {
  //         // Add your headers if needed (e.g., auth token)
  //         // 'Authorization': 'Bearer your_token',
  //       },
  //     ),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("✅ Upload successful: ${response.data}");
  //   } else {
  //     print("⚠️ Upload failed: ${response.statusCode}");
  //   }
  // } catch (e) {
  //   print("❌ Upload error: $e");
  // }
}

// final picker = ImagePicker();
// final picked = await picker.pickImage(source: ImageSource.gallery);
// if (picked != null) {
// File file = File(picked.path);
// await uploadFileImage(file);
// }
