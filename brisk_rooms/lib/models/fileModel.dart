import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class fileModel {
  late String name;
  late String fileId;
  late String filePath;
  late double fileSize;
  late String roomId;
  //late String type;
  late String fileUrl;

  fileModel({
    required this.fileId,
    required this.filePath,
    required this.fileSize,
    required this.fileUrl,
    required this.name,
    required this.roomId,
    //required this.type
  });

  Map<String, dynamic> toMap() {
    return {
      'fileId': fileId,
      'name': name,
      'filePath': filePath,
      'fileUrl': fileUrl,
      'size': fileSize,
      'roomId': roomId,
    };
  }

  factory fileModel.fromMap(Map<String, dynamic> iMap) {
    return fileModel(
      fileId: iMap['fileId'] ?? '',
      name: iMap['name'] ?? '',
      filePath: iMap['filePath'] ?? '',
      fileUrl: iMap['fileUrl'] ?? '',
      fileSize: iMap['size'] ?? 0,
      roomId: iMap['roomId'] ?? '',
      //type: iMap['type'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory fileModel.fromJson(String source) =>
      fileModel.fromMap(json.decode(source));
}
