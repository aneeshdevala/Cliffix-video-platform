import 'dart:async';
import 'dart:io';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/loginpage/models/login_model.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class API {
  final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  Future<LoginResponse?> loginUser(LoginRegisteremodel model) async {
    try {
      final re = await checkIn();
      if (re) {
        Response response = await dio.post(Url.login, data: model.toJson());
        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          Fluttertoast.showToast(msg: 'Successfully Login');
          return LoginResponse.fromJson(response.data);
        } else if (response.statusCode == 401) {
          Fluttertoast.showToast(msg: 'Bed CREADINTEIL');
        } else if (response.statusCode == 409) {
          Fluttertoast.showToast(msg: 'Already have an account in this mail');
        } else if (response.statusCode == 400) {
          Fluttertoast.showToast(msg: 'validation error');
        } else {
          return null;
        }
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
    } on SocketException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          return LoginResponse(success: true);
        }
        return LoginResponse.fromJson(e.response!.data);
      } else {
        return LoginResponse(success: true);
      }
    }
    return null;
  }

  checkIn() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Got Internet');
    } else {
      Fluttertoast.showToast(msg: 'no internet pls check It');
    }
    return result;
  }
}
