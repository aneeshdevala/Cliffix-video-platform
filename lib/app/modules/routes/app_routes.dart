import 'package:cliffix/app/modules/splash/views/view.dart';

abstract class Routes {
  Routes._();
  static const splash = Paths.splash;
  static const onboarding = Paths.onboarding;
  static const login = Paths.login;
  static const home = Paths.home;
}

abstract class Paths {
  Paths._();
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const home = '/home';
}
