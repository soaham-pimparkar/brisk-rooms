import 'package:brisk_rooms/screens/theRoom.dart/room.dart';
import 'package:brisk_rooms/utils/colors.dart';
import 'package:brisk_rooms/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:beamer/beamer.dart';

import 'controllers/roomController.dart';
import 'screens/createRoomPage.dart';
import 'screens/home.dart';
import 'screens/joinRoomPage.dart';

final _roomCtr = roomController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB3f7soix96gvVtV1FLtMn7G69LT7aIYcA",
        authDomain: "brisk-rooms.firebaseapp.com",
        projectId: "brisk-rooms",
        storageBucket: "brisk-rooms.appspot.com",
        messagingSenderId: "172733504511",
        appId: "1:172733504511:web:d149bcc93b56227d75a5ca",
        measurementId: "G-77M9HSSWD0"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        pathPatterns: ['/room/*'],
        check: (context, location) {
          print(_roomCtr.getAuthStatus);
          //return _roomCtr.getAuthStatus;
          return false;
        },
        beamToNamed: (_, __) => '/',
      ),
    ],
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) {
          return BeamPage(
            key: UniqueKey(),
            title: "Home",
            child: const homePage(),
          );
        },
        '/room/:roomName': (context, state, data) {
          final roomName = state.pathParameters["roomName"];
          return BeamPage(
            popToNamed: '/',
            key: UniqueKey(),
            title: "Room ${Get.parameters["roomName"]}",
            child: const roomInitial(),
          );
        },
      },
    ),
  );
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brisk Rooms',
      darkTheme: darkish,
      theme: darkish,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', title: 'Home', page: () => homePage()),
        GetPage(
            name: '/createroom',
            title: 'Create Room',
            page: () => createRoomPage()),
        GetPage(
            name: '/joinroom', title: 'Join Room', page: () => joinRoomPage()),
        GetPage(
            name: '/room/:roomName',
            title: 'Room ${Get.parameters["roomName"]}',
            page: () => roomInitial()),
      ],
    );
  }
}
