import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class roomModel {
  final String roomName;
  final String password;
  final String timeStamp;

  roomModel(
      {required this.password,
      required this.roomName,
      required this.timeStamp});

  Map<String, dynamic> toMap() {
    return {
      "roomName": roomName,
      "password": password,
      "timeStamp": timeStamp,
    };
  }

  factory roomModel.fromMap(Map<String, dynamic> iMap) {
    return roomModel(
      password: iMap["password"] ?? "",
      roomName: iMap["roomName"] ?? "",
      timeStamp: iMap["timeStamp"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());
  factory roomModel.from(String source) =>
      roomModel.fromMap(json.decode(source));
}
