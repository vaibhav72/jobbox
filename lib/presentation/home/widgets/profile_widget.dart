import 'dart:io';

import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/data/controllers/job_controller.dart';

import 'package:employee/utils/helpers.dart';
import 'package:employee/utils/meta_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:employee/utils/meta_colors.dart';

class ProfileWidget extends StatelessWidget {
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
                  color: MetaColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MetaAssets.personIcon,
                height: 20,
                colorFilter: const ColorFilter.mode(
                    MetaColors.textColor, BlendMode.srcIn),
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
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: MetaColors.textColor,
                            radius: 15,
                            child: Icon(
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
                  const Expanded(
                    child: Text("Contact Info",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MetaColors.textColor)),
                  ),
                  SvgPicture.asset(
                    MetaAssets.pencilIcon,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                        MetaColors.textColor, BlendMode.srcIn),
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
                    const Text(
                      'Full Name',
                      style: TextStyle(
                          fontSize: 16, color: MetaColors.secondaryTextColor),
                    ),
                    Text(
                      AuthController.to.userModel.value?.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: MetaColors.textColor),
                    )
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
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16, color: MetaColors.secondaryTextColor),
                    ),
                    Text(
                      AuthController.to.userModel.value?.email ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: MetaColors.textColor),
                    )
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
                    const Text(
                      'Mobile Number',
                      style: TextStyle(
                          fontSize: 16, color: MetaColors.secondaryTextColor),
                    ),
                    Text(
                      AuthController.to.userModel.value?.phoneNumber ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: MetaColors.textColor),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(color: MetaColors.textColor.withOpacity(0.7)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text("Employment Information",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MetaColors.textColor)),
                  ),
                  SvgPicture.asset(
                    MetaAssets.pencilIcon,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                        MetaColors.textColor, BlendMode.srcIn),
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
                    const Text(
                      'Resume',
                      style: TextStyle(
                          fontSize: 16, color: MetaColors.secondaryTextColor),
                    ),
                    if (JobController.to.selectedResume.value != null)
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.doc_fill,
                            color: MetaColors.textColor,
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
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MetaColors.textColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yy').format(JobController
                                        .to.selectedResume.value!.date),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: MetaColors.textColor,
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
                    const Text(
                      'Cover Letter',
                      style: TextStyle(
                          fontSize: 16, color: MetaColors.secondaryTextColor),
                    ),
                    if (JobController.to.selectedCoverLetter.value != null)
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.doc_fill,
                            color: MetaColors.textColor,
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
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MetaColors.textColor,
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
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: MetaColors.textColor,
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
