import 'package:brisk_rooms/screens/theRoom.dart/notepad.dart';
import 'package:brisk_rooms/utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/backendController.dart';
import '../../controllers/fileController.dart';
import '../../controllers/roomController.dart';
import '../../models/fileModel.dart';
import '../../utils/colors.dart';
import '../../utils/mySnackbar.dart';
import 'filesView.dart';

final _roomCtr = Get.put(roomController());
final _files = Get.put(fileController());
final _database = Get.put(backendController());

class roomInitial extends StatelessWidget {
  const roomInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _roomCtr.setRoomCode(Get.parameters["roomName"]!);
    final roomCode = _roomCtr.getRoomCode;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Colors.transparent,
                border: Border.all(width: 2, color: cHighColor)),
            child: Text("Room ID:$roomCode",
                style: TextStyle(
                    color: cLightColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 24)),
          ),
          leadingWidth: 200,
          leading: GestureDetector(
            onTap: () {
              Get.offNamed("/");
            },
            child: Image.asset(
              'assets/images/logo_b.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        body: LayoutBuilder(builder: (_, constraints) {
          if (constraints.maxWidth > windowSize) {
            return Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Center(child: filesView()),
                    )),
                Expanded(flex: 1, child: notepad(tempCode: roomCode))
              ],
            );
          }
          return SingleChildScrollView(
            child: (Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.transparent,
                    width: double.maxFinite,
                    height: 1000,
                    child: filesView()),
                Divider(
                  color: cLightColor,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.transparent,
                    width: double.maxFinite,
                    height: 1000,
                    child: notepad(tempCode: roomCode))
              ],
            )),
          );
        }));
    /*return Scaffold(
        appBar: AppBar(
          title: Text('Room: roomCode'),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Get.offNamed('/'),
          ),
        ),
        body: LayoutBuilder(builder: (_, constraints) {
          if (constraints.maxWidth > windowSize) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.blue,
                ),
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                          )
                        ],
                        mainAxisSize: MainAxisSize.max,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black,
                          )
                        ],
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ))
              ],
            );
          }
          return Container(
            child: Text('hi'),
          );
        }));*/
  }
}
