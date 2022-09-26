import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:cliffix/app/modules/signup/model/signup_model.dart';
import 'package:cliffix/app/modules/signup/view_model/api_service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';

class SignupController extends GetxController {
  final getStorage = GetStorage();
  var isPasswordHidden = true.obs;
  var ckeckBool = false.obs;
  var isApicalProcess = false.obs;
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
  //   Get.toNamed(Routes.home);
  //   getStorage.write("key", 1);
  // }
  void checkLogin() {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else if (!isValid) {
      isApicalProcess.value = true;
      SignupModel model = SignupModel(
        email: Email(verified: true, address: email).toString(),
        password: password,
      );
      ApiService.signup(model).then((response) {
        if (response.user != null) {
          Get.offAllNamed(Routes.home);
          Get.snackbar("done", "Regisstration successfull,",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", "Regisstration failed,",
              snackPosition: SnackPosition.BOTTOM);
        }
      });
    }
    // signupFormKey.currentState!.save();
    // Get.offAllNamed(Routes.home);

    // getStorage.write('id', 1);
    // getStorage.write("name", emailController.text);
  }
}
