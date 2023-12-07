import 'dart:convert';

class DocumentModel {
  String path;
  DateTime date;
  bool isResume;
  DocumentModel({
    required this.path,
    required this.date,
    required this.isResume,
  });

  DocumentModel copyWith({
    String? path,
    DateTime? date,
    bool? isResume,
  }) {
    return DocumentModel(
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

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      path: map['path'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isResume: map['isResume'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DocumentClass(path: $path, date: $date, isResume: $isResume)';

  @override
  bool operator ==(covariant DocumentModel other) {
    if (identical(this, other)) return true;

    return other.path == path &&
        other.date == date &&
        other.isResume == isResume;
  }

  @override
  int get hashCode => path.hashCode ^ date.hashCode ^ isResume.hashCode;
}
