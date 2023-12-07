import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../data/controllers/auth_controller.dart';

import '../../../utils/helpers.dart';
import '../../../utils/meta_assets.dart';
import '../../../utils/meta_colors.dart';
import '../controller.dart';

/// ReviewInfoWidget is the widget that shows the review information screen
/// where the user can review the information they have entered and submit
/// their application.
/// It is the final step in the application process.
/// It is used in [ApplyToJobView]
class ReviewInfoWidget extends GetView<ApplyToJobController> {
  const ReviewInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.gotoExperienceAndEducation();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.gotoExperienceAndEducation();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: MetaColors.textColor,
              size: 40,
            ),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Apply To ${controller.job.value?.companyName ?? ''}",
                    style: GoogleFonts.autourOne(
                        fontSize: 25, color: MetaColors.textColor)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Review Information",
                  style: TextStyle(color: Get.theme.primaryColor, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 1,
                    backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
                    color: Get.theme.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(
                              AuthController.to.userModel.value?.profilePic ??
                                  '')),
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
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
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
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
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
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
                              ),
                              Text(
                                AuthController
                                        .to.userModel.value?.phoneNumber ??
                                    '',
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
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
                              ),
                              if (controller
                                      .jobController.selectedResume.value !=
                                  null)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.jobController
                                                  .selectedResume.value!.path
                                                  .split("/")
                                                  .last,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cover Letter',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
                              ),
                              if (controller.jobController.selectedCoverLetter
                                      .value !=
                                  null)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.jobController
                                                  .selectedResume.value!.path
                                                  .split("/")
                                                  .last,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Additional Skills',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MetaColors.secondaryTextColor),
                              ),
                              Wrap(
                                children: [
                                  for (var skill in controller.skills.value!)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: MetaColors.textColor),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            skill,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: MetaColors.textColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  title: "Proceed",
                  onTap: () {
                    controller.saveAndApply();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
