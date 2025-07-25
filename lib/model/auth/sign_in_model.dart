
class SignInModel {

  final int status;

  final String token;

  SignInModel({required this.status, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
        status: jsonData['status'],
        token: jsonData['token']);
  }
}

// class SignInModel {
//
//   final String message;
//
//   final String token;
//
//   SignInModel({required this.message, required this.token});
//
//   factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
//     return SignInModel(
//         message: jsonData['message'],
//         token: jsonData['access_token']);
//   }
// }
