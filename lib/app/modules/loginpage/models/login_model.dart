class LoginResponsemodel {
  LoginResponsemodel({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  LoginResponsemodel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
