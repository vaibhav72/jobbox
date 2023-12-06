// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:employee/data/models/job_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:employee/utils/helpers.dart';

class ApplyToJobController extends GetxController {
  static ApplyToJobController get to => Get.find<ApplyToJobController>();
  Rxn<List<DocumentClass?>> resume = Rxn<List<DocumentClass?>>([
    DocumentClass(path: "/MyDoc.pdf", date: DateTime.now(), isResume: true)
  ]);
  Rxn<List<DocumentClass?>> coverLetter = Rxn<List<DocumentClass?>>([]);
  Rxn<JobModel> job = Rxn<JobModel>();

  Rxn<DocumentClass?> selectedResume = Rxn<DocumentClass?>();
  Rxn<DocumentClass?> selectedCoverLetter = Rxn<DocumentClass?>();
  Rxn<bool> educationIncludedInResume = Rxn<bool>(false);
  Rxn<bool> experienceIncludedInResume = Rxn<bool>(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      job.value = Get.arguments as JobModel;
    }
  }

  void pickResume() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        resume.value = [
          ...?resume.value,
          DocumentClass(
              path: result.files.first.path!,
              date: DateTime.now(),
              isResume: true)
        ];
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
        coverLetter.value = [
          ...?coverLetter.value,
          DocumentClass(
              path: result.files.first.path!,
              date: DateTime.now(),
              isResume: true)
        ];
      } else {
        showSnackBar("No file selected");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}

class DocumentClass {
  String path;
  DateTime date;
  bool isResume;
  DocumentClass({
    required this.path,
    required this.date,
    required this.isResume,
  });

  DocumentClass copyWith({
    String? path,
    DateTime? date,
    bool? isResume,
  }) {
    return DocumentClass(
      path: path ?? this.path,
      date: date ?? this.date,
      isResume: isResume ?? this.isResume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'date': date.millisecondsSinceEpoch,
      'isResume': isResume,
    };
  }

  factory DocumentClass.fromMap(Map<String, dynamic> map) {
    return DocumentClass(
      path: map['path'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isResume: map['isResume'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentClass.fromJson(String source) =>
      DocumentClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DocumentClass(path: $path, date: $date, isResume: $isResume)';

  @override
  bool operator ==(covariant DocumentClass other) {
    if (identical(this, other)) return true;

    return other.path == path &&
        other.date == date &&
        other.isResume == isResume;
  }

  @override
  int get hashCode => path.hashCode ^ date.hashCode ^ isResume.hashCode;
}
