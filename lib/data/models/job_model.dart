// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  int id;
  String jobTitle;
  String location;
  String companyName;
  String logo;
  String salaryRange;
  DateTime postedAt;
  String requirements;
  String description;
  JobModel({
    required this.id,
    required this.jobTitle,
    required this.location,
    required this.companyName,
    required this.logo,
    required this.salaryRange,
    required this.postedAt,
    required this.requirements,
    required this.description,
  });

  JobModel copyWith({
    int? id,
    String? jobTitle,
    String? location,
    String? companyName,
    String? logo,
    String? salaryRange,
    DateTime? postedAt,
    String? requirements,
    String? description,
  }) {
    return JobModel(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      location: location ?? this.location,
      companyName: companyName ?? this.companyName,
      logo: logo ?? this.logo,
      salaryRange: salaryRange ?? this.salaryRange,
      postedAt: postedAt ?? this.postedAt,
      requirements: requirements ?? this.requirements,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'jobTitle': jobTitle,
      'location': location,
      'companyName': companyName,
      'logo': logo,
      'salaryRange': salaryRange,
      'postedAt': postedAt.millisecondsSinceEpoch,
      'requirements': requirements,
      'description': description,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] as int,
      jobTitle: map['jobTitle'] as String,
      location: map['location'] as String,
      companyName: map['companyName'] as String,
      logo: map['logo'] as String,
      salaryRange: map['salaryRange'] as String,
      postedAt: DateTime.fromMillisecondsSinceEpoch(map['postedAt'] as int),
      requirements: map['requirements'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobModel(id: $id, jobTitle: $jobTitle, location: $location, companyName: $companyName, logo: $logo, salaryRange: $salaryRange, postedAt: $postedAt, requirements: $requirements, description: $description)';
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.jobTitle == jobTitle &&
        other.location == location &&
        other.companyName == companyName &&
        other.logo == logo &&
        other.salaryRange == salaryRange &&
        other.postedAt == postedAt &&
        other.requirements == requirements &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        jobTitle.hashCode ^
        location.hashCode ^
        companyName.hashCode ^
        logo.hashCode ^
        salaryRange.hashCode ^
        postedAt.hashCode ^
        requirements.hashCode ^
        description.hashCode;
  }
}
