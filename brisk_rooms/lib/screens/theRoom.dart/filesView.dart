import 'package:brisk_rooms/utils/consts.dart';
import 'package:brisk_rooms/utils/mySnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import '../../controllers/backendController.dart';
import '../../controllers/fileController.dart';
import '../../controllers/roomController.dart';
import '../../models/fileModel.dart';
import '../../utils/colors.dart';

final _roomCtr = Get.put(roomController());
final _files = Get.put(fileController());
final _database = Get.put(backendController());
Uri _url = Uri.parse(' ');

class filesView extends StatelessWidget {
  const filesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder(
      init: _files,
      builder: (ctr) {
        if (_files.loadingStatus == true) {
          showSnackbar(context, "Uploading your file to cloud....",
              mDuration: Duration(seconds: 100));
        }
        if (_files.loadingStatus == false) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        return StreamBuilder(
            stream: _files.getFilesAsStream(),
            builder: (
              context,
              AsyncSnapshot<QuerySnapshot<fileModel>> snapshot,
            ) {
              if (snapshot.hasData) {
                final allFiles = snapshot.data!.docs;
                if (allFiles.isEmpty) {
                  return (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No files have been uploaded yet",
                            style: TextStyle(
                                color: cLightColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 28)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 6, vertical: 100),
                          child: SizedBox(
                              height: 40,
                              width: double.maxFinite,
                              child: const uploadButton()),
                        )
                        //uploadButton()
                      ]));
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 17,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(width / 75),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.transparent,
                            border: Border.all(width: 2, color: cLightColor)),
                        child: ListView.builder(
                            padding: EdgeInsets.all(width / 75),
                            shrinkWrap: true,
                            itemCount: allFiles.length,
                            itemBuilder: (context, index) {
                              final item = allFiles[index].data();
                              //print(item.fileId);
                              final String suffix = extension(item.name);
                              return ListTile(
                                dense: true,
                                //isThreeLine: true,
                                //subtitle: Icon(Icons.home),
                                leading: chosenIcon(theSuffix: suffix),
                                title: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: cLightColor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.download,
                                        color: cHighColor,
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        try {
                                          _url = Uri.parse(item.fileUrl);
                                          await launchUrl(_url);
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Error while downloading"),
                                            duration:
                                                const Duration(seconds: 4),
                                          ));
                                        }
                                      },
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          //print(item.fileId);
                                          //print(item.fileId);
                                          //print(item.fileId);
                                          await _files.deleteFile(
                                              item.filePath, item.fileId);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: cHighColor,
                                          size: 25,
                                        )),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    Flexible(
                        flex: 3,
                        child: Container(
                          child: FractionallySizedBox(
                              widthFactor: 0.66,
                              heightFactor: 0.33,
                              child: const uploadButton()),
                        ))
                  ],
                );
              }
              /*if (!snapshot.hasData) {
                showSnackbar(context, "Unable to load files, Please retry");
              }*/
              return (CircularProgressIndicator(color: cLightColor));
            });
      },
    );
  }
}

class uploadButton extends StatelessWidget {
  const uploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await _files.uploadFile(_roomCtr.getRoomCode).then(
            (value) {
              if (value == "roomSize") {
                showSnackbar(
                  context,
                  "Size of the room is greater than 20MB\nDelete some files",
                );
              } else if (value == "filesSize") {
                showSnackbar(
                  context,
                  "Size of the room will greater than 20MB",
                );
              }
            },
          );
        },
        child: Text('Upload Files'));
  }
}

class chosenIcon extends StatelessWidget {
  final String theSuffix;
  const chosenIcon({required this.theSuffix, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (theSuffix == '.jpg') {
      return Icon(
        color: cHighColor,
        Icons.image,
      );
    }
    if (theSuffix == '.png') {
      return Icon(
        color: cHighColor,
        Icons.image_outlined,
      );
    }
    if (theSuffix == '.pdf') {
      return Icon(
        color: cHighColor,
        Icons.picture_as_pdf,
      );
    }
    if (theSuffix == '.jpeg') {
      return Icon(
        color: cHighColor,
        Icons.image_sharp,
      );
    }
    if (theSuffix == '.mp3') {
      return Icon(
        color: cHighColor,
        Icons.audio_file,
      );
    }
    if (theSuffix == '.txt') {
      return Icon(color: cHighColor, Icons.note);
    }
    if (theSuffix == '.mp4') {
      return Icon(color: cHighColor, Icons.video_file);
    }
    if (theSuffix == '.svg') {
      return Icon(color: cHighColor, Icons.photo);
    }
    if (theSuffix == '.pptx') {
      return Icon(color: cHighColor, Icons.picture_in_picture);
    }
    if (theSuffix == '.docx') {
      return Icon(color: cHighColor, Icons.notes);
    }
    return Icon(color: cHighColor, Icons.file_open);
  }
}


//Gruidviewbuilder saved code
/*
{
  GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 15,
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 10),
                                  itemCount: allFiles.length,
                                  itemBuilder: (context, index) {
                                    final item = allFiles[index].data();
                                    final String suffix = extension(item.name);
                                    return GridTile(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: cLightColor,
                                              border: Border.all(
                                                  width: 2, color: cHighColor)),
                                          child: chosenIcon(theSuffix: suffix)),
                                      header: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.download,
                                              color: cBackgroundColor,
                                              size: 35,
                                            ),
                                            onPressed: () async {
                                              try {
                                                _url = Uri.parse(item.fileUrl);
                                                await launchUrl(_url);
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Error while downloading"),
                                                  duration: const Duration(
                                                      seconds: 4),
                                                ));
                                              }
                                            },
                                          ),
                                          Flexible(
                                              child: SizedBox(
                                                  width: double.maxFinite)),
                                          IconButton(
                                              onPressed: () async {
                                                await _files.deleteFile(
                                                    item.filePath, item.fileId);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: cBackgroundColor,
                                                size: 35,
                                              )),
                                          SizedBox(width: 10)
                                        ],
                                      ),
                                      footer: SizedBox(
                                          width: double.maxFinite,
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: cBackgroundColor,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14),
                                            ),
                                          )),
                                    );
                                  }),
}
*/