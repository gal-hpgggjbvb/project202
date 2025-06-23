class SignUpErrorModel {
  final int status;

  // final Map<String, dynamic> message;
  final String phone;

  final String email;

  SignUpErrorModel(
      {required this.status, required this.phone, required this.email});

  factory SignUpErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpErrorModel(
        status: jsonData['status'],
        phone: jsonData['message']['phone'][0] ?? '',
        email: jsonData['message']['email'][0] ?? '' );
  }
}
