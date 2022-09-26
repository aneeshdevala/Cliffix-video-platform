import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

class SignupResponse {
  SignupResponse({
    required this.success,
    required this.token,
    required this.user,
  });
  late final bool success;
  late final String token;
  late final User? user;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['token'] = token;
    data['user'] = user!.toJson();
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.email,
  });
  late final String id;
  late final String email;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    return data;
  }
}
