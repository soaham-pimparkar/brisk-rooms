import 'package:brisk_rooms/screens/theRoom.dart/noAccessPage.dart';
import 'package:brisk_rooms/screens/theRoom.dart/notepad.dart';
import 'package:brisk_rooms/utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/backendController.dart';
import '../../controllers/fileController.dart';
import '../../controllers/noteController.dart';
import '../../controllers/roomController.dart';
import '../../models/fileModel.dart';
import '../../utils/colors.dart';
import '../../utils/mySnackbar.dart';
import 'filesView.dart';

final _noteCtr = Get.put(noteController());

final _roomCtr = Get.put(roomController(), permanent: true);
final _files = Get.put(fileController());
final _database = Get.put(backendController());

class roomInitial extends StatefulWidget {
  const roomInitial({Key? key}) : super(key: key);

  @override
  State<roomInitial> createState() => _roomInitialState();
}

class _roomInitialState extends State<roomInitial> {
  /*@override
  void deactivate() {
    super.deactivate();
    _roomCtr.setAuthStatus(false);
    print('dispose function called');
  }*/

  /*@override
  void initState() {
    // TODO: implement initState
    if (_roomCtr.getAuthStatus == false) {
      print('changing routing to noaccess page');
      Get.offNamed('/noaccess');
    }
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    if (_roomCtr.getAuthStatus == false) {
      print('changing routing to noaccess page');
      return noAccessPage();
    }
    _roomCtr.setAuthStatus(false);
    print('building room page');
    print(_roomCtr.getAuthStatus.toString());
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
          //_roomCtr.setAuthStatus(false);
          //print('auth state changed to false');
          if (constraints.maxWidth > windowSize) {
            return Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    child: Center(
                      child: filesView(),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: notepad(
                    tempCode: roomCode,
                    //qSnapshot: snapshot,
                  ),
                ),
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
                    height: 400,
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
                    height: 600,
                    child: notepad(
                      tempCode: roomCode,
                      //qSnapshot: snapshot,
                    ))
              ],
            )),
          );

          /*return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You do not have access to this room!\nPlease try joining again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: cLightColor),
                ),
                SizedBox(height: 35),
                SizedBox(
                  height: 35,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed("/");
                      },
                      child: Icon(Icons.home)),
                )
              ],
            ),
          );*/
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
