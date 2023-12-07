import 'package:employee/data/models/job_model.dart';
import 'package:employee/utils/meta_assets.dart';
import 'package:get/get.dart';

import '../models/document_model.dart';
import '../models/job_application_model.dart';
import '../repository/job_repository.dart';
import 'auth_controller.dart';
import 'shared_pref_controller.dart';

/// JobController is responsible for managing the state of the job application
/// process. It is also responsible for managing the state of the documents
/// that are uploaded by the user.
/// It also loads the list of jobs from the server.[Now Local]
class JobController extends GetxController {
  static JobController get to => Get.find<JobController>();
  final JobRepository _jobRepository = JobRepository(
      preferences: SharedPrefsController.to.preferences!,
      token: AuthController.to.userModel.value!.email);
  Rxn<List<JobApplicationModel>> jobApplications =
      Rxn<List<JobApplicationModel>>();
  Rxn<List<DocumentModel>> documents = Rxn<List<DocumentModel>>([]);
  Rxn<DocumentModel> selectedResume = Rxn<DocumentModel>();
  Rxn<DocumentModel> selectedCoverLetter = Rxn<DocumentModel>();

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

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    jobApplications.value = _jobRepository.getJobApplications();
    documents.value = _jobRepository.getDocuments();
    selectedResume.value = _jobRepository.getSelectedResume();
    selectedCoverLetter.value = _jobRepository.getSelectedCoverLetter();
  }

  void selectResume(DocumentModel document) {
    selectedResume.value = document;
    _jobRepository.saveSelectedResume(document);
  }

  void selectCoverLetter(DocumentModel document) {
    selectedCoverLetter.value = document;
    _jobRepository.saveSelectedCoverLetter(document);
  }

  void applyToJob(JobApplicationModel jobApplication) {
    jobApplications.value = [...?jobApplications.value, jobApplication];
    _jobRepository.saveJobApplications(jobApplications.value!);
  }

  addDocument(DocumentModel document) {
    documents.value = [...?documents.value, document];
    _jobRepository.saveDocuments(documents.value!);
  }

  reset() {
    documents.value = [];
    selectedResume.value = null;
    selectedCoverLetter.value = null;
  }
}
