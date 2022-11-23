import 'package:brisk_rooms/controllers/roomController.dart';
import 'package:brisk_rooms/models/fileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

final _firestore = FirebaseFirestore.instance;
final _firestorage = FirebaseStorage.instance;
final _roomCtr = Get.put(roomController());

class fileController extends GetxController {
  bool _isLoading = false;

  bool get loadingStatus => _isLoading;

  setIsLoading(bool val) {
    _isLoading = val;
    update();
  }

  Stream<QuerySnapshot<fileModel>> getFilesAsStream() {
    return _firestore
        .collection("files")
        .where("roomId", isEqualTo: _roomCtr.getRoomCode)
        .withConverter<fileModel>(
          fromFirestore: (data, __) => fileModel.fromMap(data.data()!),
          toFirestore: (doc, __) => doc.toMap(),
        )
        .snapshots();
  }

  Future<dynamic> uploadFile(String roomID) async {
    double roomSize = await getRoomSize();
    double filesSize = roomSize;

    if (roomSize > 52428800) {
      return "Room capacity exceeded";
    }
    final data = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: true,
      withData: true,
    );
    for (var element in data!.files) {
      filesSize += element.size;
    }
    if (filesSize > 52428800) {
      return "Uploading the selected files will exceed the room capacity";
    }
    setIsLoading(true);
    for (var element in data.files) {
      final fileID = randomAlphaNumeric(6);
      await _firestorage
          .ref("rooms/${_roomCtr.getRoomCode}/${element.name}")
          .putData(element.bytes!);
      final fullPath = _firestorage
          .ref("rooms/${_roomCtr.getRoomCode}/${element.name}")
          .fullPath;
      final fileUrl = await _firestorage
          .ref("rooms/${_roomCtr.getRoomCode}/${element.name}")
          .getDownloadURL();
      final fileData = fileModel(
        roomId: _roomCtr.getRoomCode,
        name: element.name,
        //type:
        filePath: fullPath,
        fileUrl: fileUrl,
        fileSize: element.size.toDouble(),
        fileId: fileID,
      ).toMap();
      await _firestore.doc("files/$fileID").set(fileData);
    }
    setIsLoading(false);
  }

  Future deleteFile(String filePath, String fileTempId) async {
    await FirebaseStorage.instance.ref(filePath).delete();
    await _firestore.doc("files/$fileTempId").delete();
    //await _firestore.collection('files').where("fileId", isEqualTo: fileTempId).delete()
  }

  Future<double> getRoomSize() async {
    double totalSize = 0;
    final data = await _firestore
        .collection("files")
        .where("roomId", isEqualTo: _roomCtr.getRoomCode)
        .get();

    for (var element in data.docs) {
      final file = fileModel.fromMap(element.data());
      totalSize += file.fileSize;
    }
    return totalSize;
  }
}
