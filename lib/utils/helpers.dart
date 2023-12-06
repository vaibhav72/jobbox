import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'meta_colors.dart';

InputDecoration formDecoration({String? hint, bool? obscure, Widget? suffix}) {
  return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: MetaColors.textColor.withOpacity(0.7)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MetaColors.textColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MetaColors.textColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MetaColors.textColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MetaColors.textColor)));
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.obscure,
    this.suffix,
    this.controller,
    this.validator,
    this.inputFormatters,
  });
  String title;
  String hint;
  bool? obscure;
  Widget? suffix;
  TextEditingController? controller;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: MetaColors.textColor),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          cursorColor: MetaColors.textColor,
          obscureText: obscure ?? false,
          decoration: formDecoration(hint: hint, obscure: obscure),
        )
      ],
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "Job",
            style: GoogleFonts.autourOne(
                color: MetaColors.primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.w500),
            children: [
          TextSpan(
            text: "box",
            style: GoogleFonts.autourOne(
                color: MetaColors.textColor,
                fontSize: 50,
                fontWeight: FontWeight.w500),
          )
        ]));
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    this.onTap,
  });
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: MetaColors.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

showSnackBar(String message, {bool isError = true}) {
  Get.snackbar(isError ? "Error" : "Success", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white);
}
