import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/helpers.dart';
import '../../utils/meta_colors.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomTextField(
                title: "Email",
                hint: "example@mail.com",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: "Password",
                obscure: true,
                hint: "\u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022 \u2022",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: MetaColors.textColor),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                title: "Login",
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign Up ",
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
    );
  }
}
