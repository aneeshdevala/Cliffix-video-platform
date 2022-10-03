import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cliffix/app/domain/api_endpoints.dart';
import 'package:cliffix/app/modules/signup/model/signup_model.dart';
import 'package:cliffix/app/modules/signup/model/signup_response.dart';
import 'package:cliffix/app/modules/signup/view_model/api_service/dio_service.dart';
import 'package:cliffix/app/modules/signup/view_model/signup_controll.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SignupService {
  Future<SignupResponseModel?> signupUser(SignupModel model) async {
    if (await internetCheckIn()) {
      try {
        final models = model.toJson();
        print(models);
        final response = await DioServies.postFunction(
            url: Url.register, value: model.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          Get.snackbar('Success',
              'Verification message sent to your mail id, Please verify and login ',
              duration: Duration(seconds: 5));
          log(response.data['message']);
          return SignupResponseModel.fromJson(model.toJson());
        } else {
          return SignupResponseModel.fromJson(model.toJson());
        }
      } on TimeoutException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      } on SocketException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          log(e.response!.data['message']);
          log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.message);
        } else if (e.response!.statusCode == 403) {
          Fluttertoast.showToast(msg: e.message);
        } else if (e.response!.statusCode == 400) {
          Fluttertoast.showToast(msg: e.message);
        } else {
          Fluttertoast.showToast(msg: 'something wrong');
        }
      }
    } else {
      log('internet error');
      return SignupResponseModel.fromJson(model.toJson());
    }
    return null;
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
