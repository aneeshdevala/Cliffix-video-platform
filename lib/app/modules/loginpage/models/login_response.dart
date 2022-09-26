// import 'dart:convert';

// LoginResponse loginResponseFromJson(String str) =>
//     LoginResponse.fromJson(json.decode(str));

// class LoginResponse {
//   LoginResponse({
//     required this.success,
//     required this.token,
//     required this.user,
//   });
//   late final bool success;
//   late final String token;
//   late final User user;

//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     token = json['token'];
//     user = User.fromJson(json['user']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['token'] = token;
//     _data['user'] = user.toJson();
//     return _data;
//   }
// }

// class User {
//   User({
//     required this.id,
//     required this.email,
//   });
//   late final String id;
//   late final String email;

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['email'] = email;
//     return _data;
//   }
// }
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.token,
    required this.user,
  });
  late final bool success;
  late final String token;
  late final User user;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['token'] = token;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.email,
    required this.id,
    required this.username,
  });
  late final Email email;
  late final String id;
  late final String username;

  User.fromJson(Map<String, dynamic> json) {
    email = Email.fromJson(json['email']);
    id = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email.toJson();
    _data['_id'] = id;
    _data['username'] = username;
    return _data;
  }
}

class Email {
  Email({
    required this.verified,
    required this.address,
  });
  late final bool verified;
  late final String address;

  Email.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['verified'] = verified;
    _data['address'] = address;
    return _data;
  }
}
