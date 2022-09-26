import 'dart:convert';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/shared_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var user = http.Client();
  static Future<bool> login(LoginResponse model) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var url = Uri.http(Url.baseUrl, Url.login);
    var response = await user.post(url,
        headers: headers, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      //shared pref
      await SharedService.saveLoginDetails(
          loginResponseFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }
}
