// import 'package:cliffix/app/modules/onboard/views/onboarding_page.dart';
// import 'package:cliffix/app/modules/splash/views/view.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Get(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         primarySwatch: Colors.blue,
//       ),
//       home: OnBoardings(),
//     );
//   }
// }

import 'package:cliffix/app/modules/loginpage/view/homeviews.dart';
import 'package:cliffix/app/modules/onboard/views/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cliffix",
      initialRoute: "/onboarding",
      getPages: [
        GetPage(
          name: "/onboarding",
          page: () => OnBoardings(),
        ),
        GetPage(
          name: "/login",
          page: () => const LoginPage(),
        ),
      ],
    ),
  );
}
