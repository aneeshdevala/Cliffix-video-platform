import 'dart:developer';

import 'package:cliffix/app/modules/signup/model/signup_model.dart';
import 'package:cliffix/app/modules/signup/model/signup_response.dart';
import 'package:cliffix/app/modules/signup/view_model/api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../loginpage/view/loging_screen.dart';

class SignupController extends GetxController {
  // final getStorage = GetStorage();
  var isPasswordHidden = true.obs;
  var ckeckBool = false.obs;
  var isloading = false.obs;
  var isAPIcallProcess = false.obs;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      confirmPasswordController;
  var email = '';
  var password = '';
  var confirm = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be 6 characters";
    } else {
      return null;
    }
  }

  String? passwordConfirm() {
    if (passwordController.text == confirmPasswordController.text) {
      return null;
    }
    return "Password doesn't match";
  }

  // bool passwordConfirmed() {
  //   if (passwordController.text == confirmPasswordController.text) {
  //     return true;
  //   }
  //   return false;
  // }

  // void checkLogin() {
  //   final isValid = signupFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   signupFormKey.currentState!.save();
  //   Get.toNamed(Routes.dashboardPage);
  //   getStorage.write("key", 1);
  // }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void isloadingfalse() {
    bool isloading = false;
  }

  void callSignupApi() async {
    final data = SignupModel(
        email: emailController.text, password: passwordController.text);
    SignupResponseModel? response = await SignupService().signupUser(data);
    if (response != null) {
      log(response.toString());
      if (response.success == true) {
        Get.defaultDialog(
            title: 'Account created',
            content:
                const Text('Confirm mail sent to YOur Account plz Check it'),
            onConfirm: () {
              Get.to(() => const LoginPage());
            },
            onCancel: () {
              Get.back();
            });
      }
    } else {
      log(response.toString());
    }
  }
}
