import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helpers.dart';
import '../../utils/meta_colors.dart';
import 'controller.dart';

class Signupview extends GetView<AuthFlowController> {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: GoogleFonts.autourOne(fontSize: 20, color: Colors.black),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(
        () => controller.loading.value!
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.registerKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Obx(
                                    () => controller.profilePic.value != null
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundImage: FileImage(File(
                                                controller
                                                    .profilePic.value!.path)),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Center(
                                                child: Text(
                                              "Add\nPhoto",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16),
                                            )),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                CustomTextField(
                                  controller: controller.emailSignUpController,
                                  title: "Email",
                                  validator: (p0) {
                                    if (!p0!.isEmail) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                  hint: "example@mail.com",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  title: "Name",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                  controller: controller.nameSignUpController,
                                  hint: "Enter name",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  title: "Phone Number",
                                  controller: controller.phoneSignUpController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  hint: "Enter phone",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  title: "New Password",
                                  controller:
                                      controller.passwordSignUpController,
                                  obscure: true,
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return "Password must be at least 8 characters";
                                    }
                                    return null;
                                  },
                                  hint:
                                      "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  title: "Confirm Password",
                                  obscure: true,
                                  validator: (value) {
                                    if (value !=
                                        controller
                                            .passwordSignUpController.text) {
                                      return "Password does not match";
                                    }
                                    return null;
                                  },
                                  hint:
                                      "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                CustomButton(
                                  onTap: () {
                                    controller.register();
                                  },
                                  title: "Create Account",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Already have an account? ",
                                    children: [
                                      TextSpan(
                                        text: "Log In ",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            controller.pageController
                                                .jumpToPage(0);
                                          },
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: MetaColors.primaryColor),
                                      ),
                                    ],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: MetaColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  "By creating an account,you agree to Koko's\n",
                              children: [
                                TextSpan(
                                  text: "Terms of use",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: MetaColors.primaryColor),
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: MetaColors.textColor),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: MetaColors.primaryColor),
                                ),
                              ],
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: MetaColors.textColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
