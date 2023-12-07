import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/data/models/job_application_model.dart';
import 'package:employee/presentation/apply_to_job/binding.dart';
import 'package:employee/presentation/apply_to_job/view.dart';
import 'package:employee/utils/helpers.dart';

import 'package:get/get.dart';

import '../../data/models/job_model.dart';

class HomeController extends GetxController {
  JobController get _jobController => JobController.to;
  List<JobModel> get recentJobs => _jobController.jobList;
  List<JobModel> get nearbyJobs => _jobController.jobList;
  List<JobApplicationModel> get appliedJobs =>
      _jobController.jobApplications.value ?? [];
  Rxn<int> selectedBottomIndex = Rxn<int>(0);

  showJobDetails(JobModel job) {
    Get.bottomSheet(
      ApplySheet(
        job: job,
        onApplyPressed: () {
          Get.off(() => const ApplyToJobView(),
              binding: ApplyToJobBinding(), arguments: job);
        },
      ),
      isScrollControlled: true,
    );
  }
}
