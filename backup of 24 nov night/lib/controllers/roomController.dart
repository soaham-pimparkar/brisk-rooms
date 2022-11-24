import 'package:brisk_rooms/models/roomModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class roomController extends GetxController {
  late roomModel _roomInst;
  late String _roomCode;
  final _notepad = TextEditingController();
  bool _isAuthenticated = false;

  String get getRoomCode => _roomCode;
  bool get getAuthStatus => _isAuthenticated;

  void setRoomCode(String code) {
    _roomCode = code;
    update();
  }

  roomModel get getRoomData => _roomInst;

  void setRoomData(roomModel roomInst) {
    _roomInst = roomInst;
    update();
  }

  void setAuthStatus(bool value) {
    _isAuthenticated = value;
    update();
  }
}
