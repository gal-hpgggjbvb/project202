class ProfileInfoModel {
  final int status;
  final String message;
  final User user;

  ProfileInfoModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileInfoModel(
      status: jsonData['status'],
      message: jsonData['message'],
      user: User.fromJson(jsonData['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final String? emailVerifiedAt;
  final String? rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
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

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
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
