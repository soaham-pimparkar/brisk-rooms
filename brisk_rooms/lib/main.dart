import 'package:brisk_rooms/screens/theRoom.dart/noAccessPage.dart';
import 'package:brisk_rooms/screens/theRoom.dart/room.dart';
import 'package:brisk_rooms/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:beamer/beamer.dart';

import 'controllers/roomController.dart';
import 'firebase_options.dart';
import 'screens/createRoomPage.dart';
import 'screens/home.dart';
import 'screens/joinRoomPage.dart';
import 'aid.dart';

final _roomCtr = Get.put(roomController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    /*FirebaseOptions(
        apiKey: theApiKey,
        authDomain: theAuthDomain,
        projectId: "brisk-rooms",
        storageBucket: theStorageBucket,
        messagingSenderId: theMessageSenderID,
        appId: theAppID,
        measurementId: theMeasurementID),*/
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
        GetPage(name: '/', title: 'Home', page: () => const homePage()),
        GetPage(
            name: '/createroom',
            title: 'Create Room',
            page: () => const createRoomPage()),
        GetPage(
            name: '/joinroom', title: 'Join Room', page: () => const joinRoomPage()),
        GetPage(
            name: '/noaccess',
            title: 'Access Denied',
            page: () => const noAccessPage()),
        GetPage(
            name: '/room/:roomName',
            title: 'Room ${Get.parameters["roomName"]}',
            page: () => const roomInitial()),
      ],
    );
  }
}
