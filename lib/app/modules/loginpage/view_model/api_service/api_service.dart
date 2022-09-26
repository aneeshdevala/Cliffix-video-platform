import 'dart:convert';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/loginpage/models/login_model.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/shared_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiServicelog {
  static var user = http.Client();
  static Future<bool> login(LoginResponsemodel loginmodel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(Url.login);
    print(loginmodel.toJson());
    var response = await user.post(
      url,
      // headers: headers,
      body:
          //  {"email": "ikkus0027@gmail.com", "password": "Ikkus@0027"}
          // jsonEncode(loginmodel.toJson()),
          loginmodel.toJson(),
    );

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //shared pref
      print(response.body);

      await SharedService.saveLoginDetails(
          loginResponseFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }
}
