import 'package:cliffix/app/modules/loginpage/models/login_model.dart';
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

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      isApiCallProcess.value = true;
      LoginRegisteremodel model = LoginRegisteremodel(
        email: emailController.text,
        password: passwordController.text,
      );
      ApiServicelog.login(model).then((response) {
        if (response) {
          print(response);
          Get.offAllNamed(Routes.home);
        } else {
          Get.snackbar("Error", "Something went wrong",
              snackPosition: SnackPosition.TOP);
        }
      });
    }
    // loginFormKey.currentState!.save();
    // Get.offAllNamed(Routes.home);

    // getStorage.write('id', 1);
    // getStorage.write("name", emailController.text);
  }
}
