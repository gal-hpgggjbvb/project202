
class SignUpModel {

  final int status;

  final String token;

  SignUpModel({required this.status, required this.token});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        status: jsonData['status'],
        token: jsonData['token']);
  }
}
