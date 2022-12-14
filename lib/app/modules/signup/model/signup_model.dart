// class SignupModel {
//   SignupModel({
//     required this.email,
//     required this.password,
//   });
//   late final String email;
//   late final String password;

//   SignupModel.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['email'] = email;
//     _data['password'] = password;
//     return _data;
//   }
// }

class SignupModel {
  SignupModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
