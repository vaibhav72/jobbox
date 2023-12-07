import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/models/job_model.dart';
import 'meta_colors.dart';

///Helper functions and widgets used across the app
///

///A custom form decoration for all formfields across the app to maintain consistency
InputDecoration formDecoration({String? hint, bool? obscure, Widget? suffix}) {
  return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Get.theme.colorScheme.secondary.withOpacity(0.7)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary)));
}

///A custom textfield for all textfields across the app to maintain consistency
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
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Get.theme.colorScheme.secondary),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          cursorColor: Get.theme.colorScheme.secondary,
          obscureText: obscure ?? false,
          decoration: formDecoration(hint: hint, obscure: obscure),
        )
      ],
    );
  }
}

///A logo widget for the app splash screen
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
                color: Get.theme.primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.w500),
            children: [
          TextSpan(
            text: "box",
            style: GoogleFonts.autourOne(
                color: Get.theme.colorScheme.secondary,
                fontSize: 50,
                fontWeight: FontWeight.w500),
          )
        ]));
  }
}

///a custom button for all buttons across the app to maintain consistency
// ignore: must_be_immutable
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
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
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

///A custom snackbar for all snackbar across the app to maintain consistency
showSnackBar(String message, {bool isError = true}) {
  Get.snackbar(isError ? "Error" : "Success", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white);
}

///ApplySheet view for viewing the job
// ignore: must_be_immutable
class ApplySheet extends StatelessWidget {
  ApplySheet({
    super.key,
    required this.job,
    required this.onApplyPressed,
  });
  JobModel job;
  void Function() onApplyPressed;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        builder: (context, scrollController) {
          return Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Stack(children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Image.asset(
                        job.logo,
                        height: 90,
                        width: 90,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        job.companyName,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Get.theme.primaryColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.jobTitle,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Get.theme.colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.location,
                        style: const TextStyle(
                            fontSize: 16, color: MetaColors.secondaryTextColor),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Job Description",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Get.theme.colorScheme.secondary)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.description,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Requirements",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Get.theme.colorScheme.secondary)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.requirements,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Get.theme.colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Salary Range",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Get.theme.colorScheme.secondary)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          job.salaryRange,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Get.theme.colorScheme.secondary),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Posted At",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Get.theme.colorScheme.secondary)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd MMM , yyyy').format(job.postedAt),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Get.theme.colorScheme.secondary),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.white.withOpacity(0.7),
                            Colors.white,
                            Colors.white,
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Padding(
                        padding: const EdgeInsets.all(16)
                            .copyWith(top: 50, bottom: 30),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomButton(
                              title: "Apply this job",
                              onTap: onApplyPressed,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.2)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.bookmark_outline_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}

///a custom switcher widget to adhere to the design

// ignore: must_be_immutable
class CustomSwitcher extends StatelessWidget {
  CustomSwitcher({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  bool isSelected;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: !isSelected
                  ? Get.theme.colorScheme.secondary.withOpacity(0.7)
                  : Get.theme.colorScheme.secondary,
            )),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment:
                !isSelected ? Alignment.centerLeft : Alignment.centerRight,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: !isSelected
                  ? Get.theme.colorScheme.secondary.withOpacity(0.7)
                  : Get.theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
