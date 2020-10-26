import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/your_birthday.dart';

class ImageSelector extends StatefulWidget {
  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {

  File _imageFile;
  List<int> byteimage;
  int delayAmount = 400;
  String base64 = '', fileName = 'Browse File';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text(
            "Select Profile Image",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: SingleChildScrollView(
                        child: new Container(
//                        color: Color(0xFF5a6381),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[

                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ShowUp(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(0.0, SizeConfig.heightMultiplier * 3.83, 0.0, SizeConfig.heightMultiplier * 3.83),
                                          child: Align(
                                            child: new Text(
                                              'Select Your Profile Pic',
                                              style: TextStyle(

                                                color: Color(0xFF5a6381),
                                                fontSize: 23,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        delay: delayAmount,
                                      ),

                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 2.54,
                                      ),


                                      ShowUp(
                                        child: GestureDetector(
                                        onTap: (){
                                          _displayDialog(context);
                                        },
                                        child: Center(
                                          child: _imageFile != null
                                              ? CircleAvatar(
                                            radius: 65,
                                            backgroundColor: Colors.grey.shade200,
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundImage:
                                              FileImage(_imageFile),
                                            ),
                                          )
                                              : Container(
                                              width: 75.0,
                                              height: 75.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                      "assets/images/user.webp",
                                                    ),
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.4,
                                ),
                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                              color: Colors.transparent),
                        )),
                  ),
                ),
                ShowUp(
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(

                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Birthday()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 1.26 *  SizeConfig.heightMultiplier,),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(0.63 *  SizeConfig.heightMultiplier,)),
//                                  boxShadow: <BoxShadow>[
//                                    BoxShadow(
//                                        color: Colors.grey.shade200,
//                                        offset: Offset(2, 4),
//                                        blurRadius: 5,
//                                        spreadRadius: 2)
//                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff01bbf4),
                                        Color(0xff01bbf4)
                                      ])),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                      )),
                ),

                  delay: delayAmount+300,),

              ],
            ),
          ),

//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(0.0),
//            image: DecorationImage(
//              image: AssetImage("assets/images/onboard_three.png"),
//              fit: BoxFit.fill,
//            ),
//          ),
        ),
        resizeToAvoidBottomPadding: true);
  }



  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFile = imageFile;
        byteimage = imageFile.readAsBytesSync();
        base64 = base64Encode(imageFile.readAsBytesSync());
        fileName = imageFile.path.split('/').last;
        print(fileName + '------' + base64);
        SharedPreferences.getInstance().then((value) {
          value.setString("filename_profile", fileName);
          value.setString("filePath_profile", _imageFile.path);
        });
      });
    } catch (e) {
      print(e);
    }
  }
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        captureImage(ImageSource.camera);
                      },
                      child: Image.asset(
                        'assets/images/camera.png',
                        height: 50,
                        width: 150,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        captureImage(ImageSource.gallery);
                      },
                      child: Image.asset(
                        'assets/images/gallery.png',
                        height: 50,
                        width: 150,
                      ),
                    ),
                    Center(
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.redAccent[100],
                        child: new Text("Cancel"),
                      ),
                    )
                  ],
                ),
              ),
              height: 150,
              width: 100,
            ),
          );
        });
  }
}
