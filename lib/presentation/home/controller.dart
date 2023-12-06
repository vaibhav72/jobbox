import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/presentation/apply_to_job/binding.dart';
import 'package:employee/presentation/apply_to_job/view.dart';
import 'package:employee/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/job_model.dart';
import '../../utils/meta_colors.dart';

class HomeController extends GetxController {
  JobController get _jobController => JobController.to;
  List<JobModel> get recentJobs => _jobController.jobList;
  List<JobModel> get nearbyJobs => _jobController.jobList;
  List<JobModel> get appliedJobs => _jobController.jobList;
  Rxn<int> selectedBottomIndex = Rxn<int>(0);

  showJobDetails(JobModel job) {
    Get.bottomSheet(
      _ApplySheet(
        job: job,
        onApplyPressed: () {
          Get.to(() => ApplyToJobView(),
              binding: ApplyToJobBinding(), arguments: job);
        },
      ),
      isScrollControlled: true,
    );
  }
}

class _ApplySheet extends StatelessWidget {
  _ApplySheet({
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
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Image.asset(
                        job.logo,
                        height: 90,
                        width: 90,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        job.companyName,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: MetaColors.primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.jobTitle,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: MetaColors.textColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.location,
                        style: TextStyle(
                            fontSize: 16, color: MetaColors.secondaryTextColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Job Description",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: MetaColors.textColor)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.description,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: MetaColors.textColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Requirements",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: MetaColors.textColor)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.requirements,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: MetaColors.textColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Salary Range",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: MetaColors.textColor)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          job.salaryRange,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MetaColors.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Posted At",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: MetaColors.textColor)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd MMM , yyyy').format(job.postedAt),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MetaColors.textColor),
                        ),
                      ),
                      SizedBox(
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
                    Spacer(),
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
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.bookmark_outline_outlined,
                                  color: MetaColors.primaryColor,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      MetaColors.primaryColor.withOpacity(0.2)),
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
