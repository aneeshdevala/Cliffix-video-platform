import 'package:cliffix/app/modules/homepage/homeview/home_page.dart';
import 'package:cliffix/app/modules/loginpage/view/loging_screen.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/shared_service.dart';
import 'package:cliffix/app/modules/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Widget defaulttHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();
  if (result) {
    defaulttHome = const HomePage();
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cliffix",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
