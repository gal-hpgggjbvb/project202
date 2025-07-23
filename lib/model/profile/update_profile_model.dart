class UpdateProfileModel {
  final int status;
  final String message;
  final Data data;

  UpdateProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateProfileModel(
      status: jsonData['status'],
      message: jsonData['message'],
      data: Data.fromJson(jsonData['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': data.toJson(),
    };
  }
}

class Data {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final String? emailVerifiedAt;
  final String? rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    this.emailVerifiedAt,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> jsonData) {
    return Data(
      id: jsonData['id'],
      name: jsonData['name'],
      phone: jsonData['phone'],
      email: jsonData['email'],
      role: jsonData['role'],
      emailVerifiedAt: jsonData['email_verified_at'],
      rememberToken: jsonData['remember_token'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'email_verified_at': emailVerifiedAt,
      'remember_token': rememberToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
