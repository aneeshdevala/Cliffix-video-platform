import 'package:cliffix/app/modules/loginpage/view/widgets/or_widgets.dart';
import 'package:cliffix/app/modules/loginpage/view_model/api_service/api_service.dart';
import 'package:cliffix/app/modules/loginpage/view_model/log_control.dart';
import 'package:cliffix/app/modules/routes/app_routes.dart';
import 'package:cliffix/app/modules/signup/view_model/api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/loginpage.png'),
                  //  const SizedBox(height: 10),
                  const Text(
                    "Let's you in",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email == value;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Color(0xffF5F5F5),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx((() => TextFormField(
                        obscureText: controller.isPasswordHidden.value,
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordController,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        decoration: InputDecoration(
                            fillColor: const Color(0xffF5F5F5),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
                                },
                                icon: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: controller.isPasswordHidden.value
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Colors.grey,
                                ))),
                      ))),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            fillColor: MaterialStateProperty.all(Colors.red),
                            value: controller.checkBool.value,
                            onChanged: (value) {
                              controller.checkBool.value =
                                  !controller.checkBool.value;
                            }),
                      ),
                      const Text('Remember Me'),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => Get.toNamed(Routes.home),
                          child: const Text('Forgot Password?')),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isloading.value
                          ? CircularProgressIndicator()
                          : controller.callLoginApi();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff6D3AFD),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const OrWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF5F5F5),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08,
                              vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/🦆 icon _google_.png',
                              height: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                // API.googleLogin();
                                controller.glogin();
                              },
                              child: const Text(
                                "continue with Google",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.signup);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xff6D3AFD)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
