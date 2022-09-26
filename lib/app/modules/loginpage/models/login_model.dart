// class LoginResponsemodel {
//   LoginResponsemodel({
//     required this.email,
//     required this.password,
//   });
//   late final String email;
//   late final String password;

//   LoginResponsemodel.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['email'] = email;
//     data['password'] = password;
//     return data;
//   }
// }

import 'dart:convert';

LoginResponsemodel loginRequestModelFromJson(String str) =>
    LoginResponsemodel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginResponsemodel data) =>
    json.encode(data.toJson());

class LoginResponsemodel {
  LoginResponsemodel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory LoginResponsemodel.fromJson(Map<String, dynamic> json) =>
      LoginResponsemodel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
