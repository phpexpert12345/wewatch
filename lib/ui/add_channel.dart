import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/my_channel.dart';


class AddChannel extends StatefulWidget {
  @override
  _AddChannelState createState() => new _AddChannelState();
}

class _AddChannelState extends State<AddChannel> {
  bool isResponse = false;
  bool visible = false;



  bool isPrivate ;
  bool isSubscribers;
  bool isPlaylist ;

  bool isHomeDataLoading = false;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
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
      });
    } catch (e) {
      print(e);
    }
  }
  Future<void> captureImageTwo(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFileTwo = imageFile;

        byteimageTwo = imageFile.readAsBytesSync();
        base64Two = base64Encode(imageFile.readAsBytesSync());
        fileNameTwo = imageFile.path.split('/').last;
        print(fileNameTwo + '------' + base64Two);
      });
    } catch (e) {
      print(e);
    }
  }

  Future updateProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
    var stream = new http.ByteStream(_imageFile.openRead());
    var streamTwo = new http.ByteStream(_imageFileTwo.openRead());
    // get file length
    var length = await _imageFile.length();
    var lengthTwo = await _imageFileTwo.length();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/channel'));
    request.fields["channel_name"] = _nameController.text;
    request.fields["channel_description"] = _descController.text;
    request.fields["video_private"] = isPrivate?"1":"0";
    request.fields["subscribers_private"] = isSubscribers?"1":"0";
    request.fields["playlists_private"] = isPlaylist?"1":"0";

    request.files.add(
        await http.MultipartFile('channel_logo', streamTwo, lengthTwo, filename: fileNameTwo));
    request.files.add(
        await http.MultipartFile('channel_cover', stream, length, filename: fileName));

    request.headers.addAll(headers);
    var response = await request.send();


    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Channel update successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightGreen,
          textColor: Colors.white,
          fontSize: 16.0
      );

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => MyChannel()),
      );
    } else {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Your profile update failed!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }



  @override
  void initState() {
    super.initState();
    isPrivate=false;
    isSubscribers=false;
    isPlaylist=false;



  }

  File _imageFile;

  List<int> byteimage;
  String base64 = '', fileName = 'Browse File';
  File _imageFileTwo;

  List<int> byteimageTwo;
  String base64Two = '', fileNameTwo = 'Browse File';

  bool isExpanded = false;


  String channel_name,channel_logo,channel_cover,channel_description,video_private,subscribers_private,playlists_private;


  //edited line

  final TextEditingController _nameController = new TextEditingController();

  final TextEditingController _descController = new TextEditingController();


  // our default setting is to login, and we should switch to creating an account when the user chooses to

  TextStyle style1 = TextStyle(

      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      color: Color(0xff444b69));
  TextStyle style11 = TextStyle(

      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Color(0xff444b69));
  TextStyle style2 = TextStyle(

    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    color: Color(0xff444b69),
    decoration: TextDecoration.underline,
  );
  TextStyle style3 = TextStyle(

      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      color: Color(0xff444b69),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//    pr = new ProgressDialog(context);
//    pr.style(message: 'Please wait...');
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Add Channel",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
////                    new IconButton(
////                        icon: Icon(
////                          Icons.arrow_back_ios,
////                          color: Color(0xff444b69),
////                          size: 20,
////                        ),
////                        onPressed: () {
////                          if (Navigator.canPop(context)) {
////                            Navigator.pop(context);
////                          } else {
////                            SystemNavigator.pop();
////                          }
////                        }),
//                      Flexible(
//                        child: Center(
//                            child: Padding(
//                              padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
//                              child: Text(
//                                ' Profile',
//                                style: TextStyle(
//
//                                  color: Color(0xff444b69),
//                                  fontSize: 20,
//                                ),
//                              ),
//                            )),
//                        flex: 1,
//                      ),
//                    ],
//                  ),
//                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: new Container(
//                        color: Color(0xff444b69),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: <Widget>[
//                                    GestureDetector(
//                                      onTap: () {
//                                        _displayDialog(context);
//                                      },
//                                      child: Row(
//                                        children: <Widget>[
//                                          Container(
//                                              width: 75.0,
//                                              height: 75.0,
//                                              decoration: BoxDecoration(
//                                                  shape: BoxShape.circle,
//                                                  image: DecorationImage(
//                                                    fit: BoxFit.fill,
//                                                    image: (_imageFile == null)
//                                                        ? AssetImage(
//                                                      "assets/images/edit_profile_image.png",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                    )
//                                                        : FileImage(
//                                                      _imageFile,
//                                                    ),
//                                                  ))),
////                                      Container(
////                                        height: 75.0,
////                                        width: 75.0,
////                                        decoration: new BoxDecoration(
////                                          shape: BoxShape.circle,
////                                        ),
////                                        child: ClipRRect(
////                                          borderRadius: BorderRadius.circular(75.0),
////                                          child: (_imageFile==null)?Image.asset(
////                                            "assets/images/edit_profile_image.png",
//////                                              color: Colors.red,
//////                                              semanticsLabel: 'A red up arrow'
////
////
////                                          ):Image.file(_imageFile,width: 75,height: 75,
////                                          ),
////                                        ),),
////                                      Padding(
////                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
////                                        child: Container(
////                                          height: 75,
////                                          width: 75,
////                                          decoration: new BoxDecoration(
////                                            color: const Color(0xff7c94b6),
////                                            borderRadius: BorderRadius.all(const Radius.circular(75.0)),
////                                            border: Border.all(color: const Color(0xFF28324E)),),
////
////                                          child: (_imageFile==null)?Image.asset(
////                                            "assets/images/edit_profile_image.png",
//////                                              color: Colors.red,
//////                                              semanticsLabel: 'A red up arrow'
////
////
////                                          ):Image.file(_imageFile,
////                                            ),
////                                        ),
////                                      ),
//                                        ],
//                                      ),
//                                    ),

//                                Row(
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Padding(
//                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Text(
//                                          'Profile',
//                                          textAlign: TextAlign.left,
//                                          style: TextStyle(
//
//                                            color: Color(0xff444b69),
//                                            fontSize: 18,
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),

                            SizedBox(
                              height: 0,
                            ),

                            new Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: new TextFormField(
                                          controller: _nameController,
                                          textInputAction:
                                          TextInputAction.done,
                                          decoration: new InputDecoration(
                                            hintText: 'Channel Name',
//                                                labelText: (first_name!=null)?first_name:'First Name',
                                            hintStyle: TextStyle(

//                                            fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
//                                            letterSpacing: 1
                                            ),
                                          ),
                                          style: TextStyle(

//                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                            color: Color(0xff444b69),
//                                            letterSpacing: 1
                                          ),
                                          maxLines: 1,
                                          autofocus: false,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            new TextFormField(
                              controller: _descController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                hintText: 'Description',
                                hintStyle: TextStyle(

                                  fontSize: 16.0,
                                  color: Color(0xFF5a6381),
                                ),
//                                        suffixIcon: Container(
//                                          padding:
//                                          EdgeInsets.symmetric(vertical: 15),
//                                          child: SvgPicture.asset(
//                                            "assets/images/email.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                            height: 15,
//                                            width: 15,
//                                          ),
//                                        ),
                              ),
                              maxLines: 1,
                              autofocus: false,
                            ),
//                                    SizedBox(
//                                      height: 20,
//                                    ),
//                                    new Container(
//                                      child: Column(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding: const EdgeInsets.fromLTRB(
//                                                0.0, 8, 0, 0),
//                                            child: Text(
//                                              'Date of birth',
//                                              style: TextStyle(
//
//                                                color: Color(0xff444b69),
//                                                fontSize: 15,
////                                              fontWeight: FontWeight.w700
//                                              ),
//                                            ),
//                                          ),
//                                          new TextFormField(
//                                            decoration: new InputDecoration(
//                                              hintText: (date_of_birth != null)
//                                                  ? date_of_birth
//                                                  : dob,
//                                              hintStyle: style1,
//                                              suffixIcon: Container(
//                                                padding: EdgeInsets.symmetric(
//                                                    vertical: 15),
//                                                child: SvgPicture.asset(
//                                                  "assets/images/calendar.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                  height: 15,
//                                                  width: 15,
//                                                ),
//                                              ),
//                                            ),
//                                            expands: false,
//                                            showCursor: false,
//                                            textInputAction: TextInputAction.done,
//                                            readOnly: true,
//                                            maxLines: 1,
//                                            onTap: () {
//                                              DatePicker.showDatePicker(context,
////                                          minTime: DateTime.now(),
//                                                  showTitleActions: true,
//                                                  onChanged: (date) {
//                                                    dob = date.toString();
//                                                    setState(() {
//                                                      if(date.day<10) {
//                                                        dayString="0"+date.day.toString();
//                                                      }
//                                                      else {
//                                                        dayString=date.day.toString();
//                                                      }
//                                                      if(date.month<10) {
//                                                        monthString="0"+date.month.toString();
//                                                      }
//                                                      else {
//                                                        dayString=date.month.toString();
//                                                      }
//                                                      dob = dayString +
//                                                          '-' +
//                                                          monthString +
//                                                          '-' +
//                                                          date.year.toString();
////                                              print(dob);
//
//                                                    });
//                                                    print('change $date');
//                                                  }, onConfirm: (date) {
//                                                    print('confirm $date');
//
//                                                    setState(() {
//                                                      if(date.day<10) {
//                                                        dayString="0"+date.day.toString();
//                                                      }
//                                                      else {
//                                                        dayString=date.day.toString();
//                                                      }
//                                                      if(date.month<10) {
//                                                        monthString="0"+date.month.toString();
//                                                      }
//                                                      else {
//                                                        dayString=date.month.toString();
//                                                      }
//                                                      dob = dayString +
//                                                          '-' +
//                                                          monthString +
//                                                          '-' +
//                                                          date.year.toString();
////                                              print(dob);
//                                                    });
//                                                  },
//                                                  currentTime: DateTime.now(),
//                                                  locale: LocaleType.en);
//                                            },
//                                            autofocus: false,
//                                          ),
//                                        ],
//                                      ),
//                                    ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Private',
                                    style: TextStyle(
                                      color:
                                      Color(0xff444b69),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Switch(
                                      value: isPrivate,
                                      onChanged: (value) {
                                        setState(() {
                                          isPrivate = value;
                                          print(isPrivate);
                                        });
                                      },
                                      activeTrackColor: Colors.lightBlueAccent,
                                      activeColor: Color(0xff00adef),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Subscriber Private',
                                    style: TextStyle(
                                      color:
                                      Color(0xff444b69),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Switch(
                                      value: isSubscribers,
                                      onChanged: (value) {
                                        setState(() {
                                          isSubscribers = value;
                                          print(isSubscribers);
                                        });
                                      },
                                      activeTrackColor: Colors.lightBlueAccent,
                                      activeColor: Color(0xff00adef),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Playlist Private',
                                    style: TextStyle(
                                      color:
                                      Color(0xff444b69),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Switch(
                                      value: isPlaylist,
                                      onChanged: (value) {
                                        setState(() {
                                          isPlaylist = value;
                                          print(isPlaylist);
                                        });
                                      },
                                      activeTrackColor: Colors.lightBlueAccent,
                                      activeColor: Color(0xff00adef),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            new Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
                                    child: Text(
                                      'Select Cover Image',
                                      style: TextStyle(
                                        color: Color(0xFF5a6381),
                                        fontSize: 16,
//                                                  fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Flexible(child: new TextField(
                                        decoration: new InputDecoration(
                                          labelText: fileName,
                                          hintStyle: style1,
                                          suffixIcon: Icon(Icons.file_upload,color: Color(0xFF5a6381)),
                                        ),
                                        expands: false,
                                        showCursor: false,
                                        readOnly: true,
                                        maxLines: 1,
                                        autofocus: false,
                                        onTap: (){
                                          _displayDialog(context);
                                        },
                                      ),flex: 1,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            new Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
                                    child: Text(
                                      'Select Logo Image',
                                      style: TextStyle(
                                        color: Color(0xFF5a6381),
                                        fontSize: 16,
//                                                  fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Flexible(child: new TextField(
                                        decoration: new InputDecoration(
                                          labelText: fileNameTwo,
                                          hintStyle: style1,
                                          suffixIcon: Icon(Icons.file_upload,color: Color(0xFF5a6381)),
                                        ),
                                        expands: false,
                                        showCursor: false,
                                        readOnly: true,
                                        maxLines: 1,
                                        autofocus: false,
                                        onTap: (){
                                          _displayDialogTwo(context);
                                        },
                                      ),flex: 1,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            updateProfile();
                            if(!["", null, false, 0].contains(_nameController.text.toString())){
                              if(!["", null, false, 0].contains(_descController.text.toString()))
                              {
                                if(!["", null, false, 0,].contains(_imageFileTwo))
                                {
                                  if(!["", null, false, 0,].contains(_imageFile))
                                  {
                                    updateProfile();

                                  }else{

                                    Fluttertoast.showToast(
                                        msg: "Upload cover photo",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }

                                }else{

                                  Fluttertoast.showToast(
                                      msg: "Upload logo",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );

                                }


                              }else{

                                Fluttertoast.showToast(
                                    msg: "Please Enter Description",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );

                              }

                            }else{


                              Fluttertoast.showToast(
                                  msg: "Please Channel Name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                            }


                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: Card(
                              child: Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xee08c1f8),
                                  borderRadius: new BorderRadius.circular(10),
                                ),
                                height: 50.0, // height of the button
//                                      width: 120.0, // width of the button
                                child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(

                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
//                                    elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Visibility(
                visible: visible,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomPadding: true);
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
  _displayDialogTwo(BuildContext context) async {
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
                        captureImageTwo(ImageSource.camera);
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
                        captureImageTwo(ImageSource.gallery);
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
