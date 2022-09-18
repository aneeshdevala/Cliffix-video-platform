import 'package:cliffix/app/modules/splash/controller/splashcontroller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpalashController>(
      () => SpalashController(),
    );
  }
}
