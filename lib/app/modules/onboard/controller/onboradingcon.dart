import 'package:cliffix/app/modules/onboard/model/onboardingmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/utils.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OnboardingConrrolletr extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();
  forwardAction() {
    if (isLastPage) {
      //homepage
    } else {
      pageController.nextPage(
        duration: 1.seconds,
        curve: Curves.ease,
      );
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        description: 'Watch intresting videos from around the world',
        image: 'assets/Onboarding1.png'),
    OnboardingInfo(
        description: 'Watch intresting videos easily from your smartphone.',
        image: 'assets/onboarding2.png'),
    OnboardingInfo(
        description: 'Let’s explore videos around the world with Clifix now!',
        image: 'assets/onboarding3.png')
  ];
}
