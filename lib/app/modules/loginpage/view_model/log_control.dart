import 'package:cliffix/app/modules/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();
  var isPasswordHidden = true.obs;
  var checkBool = false.obs;
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
    if (value.length < 6) {
      return "Password must be 6 characters";
    } else {
      return null;
    }
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else if (!isValid) {
      //   var isAPIcallProcess = true;
    }
    loginFormKey.currentState!.save();
    Get.offAllNamed(Routes.home);

    getStorage.write('id', 1);
    getStorage.write("name", emailController.text);
  }
}
