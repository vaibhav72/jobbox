// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:employee/data/models/job_model.dart';

import 'document_model.dart';

class JobApplicationModel {
  String id;
  String jobID;
  JobModel job;
  DocumentModel? resume;
  DocumentModel? coverLetter;
  bool educationIncludedInResume;
  String? yearOfGraduation;
  bool experienceIncludedInResume;
  String? schoolName;
  String? degree;
  DateTime date;
  String? companyName;
  String? jobTitle;
  String? yearsOfExperience;
  JobApplicationModel({
    required this.id,
    required this.jobID,
    required this.job,
    this.resume,
    this.coverLetter,
    required this.educationIncludedInResume,
    this.yearOfGraduation,
    required this.experienceIncludedInResume,
    this.schoolName,
    this.degree,
    required this.date,
    this.companyName,
    this.jobTitle,
    this.yearsOfExperience,
  });

  JobApplicationModel copyWith({
    String? id,
    String? jobID,
    JobModel? job,
    DocumentModel? resume,
    DocumentModel? coverLetter,
    bool? educationIncludedInResume,
    String? yearOfGraduation,
    bool? experienceIncludedInResume,
    String? schoolName,
    String? degree,
    DateTime? date,
    String? companyName,
    String? jobTitle,
    String? yearsOfExperience,
  }) {
    return JobApplicationModel(
      id: id ?? this.id,
      jobID: jobID ?? this.jobID,
      job: job ?? this.job,
      resume: resume ?? this.resume,
      coverLetter: coverLetter ?? this.coverLetter,
      educationIncludedInResume:
          educationIncludedInResume ?? this.educationIncludedInResume,
      yearOfGraduation: yearOfGraduation ?? this.yearOfGraduation,
      experienceIncludedInResume:
          experienceIncludedInResume ?? this.experienceIncludedInResume,
      schoolName: schoolName ?? this.schoolName,
      degree: degree ?? this.degree,
      date: date ?? this.date,
      companyName: companyName ?? this.companyName,
      jobTitle: jobTitle ?? this.jobTitle,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobID': jobID,
      'job': job.toMap(),
      'resume': resume?.toMap(),
      'coverLetter': coverLetter?.toMap(),
      'educationIncludedInResume': educationIncludedInResume,
      'yearOfGraduation': yearOfGraduation,
      'experienceIncludedInResume': experienceIncludedInResume,
      'schoolName': schoolName,
      'degree': degree,
      'date': date.millisecondsSinceEpoch,
      'companyName': companyName,
      'jobTitle': jobTitle,
      'yearsOfExperience': yearsOfExperience,
    };
  }

  factory JobApplicationModel.fromMap(Map<String, dynamic> map) {
    return JobApplicationModel(
      id: map['id'] as String,
      jobID: map['jobID'] as String,
      job: JobModel.fromMap(map['job'] as Map<String, dynamic>),
      resume: map['resume'] != null
          ? DocumentModel.fromMap(map['resume'] as Map<String, dynamic>)
          : null,
      coverLetter: map['coverLetter'] != null
          ? DocumentModel.fromMap(map['coverLetter'] as Map<String, dynamic>)
          : null,
      educationIncludedInResume: map['educationIncludedInResume'] as bool,
      yearOfGraduation: map['yearOfGraduation'] != null
          ? map['yearOfGraduation'] as String
          : null,
      experienceIncludedInResume: map['experienceIncludedInResume'] as bool,
      schoolName:
          map['schoolName'] != null ? map['schoolName'] as String : null,
      degree: map['degree'] != null ? map['degree'] as String : null,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      yearsOfExperience: map['yearsOfExperience'] != null
          ? map['yearsOfExperience'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobApplicationModel.fromJson(String source) =>
      JobApplicationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobApplicationModel(id: $id, jobID: $jobID, job: $job, resume: $resume, coverLetter: $coverLetter, educationIncludedInResume: $educationIncludedInResume, yearOfGraduation: $yearOfGraduation, experienceIncludedInResume: $experienceIncludedInResume, schoolName: $schoolName, degree: $degree, date: $date, companyName: $companyName, jobTitle: $jobTitle, yearsOfExperience: $yearsOfExperience)';
  }

  @override
  bool operator ==(covariant JobApplicationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.jobID == jobID &&
        other.job == job &&
        other.resume == resume &&
        other.coverLetter == coverLetter &&
        other.educationIncludedInResume == educationIncludedInResume &&
        other.yearOfGraduation == yearOfGraduation &&
        other.experienceIncludedInResume == experienceIncludedInResume &&
        other.schoolName == schoolName &&
        other.degree == degree &&
        other.date == date &&
        other.companyName == companyName &&
        other.jobTitle == jobTitle &&
        other.yearsOfExperience == yearsOfExperience;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        jobID.hashCode ^
        job.hashCode ^
        resume.hashCode ^
        coverLetter.hashCode ^
        educationIncludedInResume.hashCode ^
        yearOfGraduation.hashCode ^
        experienceIncludedInResume.hashCode ^
        schoolName.hashCode ^
        degree.hashCode ^
        date.hashCode ^
        companyName.hashCode ^
        jobTitle.hashCode ^
        yearsOfExperience.hashCode;
  }
}
