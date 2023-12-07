import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helpers.dart';
import 'controller.dart';

///The login view widget
///This is the first page of the AuthView
///This is where the user logs in
///It contains a form with two textfields and a button

class Loginview extends GetView<AuthFlowController> {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.loading.value!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: controller.loginKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const LogoWidget(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              CustomTextField(
                                title: "Email",
                                validator: (p0) {
                                  if (!p0!.isEmail) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                                controller: controller.emailSignInController,
                                hint: "example@mail.com",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                title: "Password",
                                controller: controller.passwordSignInController,
                                validator: (p0) {
                                  if (p0!.length < 8) {
                                    return "Password must be at least 8 characters long";
                                  }
                                  return null;
                                },
                                obscure: true,
                                hint:
                                    "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Get.theme.colorScheme.secondary),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomButton(
                                title: "Login",
                                onTap: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  children: [
                                    TextSpan(
                                      text: "Sign Up ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          controller.pageController
                                              .jumpToPage(1);
                                        },
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Get.theme.primaryColor),
                                    ),
                                  ],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Get.theme.colorScheme.secondary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
