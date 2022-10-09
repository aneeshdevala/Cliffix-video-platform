
import 'package:cliffix/app/modules/navigation_screen/view_model/navcontroller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class NavBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavController(),
    );
  }
}
