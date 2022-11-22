import 'dart:ui';

import 'package:brisk_rooms/utils/colors.dart';
import 'package:brisk_rooms/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Image.asset(
          'assets/images/logo_b.png',
          fit: BoxFit.fitWidth,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: createRoomButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: joinRoomButton(),
          ),
          SizedBox(width: 35)
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
                      Expanded(
                        flex: 2,
                        child: VerticalDivider(
                          indent: 100,
                          endIndent: 100,
                          color: cLightColor,
                          thickness: 1,
                        ),
                      ),
                      //SizedBox(width: 30),
                      Expanded(
                        flex: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 300,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Hero(
                                      tag: 'create', child: createRoomButton()),
                                )),
                            SizedBox(height: 60),
                            SizedBox(
                                width: 300,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
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
                      padding: EdgeInsets.all(20),
                      width: 800,
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: cLightColor,
                          border: Border.all(width: 2, color: cHighColor)),
                      child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
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
                Divider(
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 45,
                          minWidth: 90,
                          maxHeight: 675,
                          maxWidth: 1200),
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Image.asset('assets/images/finalFlow.png',
                            fit: BoxFit.contain),
                      ),
                    )
                  ],
                ),
                Divider(
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
                              EdgeInsets.symmetric(vertical: 0, horizontal: 50),
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
                                margin: EdgeInsets.all(30),
                                padding: EdgeInsets.all(10),
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
                                    Text(
                                      '@s.o.a.h.a.m',
                                      style: TextStyle(
                                          color: cBackgroundColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(
                                      Icons.email,
                                      color: cBackgroundColor,
                                    ),
                                    Text(
                                      'soahampimparkar@gmail.com',
                                      style: TextStyle(
                                          color: cBackgroundColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )),
                          )),
                      Expanded(
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
                  padding: EdgeInsets.all(30),
                  child: Image.asset(
                    'assets/images/logo_b_s.png',
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(
                  width: 300,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Hero(tag: 'create', child: createRoomButton()),
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 300,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Hero(tag: 'join', child: joinRoomButton()),
                  )),
              Divider(
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
                    padding: EdgeInsets.all(15),
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: cLightColor,
                        border: Border.all(width: 2, color: cHighColor)),
                    child: Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
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
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/images/finalFlow.png',
                    fit: BoxFit.fitWidth),
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
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
                            Text(
                              '@s.o.a.h.a.m',
                              style: TextStyle(
                                  color: cBackgroundColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.email,
                              color: cBackgroundColor,
                            ),
                            Text(
                              'soahampimparkar@gmail.com',
                              style: TextStyle(
                                  color: cBackgroundColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )
                          ])
                    ],
                  )),
              Column(
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
              SizedBox(
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
        child: Text('Create Room'));
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
        child: Text('Join Room'));
  }
}

//what is briskrooms para""

//how it works flowchart, video

//use cases

//reviews, ratings, ffeatures, partners, alliances

//faqs

//bottom bar


