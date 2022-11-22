import 'package:brisk_rooms/controllers/roomController.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:get/get.dart';
import '../controllers/backendController.dart';
import '../utils/colors.dart';
import '../utils/mySnackbar.dart';

final _backend = backendController();
final _roomCtr = roomController();

class joinRoomPage extends StatelessWidget {
  const joinRoomPage({Key? key}) : super(key: key);

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
          title: Text('Join Room')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Join Room',
                style: TextStyle(
                    color: cLightColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 48)),
            SizedBox(height: 30),
            jForm(),
          ],
        ),
      ),
    );
  }
}

class jForm extends StatefulWidget {
  const jForm({Key? key}) : super(key: key);

  @override
  State<jForm> createState() => _jFormState();
}

class _jFormState extends State<jForm> {
  final _passwordController = TextEditingController();
  final _roomIDController = TextEditingController();
  final _uniqueKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    onJoinRoomPressed() async {
      if (_uniqueKey.currentState!.validate()) {
        try {
          await _backend
              .joinRoomInst(_roomIDController.text, _passwordController.text)
              .then((data) async {
            if (data == false) {
              showSnackbar(context, "Wrong password");
              Get.offNamed('/joinroom');
            }
            if (data == true) {
              _roomCtr.setAuthStatus(true);
              Get.offNamed("/room/${_roomIDController.text}");
            }
            if (data == 'No such room has been created') {
              showSnackbar(context, 'hi');
            }
          });
        } catch (e) {
          showSnackbar(context, "Your fear was true");
        }
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
          child: Form(
              key: _uniqueKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _roomIDController,
                    decoration: InputDecoration(
                        hintText: 'Room ID', labelText: 'Enter Room ID:'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter Password:',
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _isObscure = !_isObscure),
                          icon: (_isObscure)
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        )),
                  ),
                  SizedBox(height: 30),
                  Hero(
                    tag: 'join',
                    child: SizedBox(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                          onPressed: onJoinRoomPressed,
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
