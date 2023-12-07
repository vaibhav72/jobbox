import 'package:employee/presentation/apply_to_job/controller.dart';
import 'package:employee/presentation/apply_to_job/widgets/review_info_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/document_view.dart';
import 'widgets/employment_info_view.dart';

/// This is the main view for the apply to job flow which is a page view with three pages
/// 1. DocumentUploadview
/// 2. EmployeeInfoWidget
/// 3. ReviewInfoWidget
/// The page view is controlled by the [ApplyToJobController]
/// The [ApplyToJobController] is injected into this view by the [ApplyToJobBinding]
class ApplyToJobView extends GetView<ApplyToJobController> {
  const ApplyToJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        DocumentUploadview(),
        EmployeeInfoWidget(),
        ReviewInfoWidget(),
      ],
    ));
  }
}
