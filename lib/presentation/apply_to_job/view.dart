import 'dart:io';

import 'package:employee/presentation/apply_to_job/controller.dart';
import 'package:employee/utils/helpers.dart';
import 'package:employee/utils/meta_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/controllers/auth_controller.dart';
import '../../data/models/document_model.dart';

class ApplyToJobView extends GetView<ApplyToJobController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: controller.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DocumentUploadview(),
        _EmployeeInfoWidget(),
        _ReviewInfoWidget(),
      ],
    ));
  }
}

class _ReviewInfoWidget extends GetView<ApplyToJobController> {
  const _ReviewInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Icon(
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Review Information",
                style: TextStyle(color: MetaColors.primaryColor, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 1,
                  backgroundColor: MetaColors.primaryColor.withOpacity(0.2),
                  color: MetaColors.primaryColor,
                ),
              ),
              SizedBox(
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MetaColors.textColor)),
                          ),
                          Icon(Icons.edit, color: MetaColors.textColor)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(
                            '${AuthController.to.userModel.value?.profilePic ?? ''}')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MetaColors.secondaryTextColor),
                            ),
                            Text(
                              '${AuthController.to.userModel.value?.name ?? ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: MetaColors.textColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MetaColors.secondaryTextColor),
                            ),
                            Text(
                              '${AuthController.to.userModel.value?.email ?? ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: MetaColors.textColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MetaColors.secondaryTextColor),
                            ),
                            Text(
                              '${AuthController.to.userModel.value?.phoneNumber ?? ''}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: MetaColors.textColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: MetaColors.textColor.withOpacity(0.7)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text("Employment Information",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MetaColors.textColor)),
                          ),
                          Icon(Icons.edit, color: MetaColors.textColor)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resume',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MetaColors.secondaryTextColor),
                            ),
                            if (controller.jobController.selectedResume.value !=
                                null)
                              Row(
                                children: [
                                  Icon(
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
                                            "${controller.jobController.selectedResume.value!.path.split("/").last}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: MetaColors.textColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            DateFormat('dd/mm/yy').format(
                                              DateTime.now(),
                                            ),
                                            style: TextStyle(
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
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cover Letter',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MetaColors.secondaryTextColor),
                            ),
                            if (controller
                                    .jobController.selectedCoverLetter.value !=
                                null)
                              Row(
                                children: [
                                  Icon(
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
                                            "${controller.jobController.selectedResume.value!.path.split("/").last}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: MetaColors.textColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            DateFormat('dd/mm/yy').format(
                                              DateTime.now(),
                                            ),
                                            style: TextStyle(
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmployeeInfoWidget extends GetView<ApplyToJobController> {
  const _EmployeeInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            controller.gotoDocuments();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MetaColors.textColor,
            size: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apply To ${controller.job.value?.companyName ?? ''}",
                style: GoogleFonts.autourOne(
                    fontSize: 25, color: MetaColors.textColor)),
            SizedBox(
              height: 20,
            ),
            Text(
              "Employment Information",
              style: TextStyle(color: MetaColors.primaryColor, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.25,
                backgroundColor: MetaColors.primaryColor.withOpacity(0.2),
                color: MetaColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Education",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: MetaColors.textColor)),
                                  Text("Included in resume",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: MetaColors.textColor)),
                                ],
                              ),
                            ),
                            Obx(
                              () => _CustomSwitcher(
                                isSelected:
                                    controller.educationIncludedInResume.value!,
                                onTap: () {
                                  controller.educationIncludedInResume.value =
                                      !controller
                                          .educationIncludedInResume.value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (!controller.educationIncludedInResume.value!)
                          Column(
                            children: [
                              CustomTextField(
                                  title: "Name of School",
                                  controller: controller.schoolNameController,
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "Please enter name of school";
                                    }
                                    return null;
                                  },
                                  hint: "Enter name of school"),
                              SizedBox(
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
                              SizedBox(
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
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Work Experience",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: MetaColors.textColor)),
                                  Text("Included in resume",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: MetaColors.textColor)),
                                ],
                              ),
                            ),
                            Obx(
                              () => _CustomSwitcher(
                                isSelected: controller
                                    .experienceIncludedInResume.value!,
                                onTap: () {
                                  controller.experienceIncludedInResume.value =
                                      !controller
                                          .experienceIncludedInResume.value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        if (!controller.experienceIncludedInResume.value!)
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                  title: "Name of Company",
                                  controller: controller.companyNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Company name is required";
                                    }
                                  },
                                  hint: "Enter name of Company"),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                  controller: controller.jobTitleController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Job title is required";
                                    }
                                  },
                                  title: "Job Title",
                                  hint: "Enter job title"),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                  controller: controller.experienceController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Experience is required";
                                    }
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  title: "Total years of experience",
                                  hint: "Enter year of experience"),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
                title: "Proceed",
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.saveEducationAndExperience();
                  }
                }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSwitcher extends StatelessWidget {
  _CustomSwitcher({
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
                  ? MetaColors.textColor.withOpacity(0.7)
                  : MetaColors.textColor,
            )),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedAlign(
            duration: Duration(milliseconds: 300),
            alignment:
                !isSelected ? Alignment.centerLeft : Alignment.centerRight,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: !isSelected
                  ? MetaColors.textColor.withOpacity(0.7)
                  : MetaColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class DocumentUploadview extends GetView<ApplyToJobController> {
  const DocumentUploadview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            controller.endApplication();
          },
          child: Icon(
            Icons.close,
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Uploading of Documents",
                style: TextStyle(color: MetaColors.primaryColor, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.25,
                  backgroundColor: MetaColors.primaryColor.withOpacity(0.2),
                  color: MetaColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Resume",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: MetaColors.textColor)),
                                Text(
                                    "Remember to include your most updated resume",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: MetaColors.secondaryTextColor)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.pickResume();
                            },
                            child: Icon(
                              Icons.add,
                              size: 40,
                              color: MetaColors.textColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: controller.resume
                            .map((e) => DocTile(
                                  data: e!,
                                  onTap: () {
                                    controller.jobController.selectedResume(e);
                                  },
                                  selected: controller
                                          .jobController.selectedResume.value ==
                                      e,
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cover Letter",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: MetaColors.textColor)),
                                Text("Stand out with your cover letter",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: MetaColors.secondaryTextColor)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.pickCoverLetter();
                            },
                            child: Icon(
                              Icons.add,
                              size: 40,
                              color: MetaColors.textColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: controller.coverLetter
                            .map((e) => DocTile(
                                  data: e!,
                                  onTap: () {
                                    controller.jobController
                                        .selectCoverLetter(e);
                                  },
                                  selected: controller.jobController
                                          .selectedCoverLetter.value ==
                                      e,
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
              CustomButton(
                title: "Proceed",
                onTap: () {
                  controller.saveDocumentsAndProceed();
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocTile extends StatelessWidget {
  DocTile({
    super.key,
    required this.data,
    this.selected = false,
    this.onTap,
  });
  DocumentModel data;
  bool selected;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: selected
                ? BoxDecoration(
                    border: Border.all(color: MetaColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: MetaColors.primaryColor)
                : BoxDecoration(
                    border: Border.all(color: MetaColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: MetaColors.primaryColor.withOpacity(0.1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.doc_fill,
                    color: selected ? Colors.white : MetaColors.primaryColor,
                    size: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data!.path.split("/").last}",
                            style: TextStyle(
                                fontSize: 17,
                                color: selected
                                    ? Colors.white
                                    : MetaColors.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateFormat('dd/mm/yy').format(
                              DateTime.now(),
                            ),
                            style: TextStyle(
                              fontSize: 13,
                              color: selected
                                  ? Colors.white
                                  : MetaColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
