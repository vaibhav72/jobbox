import 'package:employee/utils/meta_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/helpers.dart';

import '../controller.dart';

///The EmployeeInfoWidget is a widget that displays the employment information of the user.
///It is the second step in the application process.
///It is used in the [ApplyToJobView].

class EmployeeInfoWidget extends GetView<ApplyToJobController> {
  const EmployeeInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.gotoDocuments();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.gotoDocuments();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Get.theme.colorScheme.secondary,
              size: 30,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Apply To ${controller.job.value?.companyName ?? ''}",
                  style: MetaStyles.pageTitleStyle),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Employment Information",
                style: MetaStyles.pageSubtitleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
                  color: Get.theme.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                  () {
                    return SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Education",
                                          style: MetaStyles.fieldTitleStyle),
                                      Text("Included in resume",
                                          style: MetaStyles.fieldSubtitleStyle),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => CustomSwitcher(
                                    isSelected: controller
                                        .educationIncludedInResume.value!,
                                    onTap: () {
                                      controller
                                              .educationIncludedInResume.value =
                                          !controller
                                              .educationIncludedInResume.value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (!controller.educationIncludedInResume.value!)
                              Column(
                                children: [
                                  CustomTextField(
                                      title: "Name of School",
                                      controller:
                                          controller.schoolNameController,
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Please enter name of school";
                                        }
                                        return null;
                                      },
                                      hint: "Enter name of school"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                      title: "Course of Study",
                                      controller: controller.degreeController,
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Please enter course of study";
                                        }
                                        return null;
                                      },
                                      hint: "Enter name of course"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                      controller:
                                          controller.yearOfGraduationController,
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Please enter year of graduation";
                                        }
                                        return null;
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      title: "Year graduated",
                                      hint: "Enter year graduated"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Work Experience",
                                          style: MetaStyles.fieldTitleStyle),
                                      Text("Included in resume",
                                          style: MetaStyles.fieldSubtitleStyle),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => CustomSwitcher(
                                    isSelected: controller
                                        .experienceIncludedInResume.value!,
                                    onTap: () {
                                      controller.experienceIncludedInResume
                                              .value =
                                          !controller.experienceIncludedInResume
                                              .value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            if (!controller.experienceIncludedInResume.value!)
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                      title: "Name of Company",
                                      controller:
                                          controller.companyNameController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Company name is required";
                                        }
                                        return null;
                                      },
                                      hint: "Enter name of Company"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                      controller: controller.jobTitleController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Job title is required";
                                        }
                                        return null;
                                      },
                                      title: "Job Title",
                                      hint: "Enter job title"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                      controller:
                                          controller.experienceController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Experience is required";
                                        }
                                        return null;
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      title: "Total years of experience",
                                      hint: "Enter year of experience"),
                                ],
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Additional Skills",
                                  style: MetaStyles.fieldTitleStyle),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Get.dialog(Center(
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextField(
                                            controller:
                                                controller.skillController,
                                            title: "Skill",
                                            hint: "Enter Skill"),
                                      ],
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomButton(
                                          title: "Add",
                                          onTap: () {
                                            controller.addSkill();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color:
                                            Get.theme.colorScheme.secondary)),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      controller.skills.value!.isNotEmpty
                                          ? 0
                                          : 16),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            !controller.skills.value!.isNotEmpty
                                                ? 0
                                                : 8),
                                        child: const Icon(Icons.search),
                                      ),
                                      Expanded(
                                          child: Obx(
                                        () => Wrap(
                                          children: controller.skills.value!
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Chip(
                                                      deleteIcon: const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                      backgroundColor: Get
                                                          .theme.primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                      label: Text(
                                                        e,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onDeleted: () {
                                                        controller
                                                            .removeSkill(e);
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                  title: "Proceed",
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.saveEducationAndExperience();
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
