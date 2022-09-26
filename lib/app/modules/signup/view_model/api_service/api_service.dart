import 'dart:convert';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:cliffix/app/modules/signup/model/signup_response.dart';
import 'package:cliffix/app/modules/signup/view/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var user = http.Client();
  static Future<SignupResponse> signup(SignupResponse model) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var url = Uri.http(Url.baseUrl, Url.register);
    var response = await user.post(url,
        headers: headers, body: jsonEncode(model.toJson()));
    return SignupResponse(
        success: jsonDecode(response.body)['success'],
        token: jsonDecode(response.body)['token'],
        user: (jsonDecode(response.body)['user']));
  }
}
