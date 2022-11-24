import 'package:brisk_rooms/controllers/roomController.dart';
import 'package:brisk_rooms/models/roomModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/noteModel.dart';

final _roomCtr = Get.put(roomController());
final _firestore = FirebaseFirestore.instance;

class noteController extends GetxController {
  Future<void> createNote({required String noteName}) async {
    final tempNote = noteModel(roomNo: noteName, noteContent: "Notepad:");
    await _firestore.doc("notes/$noteName").set(tempNote.toMap());
  }

  Future<String> fetchContent({required String noteName}) async {
    final dataMap = await _firestore.doc("notes/$noteName").get();
    final dataModel = noteModel.fromMap(dataMap.data()!);
    if (dataMap.exists) {
      return dataModel.noteContent;
    }
    return ("Unable to fetch note data :/");
  }

  Future<void> updateContent(
      {required String newContent, required String noteName}) async {
    final docRef = await _firestore.doc("notes/$noteName");
    await docRef.update({'noteContent': newContent});
  }
}
