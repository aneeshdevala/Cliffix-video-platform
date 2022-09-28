import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cliffix/app/modules/loginpage/models/login_model.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/api_service.dart';
import 'package:cliffix/app/modules/routes/app_routes.dart';
import 'package:cliffix/app/modules/signup/view_model/api_service/api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();
  var isPasswordHidden = true.obs;
  var checkBool = false.obs;
  var isApiCallProcess = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must 8 characters and include special characters ";
    } else {
      return null;
    }
  }

  callLoginApi() async {
    final data = LoginRegisteremodel(
        email: emailController.text, password: passwordController.text);
    LoginResponse? response = await API().loginUser(data);
    if (response != null) {
      log(response.user!.email.toString());
      if (response.success!) {
        storedataLogin(response);
        Get.offAllNamed(Routes.home);
      } else {
        print(response.user.toString());
      }
    }
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  storedataLogin(LoginResponse response) async {
    await storage.write(key: 'token', value: response.token);
    await storage.write(key: 'user', value: response.user!.email.address);
  }
}
