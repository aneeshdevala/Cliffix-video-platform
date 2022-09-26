import 'package:cliffix/app/modules/homepage/homeview/home_page.dart';
import 'package:cliffix/app/modules/loginpage/bindings/login_bindings.dart';
import 'package:cliffix/app/modules/loginpage/view/loging_screen.dart';
import 'package:cliffix/app/modules/onboard/bindings/onbordi_binding.dart';
import 'package:cliffix/app/modules/onboard/views/onboarding_page.dart';
import 'package:cliffix/app/modules/routes/app_routes.dart';
import 'package:cliffix/app/modules/signup/view/sign_up.dart';
import 'package:cliffix/app/modules/splash/bindings/splashbinding.dart';
import 'package:cliffix/app/modules/splash/views/view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.onboarding;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.onboarding,
        page: () => const OnBoardings(),
        binding: OnBoardingBinding()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpPage(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBindings()),
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}
