import 'package:cliffix/app/modules/onboard/controller/onboradingcon.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingConrrolletr());
  }
}
