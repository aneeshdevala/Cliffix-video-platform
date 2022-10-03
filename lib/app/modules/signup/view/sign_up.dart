import 'package:cliffix/app/modules/loginpage/view_model/log_control.dart';
import 'package:cliffix/app/modules/routes/app_routes.dart';
import 'package:cliffix/app/modules/signup/view_model/signup_controll.dart';
import 'package:cliffix/app/util/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../loginpage/view/widgets/or_widgets.dart';

class SignUpView extends GetView<SignupController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/loginpage.png',
                  height: 200,
                ),
                const Text(
                  'Create your Account',
                  textAlign: TextAlign.center,
                  // style: textStyle,
                ),
                size20,
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    controller.email == value;
                  },
                  validator: (value) {
                    return controller.validateEmail(value!);
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(Icons.mail,
                        color: Color.fromARGB(255, 5, 5, 5)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                size20,
                Obx(
                  () => TextFormField(
                    obscureText: controller.isPasswordHidden.value,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(Icons.fingerprint,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
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
                  ),
                ),
                size20,
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.isPasswordHidden.value,
                  onSaved: (value) {
                    controller.confirm = value!;
                  },
                  validator: (value) {
                    return controller.passwordConfirm();
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    labelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: 'Confirm password',
                    hintStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(Icons.fingerprint,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          fillColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 0, 0)),
                          value: controller.ckeckBool.value,
                          onChanged: (value) {
                            controller.ckeckBool.value =
                                !controller.ckeckBool.value;
                          }),
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    signupController.isloading()
                        ? const CircularProgressIndicator()
                        : controller.callSignupApi();
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
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const OrWidget(),
                size20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png', height: 50),
                    Image.asset('assets/facebook.png', height: 50),
                  ],
                ),
                size40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have a Account?"),
                    width10,
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.login),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff6D3AFD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
