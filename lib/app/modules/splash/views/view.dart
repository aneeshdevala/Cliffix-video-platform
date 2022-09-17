import 'package:cliffix/app/modules/splash/controller/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SpalashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardController = Get.put(SpalashController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 7, 31),
      body: Center(
        child: Image.asset('assets/cliffixlogp.png'),
      ),
    );
  }
}
