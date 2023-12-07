import 'dart:io';

import 'package:employee/utils/meta_styles.dart';
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Get.theme.colorScheme.secondary,
              size: 30,
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
                    style: MetaStyles.pageTitleStyle),
                const SizedBox(
                  height: 20,
                ),
                Text("Review Information", style: MetaStyles.pageSubtitleStyle),
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
                            Expanded(
                              child: Text("Contact Info",
                                  style: MetaStyles.fieldTitleStyle),
                            ),
                            SvgPicture.asset(
                              MetaAssets.pencilIcon,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  Get.theme.colorScheme.secondary,
                                  BlendMode.srcIn),
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
                              Text(
                                'Full Name',
                                style: MetaStyles.profileFieldSubtTitleStyle,
                              ),
                              Text(
                                AuthController.to.userModel.value?.name ?? '',
                                style: MetaStyles.profileFieldValueStyle,
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
                              Text(
                                'Email',
                                style: MetaStyles.profileFieldSubtTitleStyle,
                              ),
                              Text(
                                AuthController.to.userModel.value?.email ?? '',
                                style: MetaStyles.profileFieldValueStyle,
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
                              Text(
                                'Mobile Number',
                                style: MetaStyles.profileFieldSubtTitleStyle,
                              ),
                              Text(
                                AuthController
                                        .to.userModel.value?.phoneNumber ??
                                    '',
                                style: MetaStyles.profileFieldValueStyle,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                            color: Get.theme.colorScheme.secondary
                                .withOpacity(0.7)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text("Employment Information",
                                  style: MetaStyles.fieldTitleStyle),
                            ),
                            SvgPicture.asset(
                              MetaAssets.pencilIcon,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  Get.theme.colorScheme.secondary,
                                  BlendMode.srcIn),
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
                              if (controller
                                      .jobController.selectedResume.value !=
                                  null)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.jobController
                                                  .selectedResume.value!.path
                                                  .split("/")
                                                  .last,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Get.theme.colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yy').format(
                                                DateTime.now(),
                                              ),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Get.theme.colorScheme
                                                    .secondary,
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
                              if (controller.jobController.selectedCoverLetter
                                      .value !=
                                  null)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .jobController
                                                  .selectedCoverLetter
                                                  .value!
                                                  .path
                                                  .split("/")
                                                  .last,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Get.theme.colorScheme
                                                      .secondary,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yy').format(
                                                DateTime.now(),
                                              ),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Get.theme.colorScheme
                                                    .secondary,
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
                              Text('Additional Skills',
                                  style: MetaStyles.profileFieldSubtTitleStyle),
                              Wrap(
                                children: [
                                  for (var skill in controller.skills.value!)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Get.theme.colorScheme
                                                    .secondary),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            skill,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Get.theme.colorScheme
                                                    .secondary,
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
