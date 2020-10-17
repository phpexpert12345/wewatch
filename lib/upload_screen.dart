import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:thumbnails/thumbnails.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/add_video.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => new _UploadState();
}

class _UploadState extends State<Upload> {
  File _image;
  File _cameraImage;
  File _video;
  File _imageFile;
  File _videoFile;
  File _thumbnail;
  File _cameraVideo;
  List<int> bytevideo;
  bool videoVisible = false;
  String imageFileName;
  String videoFileName;
  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;


  Future<void> captureVideo(ImageSource imageSource) async {
    try {
      final videoFile = await ImagePicker.pickVideo(source: imageSource);
      setState(() {
        _videoFile = videoFile;

        bytevideo = videoFile.readAsBytesSync();
//        base64 = base64Encode(imageFile.readAsBytesSync());
        videoFileName = videoFile.path.split('/').last;
//        print(fileName + '------' + base64);
      });
    } catch (e) {
      print(e);
    }
  }


  Future uploadVideo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token=prefs.getString('access_token');
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
    var stream = new http.ByteStream(_video.openRead());
    // get file length
    var length = await _video.length();
    var request = http.MultipartRequest('POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/video'));
    request.fields["video_title"] = "Test Video";
    request.fields["video_description"] = "Test Video";
    request.fields["video_locality"] = "noida";
    request.fields["state_id"] = "1";
    request.fields["city_id"] = "1";
    request.fields["video_tag"] = "Tag";
    request.fields["video_category"] = "Category";
    request.files.add(await http.MultipartFile('video_thumb_image', stream, length, filename: imageFileName));
    request.files.add(await http.MultipartFile('video_file', stream, length, filename: videoFileName));
    request.headers.addAll(headers);
    var res = await request.send();
    if (res.statusCode == 200) {
      print("Video Uploaded");
    } else {
      print("Upload Failed");
    }
    res.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

//  Future<void> captureImage() async {
//    try {
//      final videoFile = await ImagePicker.pickVideo(source: ImageSource.gallery);
//      setState(() {
//        _video = videoFile;
//
////        byteimage=imageFile.readAsBytesSync();
////        base64 = base64Encode(imageFile.readAsBytesSync());
//        fileName = videoFile.path.split('/').last;
////        print(fileName + '------' + base64);
//      });
//    } catch (e) {
//      print(e);
//    }
//  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
//              width: double.infinity,
//              height: double.infinity,
//              child:  Image.asset("assets/images/on_bg_one.png",fit: BoxFit.fill,),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => AddVideo()));
                                        },
                                        child: Card(
                                          color: Color(0xff000000)
                                              .withOpacity(0.17),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 30, 0, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 0),
                                                        child: Center(
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                    Color(0xff08c1f8)
                                                                        .withOpacity(
                                                                            0.27),
                                                                    Color(0xff3017ed)
                                                                        .withOpacity(
                                                                            0.27)
                                                                  ]),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          50)),
//                                                 border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  height: 22,
                                                                  width: 22,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment.bottomCenter,
                                                                        colors: [
                                                                          Color(0xff08c1f8)
                                                                              .withOpacity(0.52),
                                                                          Color(0xff3017ed)
                                                                              .withOpacity(0.52)
                                                                        ]),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20)),
//                                                 border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient: LinearGradient(
                                                                              begin: Alignment.topCenter,
                                                                              end: Alignment.bottomCenter,
                                                                              colors: [
                                                                                Color(0xff08c1f8),
                                                                                Color(0xff3017ed)
                                                                              ]),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10)),
//                                                 border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                30.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Record',
                                                            style: TextStyle(

                                                              color: Color(
                                                                  0xff444b69),
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          color: Color(0xff000000)
                                              .withOpacity(0.17),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 30, 0, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 0),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            child: Image.asset(
                                                              "assets/images/go_live.png",
                                                              height: 30.0,
                                                              width: 30.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                30.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Go Live',
                                                            style: TextStyle(

                                                              color: Color(
                                                                  0xff444b69),
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {
//                      _pickVideo();
//                      _getImage(_video);
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => AddVideo()));
                                        },
                                        child: Card(
                                          color: Color(0xff000000)
                                              .withOpacity(0.17),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 30, 0, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 0),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            child: Image.asset(
                                                              "assets/images/outbox_blue.png",
                                                              height: 30.0,
                                                              width: 30.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                30.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Upload',
                                                            style: TextStyle(

                                                              color: Color(
                                                                  0xff444b69),
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
//                GridView.builder(
//                  physics: NeverScrollableScrollPhysics(),
//                  shrinkWrap: true,
//                  itemCount: 6,
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      childAspectRatio: 0.9, crossAxisCount: 3),
//                  itemBuilder: (BuildContext context, int index) {
//                    return Column(
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.all(5),
//                          child: Container(
//                            padding: EdgeInsets.all(0),
//                            decoration: BoxDecoration(
//                              //borderRadius: BorderRadius.circular(40.0),
//                              image: DecorationImage(
//                                image: AssetImage("assets/images/car_img.png"),
//                                fit: BoxFit.fill,
//                              ),
//                              color: Colors.transparent,
//                            ),
////                            width: 200.0,
//                            height: 120,
//                            child: Container(
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(10.0),
////                        image: DecorationImage(
////                          image: AssetImage("assets/images/card_background.png"),
////                          fit: BoxFit.fill,
////
////                        ),
//                                color: Colors.transparent,
//                              ),
//                              padding: EdgeInsets.all(0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Column(
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Align(
//                                          alignment:
//                                              FractionalOffset.bottomRight,
//                                          child: Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
//                                            child: Text(
//                                              '0.78',
//                                              style: TextStyle(
//                                                color: Colors.white,
//                                                fontSize: 13,
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    );
//                  },
//                ),
              ],
            ),

          ],
        ),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Upload",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text(''),
            ),
          ],
          selectedItemColor: Color(0xff00adef),
          unselectedItemColor: Colors.black54,
        ),
      ),
    );
  }

  List<int> generateNumbers() => List<int>.generate(30, (i) => i + 1);
}

