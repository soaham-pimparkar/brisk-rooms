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
        apiKey: "AIzaSyDDYYincV14hTiGqILg4O0zHAONQjB_MJw",
        authDomain: "brisk-aab2d.firebaseapp.com",
        projectId: "brisk-aab2d",
        storageBucket: "brisk-aab2d.appspot.com",
        messagingSenderId: "564536195767",
        appId: "1:564536195767:web:a17c51627b8d0cf5266b32",
        measurementId: "G-Q3TYY0DCJD"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    guards: [
      BeamGuard(
        pathPatterns: ['/room/*'],
        check: (context, location) {
          return _roomCtr.getAuthStatus;
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
      theme: ThemeData.light(),
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
