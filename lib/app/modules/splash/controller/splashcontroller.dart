import 'dart:async';

import 'package:cliffix/app/modules/onboard/views/onboarding_page.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SpalashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 2),
      () => Get.off(
        OnBoardings(),
      ),
    );
  }
}
