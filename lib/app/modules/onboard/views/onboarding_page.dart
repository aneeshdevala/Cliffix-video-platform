import 'package:cliffix/app/modules/loginpage/view/homeviews.dart';
import 'package:cliffix/app/modules/onboard/controller/onboradingcon.dart';
import 'package:cliffix/app/util/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardings extends StatelessWidget {
  OnBoardings({Key? key}) : super(key: key);
  final controller = OnboardingConrrolletr();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onboardingPages.length,
                itemBuilder: ((context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          controller.onboardingPages[index].image.toString()),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Text(
                          controller.onboardingPages[index].description
                              .toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                })),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                  children: List.generate(
                controller.onboardingPages.length,
                (index) => Obx(() {
                  return Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey),
                  );
                }),
              )),
            ),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.04,
                child: FloatingActionButton(
                    onPressed: controller.forwardAction,
                    elevation: 0,
                    child: Obx(() {
                      return Text(controller.isLastPage ? 'start' : 'Next');
                    })))
          ],
        ),
      ),
    );
  }
}
