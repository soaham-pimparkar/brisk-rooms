import 'dart:convert';

class noteModel {
  late String roomNo;
  late String noteContent;

  noteModel({
    required this.roomNo,
    required this.noteContent,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomNo': roomNo,
      'noteContent': noteContent,
    };
  }

  factory noteModel.fromMap(Map<String, dynamic> iMap) {
    return noteModel(
      roomNo: iMap['roomNo'] ?? '',
      noteContent: iMap['noteContent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory noteModel.fromJson(String source) =>
      noteModel.fromMap(json.decode(source));
}
