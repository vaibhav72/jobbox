import 'dart:io';

import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/presentation/home/controller.dart';

import 'package:employee/utils/helpers.dart';
import 'package:employee/utils/meta_assets.dart';
import 'package:employee/utils/meta_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:employee/utils/meta_colors.dart';

class ProfileWidget extends GetView<HomeController> {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Your Profile",
              style: GoogleFonts.autourOne(
                  color: Get.theme.colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MetaAssets.personIcon,
                height: 20,
                colorFilter: ColorFilter.mode(
                    Get.theme.colorScheme.secondary, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AuthController.to.userModel.value?.profilePic !=
                                      null
                                  ? FileImage(File(AuthController
                                          .to.userModel.value?.profilePic ??
                                      ''))
                                  : null),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Get.theme.colorScheme.secondary,
                            radius: 15,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Contact Info",
                    style: MetaStyles.profileFieldTitleStyle,
                  )),
                  SvgPicture.asset(
                    MetaAssets.pencilIcon,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        Get.theme.colorScheme.secondary, BlendMode.srcIn),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: MetaStyles.profileFieldSubtTitleStyle,
                    ),
                    Text(AuthController.to.userModel.value?.name ?? '',
                        style: MetaStyles.profileFieldValueStyle)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: MetaStyles.profileFieldSubtTitleStyle,
                    ),
                    Text(AuthController.to.userModel.value?.email ?? '',
                        style: MetaStyles.profileFieldValueStyle)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: MetaStyles.profileFieldSubtTitleStyle,
                    ),
                    Text(
                      AuthController.to.userModel.value?.phoneNumber ?? '',
                      style: MetaStyles.profileFieldValueStyle,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(color: Get.theme.colorScheme.secondary.withOpacity(0.7)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Employment Information",
                        style: MetaStyles.profileFieldTitleStyle),
                  ),
                  SvgPicture.asset(
                    MetaAssets.pencilIcon,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        Get.theme.colorScheme.secondary, BlendMode.srcIn),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resume',
                      style: MetaStyles.profileFieldSubtTitleStyle,
                    ),
                    if (JobController.to.selectedResume.value != null)
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.doc_fill,
                            color: Get.theme.colorScheme.secondary,
                            size: 40,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${JobController.to.selectedResume.value?.path.split('/').last}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Get.theme.colorScheme.secondary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yy').format(JobController
                                        .to.selectedResume.value!.date),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Get.theme.colorScheme.secondary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cover Letter',
                      style: MetaStyles.profileFieldSubtTitleStyle,
                    ),
                    if (JobController.to.selectedCoverLetter.value != null)
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.doc_fill,
                            color: Get.theme.colorScheme.secondary,
                            size: 40,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${JobController.to.selectedCoverLetter.value?.path.split('/').last}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Get.theme.colorScheme.secondary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yy').format(
                                      JobController.to.selectedCoverLetter.value
                                              ?.date ??
                                          DateTime.now(),
                                    ),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Get.theme.colorScheme.secondary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Log out",
                onTap: () {
                  controller.selectedBottomIndex.value = 0;
                  Get.delete<JobController>();
                  Get.delete<HomeController>();
                  AuthController.to.logout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
