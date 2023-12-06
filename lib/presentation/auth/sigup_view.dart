import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helpers.dart';
import '../../utils/meta_colors.dart';

class Signupview extends StatelessWidget {
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
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          "Add\nPhoto",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomTextField(
                        title: "Email",
                        hint: "example@mail.com",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: "New Password",
                        obscure: true,
                        hint:
                            "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: "Confirm Password",
                        obscure: true,
                        hint:
                            "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
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
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: MetaColors.primaryColor),
                            ),
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: MetaColors.textColor),
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
                    text: "By creating an account,you agree to Koko's\n",
                    children: [
                      TextSpan(
                        text: "Terms of use",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: MetaColors.primaryColor),
                      ),
                      TextSpan(
                        text: " and ",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: MetaColors.textColor),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: MetaColors.primaryColor),
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
    );
  }
}
