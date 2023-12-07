// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/data/models/document_model.dart';
import 'package:employee/data/models/job_application_model.dart';
import 'package:employee/data/models/job_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:employee/utils/helpers.dart';

class ApplyToJobController extends GetxController {
  static ApplyToJobController get to => Get.find<ApplyToJobController>();
  List<DocumentModel?> get resume => jobController.documents.value!
      .where((element) => element.isResume)
      .toList();
  List<DocumentModel?> get coverLetter => jobController.documents.value!
      .where((element) => !element.isResume)
      .toList();
  Rxn<JobModel> job = Rxn<JobModel>();
  PageController pageController = PageController();
  Rxn<bool> educationIncludedInResume = Rxn<bool>(false);
  Rxn<bool> experienceIncludedInResume = Rxn<bool>(false);
  JobController get jobController => JobController.to;
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController yearOfGraduationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Rxn<JobApplicationModel> jobApplication = Rxn<JobApplicationModel>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      job.value = Get.arguments as JobModel;
    }
  }

  @override
  void onClose() {
    super.onClose();
    schoolNameController.dispose();
    degreeController.dispose();
    yearOfGraduationController.dispose();
    experienceController.dispose();
    companyNameController.dispose();
    jobTitleController.dispose();
  }

  void pickResume() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        jobController.addDocument(DocumentModel(
            path: result.files.first.path!,
            date: DateTime.now(),
            isResume: true));
      } else {
        showSnackBar("No file selected");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void pickCoverLetter() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        jobController.addDocument(DocumentModel(
            path: result.files.first.path!,
            date: DateTime.now(),
            isResume: false));
      } else {
        showSnackBar("No file selected");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  saveDocumentsAndProceed() {
    if (jobController.selectedResume.value == null) {
      showSnackBar("Please select a resume");
      return;
    }
    if (jobController.selectedCoverLetter.value == null) {
      showSnackBar("Please select a cover letter");
      return;
    }
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  saveEducationAndExperience() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    jobApplication.value = JobApplicationModel(
      id: "",
      jobID: job.value!.id.toString(),
      job: job.value!,
      resume: jobController.selectedResume.value,
      coverLetter: jobController.selectedCoverLetter.value,
      educationIncludedInResume: educationIncludedInResume.value!,
      yearOfGraduation: yearOfGraduationController.text,
      experienceIncludedInResume: experienceIncludedInResume.value!,
      schoolName: schoolNameController.text,
      degree: degreeController.text,
      date: DateTime.now(),
      companyName: companyNameController.text,
      jobTitle: jobTitleController.text,
      yearsOfExperience: experienceController.text,
    );
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  saveAndApply() async {
    try {
      jobController.applyToJob(jobApplication.value!);

      Get.back();
      showSnackBar("Applied successfully", isError: false);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  gotoExperienceAndEducation() {
    pageController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  gotoDocuments() {
    jobApplication.value = null;
    schoolNameController.text = "";
    degreeController.text = "";
    yearOfGraduationController.text = "";
    experienceController.text = "";
    companyNameController.text = "";
    jobTitleController.text = "";
    pageController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  endApplication() {
    jobApplication.value = null;
    schoolNameController.text = "";
    degreeController.text = "";
    yearOfGraduationController.text = "";
    experienceController.text = "";
    companyNameController.text = "";
    jobTitleController.text = "";
    jobController.selectedResume.value = null;
    jobController.selectedCoverLetter.value = null;
    jobController.documents.value = [];
    Get.back();
  }
}
