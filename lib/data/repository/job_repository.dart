import 'package:employee/data/models/document_model.dart';
import 'package:employee/data/models/job_application_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobRepository {
  late SharedPreferences preferences;
  String? token;
  JobRepository() {
    getInstance();
  }

  getInstance() async {
    preferences = await SharedPreferences.getInstance();
    token = preferences.getString('token');
  }

  List<DocumentModel> getDocuments() {
    try {
      List<String>? data = preferences.getStringList('$token-documents');
      if (data != null) {
        return data.map((e) => DocumentModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  saveDocuments(List<DocumentModel> data) async {
    try {
      await preferences.setStringList(
          '$token-documents', data.map((e) => e.toJson()).toList());
    } catch (e) {
      rethrow;
    }
  }

  getSelectedResume() {
    try {
      String? data = preferences.getString('$token-selected-resume');
      if (data != null) {
        return DocumentModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  saveSelectedResume(DocumentModel? data) async {
    try {
      if (data != null) {
        await preferences.setString('$token-selected-resume', data.toJson());
      } else {
        await preferences.remove('$token-selected-resume');
      }
    } catch (e) {
      rethrow;
    }
  }

  getSelectedCoverLetter() {
    try {
      String? data = preferences.getString('$token-selected-cover-letter');
      if (data != null) {
        return DocumentModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  saveSelectedCoverLetter(DocumentModel? data) async {
    try {
      if (data != null) {
        await preferences.setString(
            '$token-selected-cover-letter', data.toJson());
      } else {
        await preferences.remove('$token-selected-cover-letter');
      }
    } catch (e) {
      rethrow;
    }
  }

  getJobApplications() {
    try {
      List<String>? data = preferences.getStringList('$token-job-applications');
      if (data != null) {
        return data.map((e) => JobApplicationModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  saveJobApplications(List<JobApplicationModel> data) async {
    try {
      await preferences.setStringList(
          '$token-job-applications', data.map((e) => e.toJson()).toList());
    } catch (e) {
      rethrow;
    }
  }
}
