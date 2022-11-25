import 'package:brisk_rooms/utils/consts.dart';
import 'package:brisk_rooms/utils/mySnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import '../../controllers/backendController.dart';
import '../../controllers/fileController.dart';
import '../../controllers/noteController.dart';
import '../../controllers/roomController.dart';
import '../../models/fileModel.dart';
import '../../utils/colors.dart';

final _noteCtr = Get.put(noteController());

class notepad extends StatefulWidget {
  final String tempCode;
  //final AsyncSnapshot qSnapshot;
  const notepad({required this.tempCode, /*required this.qSnapshot,*/ Key? key})
      : super(key: key);

  @override
  State<notepad> createState() => _notepadState();
}

class _notepadState extends State<notepad> {
  final _noteEditCtr = TextEditingController();

  /*@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  */

  @override
  Widget build(BuildContext context) {
    final initialContent = _noteCtr.fetchContent(noteName: widget.tempCode);
    String useString = initialContent.toString();
    return FutureBuilder(
        future: _noteCtr.fetchContent(noteName: widget.tempCode),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error loading notepad :/"),
            );
          }
          if (snapshot.hasData) {
            final initialContent = snapshot.data.toString();
            _noteEditCtr.text = initialContent;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      child: FractionallySizedBox(
                        widthFactor: 0.66,
                        heightFactor: 0.5,
                        child: ElevatedButton(
                            onPressed: () async {
                              await _noteCtr.fetchContent(
                                  noteName: widget.tempCode);
                              setState(
                                  () => _noteEditCtr.text = initialContent);
                            },
                            child: Text('Refresh')),
                      ),
                    )),
                Expanded(
                  flex: 34,
                  child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      color: Colors.transparent,
                      padding: EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: cLightColor,
                            border: Border.all(width: 2, color: cHighColor)),
                        child: Scrollbar(
                          //always show scrollbar
                          thickness: 50, //width of scrollbar
                          radius:
                              Radius.circular(20), //corner radius of scrollbar
                          scrollbarOrientation: ScrollbarOrientation.left,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              onChanged: (text) async {
                                if (text.length >= useString.length + 10 ||
                                    text.length + 9 <= useString.length) {
                                  await _noteCtr.updateContent(
                                      newContent: text,
                                      noteName: widget.tempCode);
                                  print(text);
                                  useString = text;
                                }
                                ;
                              },
                              style: TextStyle(
                                  color: cBackgroundColor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18),
                              controller: _noteEditCtr,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              //initialValue: "Initial Value is this",
                            ),
                          ),
                        ),
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      child: FractionallySizedBox(
                        widthFactor: 0.66,
                        heightFactor: 0.5,
                        child: ElevatedButton(
                            onPressed: () async {
                              await _noteCtr.updateContent(
                                  newContent: _noteEditCtr.text,
                                  noteName: widget.tempCode);
                            },
                            child: Text('Save Note')),
                      ),
                    ))
              ],
            );
          }
          return Center(child: Text("Something went wrong, please try again"));
        });
  }
}

//void uploadData(String content) async {}