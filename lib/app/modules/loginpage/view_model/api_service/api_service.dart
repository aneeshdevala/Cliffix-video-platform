import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/loginpage/models/login_model.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../signup/view_model/api_service/dio_service.dart';

class LoginApiService {
  Future<LoginResponse?> loginUser(LoginRegisteremodel model) async {
    if (await internetCheckIn()) {
      try {
        final b = model.toJson();
        log(b.toString());
        final response = await DioServies.postFunction(
            url: Url.login, value: model.toJson());

        if (response.statusCode == 200) {
          log('login successfull');
          final data = response.data;
          return LoginResponse.fromJson(data);
        } else {
          return loginResponseFromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 401) {
          log(e.response!.data['message'].toString());
          log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseFromJson(e.response!.data);
        } else if (e.response?.statusCode == 403) {
          // log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseFromJson(e.response!.data);
        } else {
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseFromJson(e.response!.data);
        }
        // final errorrMessage = DioExceptions.fromDioError(e);
        // log(errorrMessage.toString());
      } on TimeoutException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
        return loginResponseFromJson(e.toString());
      } on SocketException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
        return loginResponseFromJson(e.toString());
      }
    } else {
      log('Internet error');
      return loginResponseFromJson('''{"hai":"sss"}''');
    } // return null;
  }

  internetCheckIn() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('internet connected');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'internet not connected');
    }
  }
}
