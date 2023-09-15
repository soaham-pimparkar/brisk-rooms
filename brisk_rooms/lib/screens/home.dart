
import 'package:brisk_rooms/controllers/roomController.dart';
import 'package:brisk_rooms/utils/colors.dart';
import 'package:brisk_rooms/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _roomCtr = Get.put(roomController(), permanent: true);

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(_roomCtr.getAuthStatus.toString());
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Image.asset(
          'assets/images/logo_b.png',
          fit: BoxFit.fitWidth,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 3, 12),
            child: createRoomButton(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(3, 12, 0, 12),
            child: joinRoomButton(),
          ),
          SizedBox(width: width / 100)
        ],
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (_, constraints) {
          if (constraints.maxWidth > windowSize) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 60,
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          heightFactor: 0.7,
                          child: Image.asset(
                            'assets/images/logo_b_s.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      //SizedBox(width: 30),
                      const Expanded(
                        flex: 2,
                        child: VerticalDivider(
                          indent: 100,
                          endIndent: 100,
                          color: cLightColor,
                          thickness: 1,
                        ),
                      ),
                      //SizedBox(width: 30),
                      const Expanded(
                        flex: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 300,
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Hero(
                                      tag: 'create', child: createRoomButton()),
                                )),
                            SizedBox(height: 60),
                            SizedBox(
                                width: 300,
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Hero(
                                      tag: 'join', child: joinRoomButton()),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 2 * width / 3,
                      height: 2 * height / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: cLightColor,
                          border: Border.all(width: 2, color: cHighColor)),
                      child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: '“',
                                  style: TextStyle(
                                      color: cHighColor,
                                      fontSize: 64,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Montserrat')),
                              TextSpan(
                                  text:
                                      'Brisk Rooms is a cloud based instant file transfer \nand text sharing platform that does not involve the hassle of account creation and logging in!\n\nThe platform provides temporary storage space upto 50MB\nwhere all the files and \'rooms\' are\ndeleted 3 hours after creation.',
                                  style: TextStyle(
                                      color: cBackgroundColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat')),
                              TextSpan(
                                  text: '”',
                                  style: TextStyle(
                                      color: cHighColor,
                                      fontSize: 64,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Montserrat'))
                            ])),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: cLightColor,
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 2 * width / 3,
                      //padding: Edg,
                      child: Image.asset('assets/images/finalFlow.png',
                          fit: BoxFit.contain),
                    )
                  ],
                ),
                const Divider(
                  color: cLightColor,
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                  height: 100,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                          child: Image.asset(
                            'assets/images/logo_b.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: SizedBox.expand(
                            child: Container(
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: cLightColor,
                                    border: Border.all(
                                        width: 2, color: cHighColor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                            'assets/images/instaLogo.png')),
                                    const Text(
                                      '@s.o.a.h.a.m',
                                      style: TextStyle(
                                          color: cBackgroundColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Icon(
                                      Icons.email,
                                      color: cBackgroundColor,
                                    ),
                                    const Text(
                                      'soahampimparkar@gmail.com',
                                      style: TextStyle(
                                          color: cBackgroundColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )),
                          )),
                      const Expanded(
                          flex: 2,
                          child: SizedBox.expand(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.copyright,
                                  color: cLightColor,
                                ),
                                Text(
                                  '2022',
                                  style: TextStyle(color: cLightColor),
                                ),
                                Text(
                                  'Brisk Rooms',
                                  style: TextStyle(color: cLightColor),
                                ),
                                Text(
                                  'All Rights Reserved',
                                  style: TextStyle(color: cLightColor),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            );
          }
          return (SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    'assets/images/logo_b_s.png',
                    fit: BoxFit.fitWidth,
                  )),
              const SizedBox(
                  width: 300,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Hero(tag: 'create', child: createRoomButton()),
                  )),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                  width: 300,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Hero(tag: 'join', child: joinRoomButton()),
                  )),
              const Divider(
                color: cLightColor,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: 4 * width / 5,
                    //height: 4 * width / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: cLightColor,
                        border: Border.all(width: 2, color: cHighColor)),
                    child: Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: '“',
                                style: TextStyle(
                                    color: cHighColor,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Montserrat')),
                            TextSpan(
                                text:
                                    'Brisk Rooms is a cloud based instant file transfer \nand text sharing platform that does not involve the hassle of account creation and logging in!\n\nThe platform provides temporary storage space upto 50MB\nwhere all the files and \'rooms\' are\ndeleted 3 hours after creation.',
                                style: TextStyle(
                                    color: cBackgroundColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat')),
                            TextSpan(
                                text: '”',
                                style: TextStyle(
                                    color: cHighColor,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Montserrat'))
                          ])),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                child: Image.asset('assets/images/finalFlow.png',
                    fit: BoxFit.fitWidth),
              ),
              Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: cLightColor,
                      border: Border.all(width: 2, color: cHighColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    Image.asset('assets/images/instaLogo.png')),
                            const Text(
                              '@s.o.a.h.a.m',
                              style: TextStyle(
                                  color: cBackgroundColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /*SizedBox(
                              width: 30,
                            ),*/
                            Icon(
                              Icons.email,
                              color: cBackgroundColor,
                            ),
                            Text(
                              'soahampimparkar@gmail.com',
                              style: TextStyle(
                                  color: cBackgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ])
                    ],
                  )),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright,
                    color: cLightColor,
                  ),
                  Text(
                    '2022',
                    style: TextStyle(color: cLightColor),
                  ),
                  Text(
                    'Brisk Rooms',
                    style: TextStyle(color: cLightColor),
                  ),
                  Text(
                    'All Rights Reserved',
                    style: TextStyle(color: cLightColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              )
            ],
          )));
        }),
      ),
    );
  }
}

//createroom button
class createRoomButton extends StatelessWidget {
  const createRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.offNamed("/createroom");
        },
        child: const Text('Create Room'));
  }
}

//join room button
class joinRoomButton extends StatelessWidget {
  const joinRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.offNamed("/joinroom");
        },
        child: const Text('Join Room', style: TextStyle(fontSize: 14)));
  }
}

//what is briskrooms para""

//how it works flowchart, video

//use cases

//reviews, ratings, ffeatures, partners, alliances

//faqs

//bottom bar

