import 'package:cliffix/app/modules/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cliffix",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
