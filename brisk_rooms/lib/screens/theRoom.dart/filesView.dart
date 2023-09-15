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
    /*bool flag = false;
    bool get flagStatus => flag;

  setIsLoading(bool val) {
    flag = val;
  }*/

    return GetBuilder(
      init: _files,
      builder: (ctr) {
        if (_files.loadingStatus == true) {
          /*showSnackbar(context, "Uploading your file to cloud....",
              mDuration: Duration(seconds: 100));*/
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Uploading your files to cloud"),
              ],
            ),
            backgroundColor: cHighColor,
            duration: Duration(seconds: 100),
          ));
        }
        if (_files.loadingStatus == false && _files.flagStatus == false) {
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
                        const Text("No files have been uploaded yet",
                            style: TextStyle(
                                color: cLightColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 28)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 6, vertical: 100),
                          child: const SizedBox(
                              height: 40,
                              width: double.maxFinite,
                              child: uploadButton()),
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
                        margin: const EdgeInsets.all(12),
                        padding: EdgeInsets.all(width / 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.transparent,
                            border: Border.all(width: 2, color: cLightColor)),
                        child: ListView.builder(
                            padding: EdgeInsets.all(width / 100),
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
                                  style: const TextStyle(
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
                                      icon: const Icon(
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
                                              .showSnackBar(const SnackBar(
                                            content:
                                                Text("Error while downloading"),
                                            duration:
                                                Duration(seconds: 4),
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
                                        icon: const Icon(
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
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: const FractionallySizedBox(
                              widthFactor: 0.66,
                              heightFactor: 0.5,
                              child: uploadButton()),
                        ))
                  ],
                );
              }
              /*if (!snapshot.hasData) {
                showSnackbar(context, "Unable to load files, Please retry");
              }*/
              return (const CircularProgressIndicator(color: cLightColor));
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
              if (value == "Room capacity exceeded") {
                _files.setFlag(true);
                showSnackbar(
                  context,
                  "Size of the room is greater than 50MB\nDelete some files",
                );
                Future.delayed(const Duration(seconds: 4), () {
                  _files.setFlag(false);
                });
              } else if (value ==
                  "Uploading the selected files will exceed the room capacity") {
                _files.setFlag(true);
                showSnackbar(
                  context,
                  "Size of the room will greater than 50MB",
                );
                Future.delayed(const Duration(seconds: 4), () {
                  _files.setFlag(false);
                });
              }
            },
          );
        },
        child: const Text('Upload Files'));
  }
}

class chosenIcon extends StatelessWidget {
  final String theSuffix;
  const chosenIcon({required this.theSuffix, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (theSuffix == '.jpg') {
      return const Icon(
        color: cHighColor,
        Icons.image,
      );
    }
    if (theSuffix == '.png') {
      return const Icon(
        color: cHighColor,
        Icons.image_outlined,
      );
    }
    if (theSuffix == '.pdf') {
      return const Icon(
        color: cHighColor,
        Icons.picture_as_pdf,
      );
    }
    if (theSuffix == '.jpeg') {
      return const Icon(
        color: cHighColor,
        Icons.image_sharp,
      );
    }
    if (theSuffix == '.mp3') {
      return const Icon(
        color: cHighColor,
        Icons.audio_file,
      );
    }
    if (theSuffix == '.txt') {
      return const Icon(color: cHighColor, Icons.note);
    }
    if (theSuffix == '.mp4') {
      return const Icon(color: cHighColor, Icons.video_file);
    }
    if (theSuffix == '.svg') {
      return const Icon(color: cHighColor, Icons.photo);
    }
    if (theSuffix == '.pptx') {
      return const Icon(color: cHighColor, Icons.picture_in_picture);
    }
    if (theSuffix == '.docx') {
      return const Icon(color: cHighColor, Icons.notes);
    }
    return const Icon(color: cHighColor, Icons.file_open);
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