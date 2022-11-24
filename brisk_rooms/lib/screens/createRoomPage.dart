import 'package:brisk_rooms/controllers/backendController.dart';
import 'package:brisk_rooms/models/roomModel.dart';
import 'package:brisk_rooms/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:get/get.dart';

import '../controllers/noteController.dart';
import '../controllers/roomController.dart';
import '../utils/colors.dart';
import '../utils/mySnackbar.dart';

final _backend = Get.put(backendController());
final _roomCtr = Get.put(roomController(), permanent: true);
final _noteCtr = Get.put(noteController());

class createRoomPage extends StatelessWidget {
  const createRoomPage({Key? key}) : super(key: key);

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
          title: Text('Create New Room')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_roomCtr.getAuthStatus.toString());
                },
                child: Text('Get auth status')),
            Text('Create New Room',
                style: TextStyle(
                    color: cLightColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 48)),
            SizedBox(height: 30),
            cForm(),
          ],
        ),
      ),
    );
  }
}

class cForm extends StatefulWidget {
  const cForm({Key? key}) : super(key: key);

  @override
  State<cForm> createState() => _cFormState();
}

class _cFormState extends State<cForm> {
  final _passwordController = TextEditingController();
  final roomId = randomNumeric(5);
  final _uniqueKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    onCreateRoomPressed() async {
      if (_uniqueKey.currentState!.validate()) {
        try {
          await _noteCtr.createNote(noteName: roomId);
          _roomCtr.setAuthStatus(true);
          await _backend.createRoomInst(roomId, _passwordController.text).then(
            (value) {
              //_roomCtr.setRoomData(roomModel.fromMap())
              Get.offNamed("/room/${roomId}");
            },
          );
        } catch (e) {
          showSnackbar(context, e.toString());
        }
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
          child: Form(
              key: _uniqueKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    readOnly: true,
                    initialValue: roomId,
                    decoration: InputDecoration(labelText: 'Room ID is:'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        labelText: 'Enter password:',
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _isObscure = !_isObscure),
                          icon: (_isObscure)
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Hero(
                    tag: 'create',
                    child: SizedBox(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                          onPressed: onCreateRoomPressed,
                          child: Text('Enter Room')),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
