import 'package:cliffix/app/modules/signup/view_model/signup_controll.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class SignUPBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupController(),
    );
  }
}
