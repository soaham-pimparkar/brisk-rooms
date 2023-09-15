import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const Text(
              'You do not have access to this room!\nPlease try joining again',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: cLightColor),
            ),
            const SizedBox(height: 35),
            SizedBox(
              height: 35,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed("/");
                  },
                  child: const Icon(Icons.home)),
            )
          ],
        ),
      ),
    );
  }
}
