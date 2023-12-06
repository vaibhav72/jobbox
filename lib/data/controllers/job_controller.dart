import 'package:employee/data/models/job_model.dart';
import 'package:employee/utils/meta_assets.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  static JobController get to => Get.find<JobController>();
  List<JobModel> jobList = [
    JobModel(
        id: 1,
        jobTitle: "Senior Frontend Developer",
        location: "Central Singapore",
        companyName: "SLACK",
        logo: MetaAssets.slackLogo,
        salaryRange: "\$ 5,000 - \$ 7,000",
        requirements:
            '''- 2+ years of experience designing and building software applications''',
        description:
            '''We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as Requirements''',
        postedAt: DateTime.now()),
    JobModel(
        id: 2,
        jobTitle: "Senior Frontend Developer",
        location: "Central Singapore",
        companyName: "SLACK",
        logo: MetaAssets.slackLogo,
        salaryRange: "\$ 5,000 - \$ 7,000",
        requirements:
            '''- 2+ years of experience designing and building software applications''',
        description:
            '''We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as Requirements''',
        postedAt: DateTime.now()),
    JobModel(
        id: 3,
        jobTitle: "Senior Frontend Developer",
        location: "Central Singapore",
        companyName: "SLACK",
        logo: MetaAssets.slackLogo,
        salaryRange: "\$ 5,000 - \$ 7,000",
        requirements:
            '''- 2+ years of experience designing and building software applications''',
        description:
            '''We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as Requirements''',
        postedAt: DateTime.now()),
  ];
}
