import 'package:brisk_rooms/utils/consts.dart';
import 'package:brisk_rooms/utils/mySnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import '../../controllers/backendController.dart';
import '../../controllers/fileController.dart';
import '../../controllers/noteController.dart';
import '../../controllers/roomController.dart';
import '../../models/fileModel.dart';
import '../../utils/colors.dart';

class noAccessPage extends StatelessWidget {
  const noAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        //title: Text('Join Room')
      ),
      body: Center(
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
      ),
    );
  }
}
