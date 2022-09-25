import 'package:cliffix/app/modules/loginpage/view/widgets/or_widgets.dart';
import 'package:cliffix/app/modules/signup/controlls/signup_controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpPage extends GetView<SignupController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
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
                'Create Your Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color(0xffF5F5F5),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: controller.isPasswordHidden.value,
                onSaved: (value) {
                  controller.confirm = value!;
                },
                validator: (value) {
                  return controller.passwordConfirm();
                },
                decoration: const InputDecoration(
                  fillColor: Color(0xffF5F5F5),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.checkLogin();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff6D3AFD),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const OrWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffF5F5F5),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
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
                        const Text(
                          "continue with Google",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      )),
    );
  }
}
