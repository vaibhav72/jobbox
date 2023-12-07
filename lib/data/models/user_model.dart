// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String email;
  String name;
  String profilePic;
  String phoneNumber;
  UserModel({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? profilePic,
    String? phoneNumber,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, profilePic: $profilePic, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        other.profilePic == profilePic &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        profilePic.hashCode ^
        phoneNumber.hashCode;
  }
}
