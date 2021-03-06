import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:video_trimmer/trim_editor.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:we_watch_app/home_page.dart';
import 'package:we_watch_app/home_page_two.dart';
import 'package:we_watch_app/ui/CreatePost/record_video_button.dart';
import 'package:we_watch_app/ui/GeoLocation/GeoLocation.dart';
import 'package:we_watch_app/util/UtilityClass.dart';

import '../../trim_video.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class CreatePost extends StatefulWidget {
  final userName;
  final userImage;
  CreatePost({@required this.userName,this.userImage});
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {



  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController controllerTitle = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();

  var _buttonText = 'Record Video';
  VideoPlayerController _videoPlayerController;
  File _video;
  File _storedVideoOne;
  File _storedVideoTwo;
  File _outputFile;
  String path;
  var recording;
  Size deviceSize;
  String videoName;
  String imageName;
  final Trimmer _trimmer = Trimmer();
  var uint8list;
  File _imageFile;
  File _videoFile;
  Geolocator geolocator;
  Position _currentPosition;
  String _currentAddress;
  String userCity,userState,userLocality,userPostalCode;
  String categoryName="Local News";
  double percentage = 0.0;
  List<int> byteimage;
  List<int> bytevideo;
  String base64 = '', imageFileName;
  String base64video = '', fileNameVideo;


  int rc = 1;
  int id = 0;
  int check = 0;
  bool audioplay = false;
  bool preview = false;

  @override
  void dispose(){
    _videoPlayerController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    preview = false;
    rc=1;
    id=0;
    check=0;
    audioplay=false;
    deleteFiles();
    // Permission.accessMediaLocation;
    Permission.microphone.request().whenComplete(() {
      print("permission granted");
      permissionsCamera();
    });

    super.initState();
  }
  Future<void> deleteFiles() async{
    if(await File("/storage/emulated/0/news_${id}.mp4").exists()){
      File("/storage/emulated/0/news_${id}.mp4").delete();
    }
    if(await File("/storage/emulated/0/mute_${id}.mp4").exists()){
      File("/storage/emulated/0/mute_${id}.mp4").delete();
    }
    if(await File("/storage/emulated/0/we_watch${id}.m4a").exists()){
      File("/storage/emulated/0/we_watch${id}.m4a").delete();
    }
  }
  permissionsCamera() async{
    await Permission.camera.request().whenComplete(() {
      permissionsStorage();
    });
  }
  permissionsStorage() async{
    await Permission.storage.request().whenComplete((){
      print("permission granted");
      deleteFiles();
    });
  }


  bool visible=false;
  // getThumbNail() async{
  //     uint8list = await VideoThumbnail.thumbnailData(
  //     video: _videoFile.path,
  //     imageFormat: ImageFormat.JPEG,
  //     maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //     quality: 25,
  //   );
  // }

  var scController=ScrollController();
  @override
  Widget build(BuildContext context) {
    deviceSize=MediaQuery.of(context).size;
    print(preview);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0)),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text('Create New News'),
        ),
        body: ListView(
          controller: scController,
          children: <Widget>[
            Container(
              //height: deviceSize.height,
              width: deviceSize.width,
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            maxRadius: 25,
                            backgroundImage:!["",null].contains(widget.userImage)? NetworkImage(widget.userImage,):Image.asset("assets/images/logo_splash.png"),
                          ),
                          title: Text(widget.userName!=null?widget.userName:"",style: new TextStyle(fontSize:18 ),),
                        ),
                      ),
                      preview
                          ? _videoFile != null
                              ? AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: VideoPlayer(_videoPlayerController),
                                )
                              : Container()
                          : Container(
                              //height: 150,
                              margin: EdgeInsets.only(left: 5.0,right: 5.0),
                              decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                        left: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                        right: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                        bottom: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR)
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8.0))

                              ),
                              child: TextFormField(
                                maxLines: 2,
                                cursorColor: Colors.black,
                                controller: controllerTitle,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15, bottom: 11, top: 11, right: 15),
                                    hintText: "Video title ",
                                hintStyle: new TextStyle(color: Colors.black45)),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(50),
                                ],
                              ),
                            ),
                      SizedBox(height: 5.0,),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,right: 5.0),
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                left: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                right: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR),
                                bottom: BorderSide(color: COLORS.CONTAINER_BORDER_COLOR)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                          ),
                        child: TextFormField(
                          maxLines: 5,
                          cursorColor: Colors.black,
                          controller: controllerDescription,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Video description ',
                              hintStyle: new TextStyle(color: Colors.black45)),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(200),
                          ],
                        ),

                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      _videoFile!=null && recording!=null ? Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 10),

                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() async{
                                String filePath='/storage/emulated/0/news_${id}.mp4';
                                if(_videoFile!=null){
                                  if(!await File('/storage/emulated/0/news_${id}.mp4').exists())
                                      await _videoMerger();
                                  _videoPlayerController = VideoPlayerController.file(
                                      File('/storage/emulated/0/news_${id}.mp4'))
                                    ..initialize().then((_) {
                                      setState(() {
                                        _videoPlayerController.play();
                                        _videoFile = File('/storage/emulated/0/news_${id}.mp4');
                                        fileNameVideo=_videoFile.path.split('/').last;
                                        preview = true;
                                      });
                                    }, onError: (g) {
                                      if (check == 1) {
                                        Fluttertoast.showToast(
                                          msg: 'Wait video uploading',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Add required parameters',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      }
                                    });
                                } else {
                                  check=1;
                                  filePath = _videoFile.path;
                                  _videoPlayerController =
                                  VideoPlayerController.file(
                                      File(filePath))
                                    ..initialize().then((_) {
                                      setState(() {
                                        _videoPlayerController.play();
                                        //_videoFile = File(filePath);
                                        preview = true;
                                      });
                                    }, onError: (g) {
                                      if (check == 1) {
                                        Fluttertoast.showToast(
                                          msg: 'Wait video uploading',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Add required parameters',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      }
                                    });
                                }
                              }
                              );

                            },
                            child: Text("Preview",style: new TextStyle(fontSize: 16,color: Colors.white),),
                          ),
                        ),
                      ):Container(),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('tap');
                          //_recordVideo();
                          // Navigator.push(context, new MaterialPageRoute(builder: (context)=> CustomCamraScreen()));
                          showBottomDialogAddVideo("Video");
                        },
                        child: Stack(
                          children: [
                            ListTile(
                              trailing: IconButton(
                                onPressed: (){
                                  showBottomDialogAddVideo("Video");
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.blue,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Add Video'),
                                  //Text(fileNameVideo!=null?fileNameVideo:"",style: new TextStyle(fontSize: 12,color: Colors.black45),)
                                  _videoFile!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container()
                                ],
                              ),
                              leading: Icon(
                                Icons.video_call,
                                color: Colors.black,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.center,
                                child: Visibility(
                                  visible: visible,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Divider(
                        color: Colors.black26,
                      ),

                      GestureDetector(
                        onTap: (){
                          showBottomDialogAddVideo("Image");
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Image'),
                              imageFileName!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container()

                            ],
                          ),
                          trailing: IconButton(
                            onPressed: (){
                              showBottomDialogAddVideo("Image");
                            },
                            icon:Icon(Icons.add_circle_outline),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      ListTile(
                        trailing: Visibility(
                          visible: audioplay ? false : true,
                          replacement: IconButton(
                            onPressed: () {
                              _stop();
                              setState(() {
                                audioplay = !audioplay;
                              });
                            },
                            icon: Icon(
                              Icons.stop,
                              color: Colors.red,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if(visible){
                                UtilityClass.showMsg("Please wait...");
                              }else if(_videoFile==null){
                                UtilityClass.showMsg("Please add video file first");
                              }else {
                                _start();
                                setState(() {
                                  audioplay = !audioplay;
                                  //preview=true;
                                  print(DateTime
                                      .now()
                                      .millisecondsSinceEpoch
                                      .toString());

                                  // if(_isRecording){
                                  _videoPlayerController =
                                  VideoPlayerController.file(
                                      File(
                                          '/storage/emulated/0/mute_${id}.mp4'))
                                    ..initialize().then((_) {
                                      setState(() {
                                        _videoPlayerController.play();
                                        // _videoFile = File('/storage/emulated/0/mute_${id}.mp4');
                                        preview = true;
                                      });
                                    }, onError: (g) {
                                      if (check == 1) {
                                        Fluttertoast.showToast(
                                          msg: 'Wait video uploading',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Add required parameters',
                                          backgroundColor: Colors.redAccent,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
                                        );
                                      }
                                    });
                                  // }
                                });
                              }


                            },
                            icon: Icon(
                              Icons.play_circle_outline,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Voice Recording'),
                            Row(
                              children: [
                                recording!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container(),
                                audioLength!=null ? Text(audioLength+" seconds",style: new TextStyle(color: Colors.black45),):Container()
                              ],
                            )

                          ],
                        ),
                        leading: Icon(
                          Icons.mic,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      GestureDetector(
                        onTap: () async{
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => GeoLocation()));
                          try {
                            Prediction pr = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: "AIzaSyAfySREHfRw2x8bEFT6b7Nc4z3Te80LiyI",
                                language: "en",
                                components: [Component(Component.country, "in"),
                                ],
                                hint: "Enter your area" ,
                                logo: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text("Enter your area",style: new TextStyle(fontSize: 16),textAlign: TextAlign.center,)));
                            _getLatLng(pr);
                            print("place id=>" + pr.placeId);
                          }catch(ex){

                          }

                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Location'),
                              //loca!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container()

                            ],
                          ),
                          trailing: IconButton(
                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => GeoLocation()));
                            },
                           icon:Icon(Icons.add_circle_outline),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: preview ? false : true,
                        replacement: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          //height: MediaQuery.of(context).size.height*.5,
                          child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  //id = 1;
                                  //check = 0;
                                  preview = false;
                                  _videoPlayerController.pause();
                                  //_videoPlayerController.dispose();
                                  // for (int i = 1; i <= id; i++) {
                                  //   print(i);
                                  //   File('/storage/emulated/0/we_watch${i}.m4a').delete();
                                  //   File('/storage/emulated/0/mute_${i}.mp4').delete();
                                  // }
                                  // File('/storage/emulated/0/news_${id}.mkv').delete();
                                  //Navigator.of(context).pop();
                                });
                              },
                              child: Text(
                                'Close Preview',
                                style: TextStyle(color: Colors.black,fontSize: 20),
                              )),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () async{

                              postData();    //Api call
                            },
                            child: Text(
                              'Post',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Positioned(child: Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 20,right: 10),
                  //     color: Colors.black45,
                  //     height: 150,
                  //     width: 90,
                  //     child: _videoFile!=null? getThumbNail():Container(),
                  //   ),
                  //
                  // ))

                ],
              ),
            ),

            // RecordVideoButton(_recordVideo, _buttonText),
            // Container(
            //   child: Column(
            //     children: <Widget>[
            //       Container(
            //         width: double.infinity,
            //         child: FlatButton(
            //           color: Colors.lightBlue,
            //           onPressed: () {
            //             // _pickVideo();
            //             _stop();
            //           },
            //           child: Text("Stop"),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         child: FlatButton(
            //           color: Colors.lightBlue,
            //           onPressed: () {
            //             // _pickVideo();
            //             combine();
            //           },
            //           child: Text("Combine"),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         child: FlatButton(
            //           color: Colors.lightBlue,
            //           onPressed: () {
            //             _pickVideo();
            //           },
            //           child: Text("pickup"),
            //         ),
            //       ),
            //       if (_video != null)
            //         _videoPlayerController.value.initialized
            //             ? AspectRatio(
            //                 aspectRatio: 16 / 9,
            //                 child: VideoPlayer(_videoPlayerController),
            //               )
            //             : Container()
            //       else
            //         Container(
            //           width: double.infinity,
            //           child: FlatButton(
            //             color: Colors.lightBlue,
            //             onPressed: () {
            //               // _pickVideo();
            //               _start();
            //             },
            //             child: Text("start"),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  showTrimAlert() async{
    showDialog(context: context,
    builder: (BuildContext cntxt){
      return AlertDialog(
        title: Text("You want to trim/ crop the video ?"),
        actions: [
          RaisedButton(
            onPressed: () async{
              Navigator.pop(cntxt);
              //await loadTrimmer(_videoFile);
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text("Yes"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pop(cntxt);
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("No"),
          ),
        ],
      );
    });
  }

  void _getLatLng(Prediction prediction) async {
    try {
      GoogleMapsPlaces _places = new
      GoogleMapsPlaces(
          apiKey: "AIzaSyAfySREHfRw2x8bEFT6b7Nc4z3Te80LiyI"); //Same API_KEY as above
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(prediction.placeId);
      double latitude = detail.result.geometry.location.lat;
      double longitude = detail.result.geometry.location.lng;
      String address = prediction.description;
      print("lati " + latitude.toString() + " langi " + longitude.toString());
      _getAddressFromLatLng(latitude, longitude);
    }catch(e){
      debugPrint(e);
    }
  }

  showBottomDialogAddVideo(String s){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (BuildContext cntxt){
        return Container(
          height: deviceSize.height*.4,
          width: deviceSize.width*.85,
          margin: EdgeInsets.only(bottom: 20,left: 50,right: 50),
          child: Stack(
            children: [
              Positioned(child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:5.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add_outlined,color: Colors.blue,size: 30,)),
                      Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: Text("Add "+ s +" From", style: new TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              )),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      height: deviceSize.height*.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          s.trim().compareTo("Image")==0?Expanded(
                              child: GestureDetector(
                            onTap: () async{
                              // if(s.trim().compareTo("Video")==0){
                              //   Navigator.pop(cntxt);
                              //   //captureVideo(ImageSource.camera);
                              //   await _recordVideo();
                              //   //Navigator.push(context, new MaterialPageRoute(builder: (context)=>CustomCamraScreen()));
                              // } else
                                if(s.trim().compareTo("Image")==0){
                                Navigator.pop(cntxt);
                                captureImage(ImageSource.camera);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Camera",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ),
                          )):Container(),
                          Divider(color: Colors.grey.shade300,thickness: 2,),
                          Expanded(child: GestureDetector(
                            onTap: () async{
                              if(s.trim().compareTo("Video")==0){
                                Navigator.pop(cntxt);
                                await videoFromGallery();
                              }else if(s.trim().compareTo("Image")==0){
                                Navigator.pop(cntxt);
                                captureImage(ImageSource.gallery);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Gallery",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ),
                          )),
                          Divider(color: Colors.grey.shade300,thickness: 2,),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(cntxt);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Close",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Icon(Icons.cancel_outlined,size: 22,)
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    });
  }

  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFile = imageFile;
        byteimage = imageFile.readAsBytesSync();
        base64 = base64Encode(imageFile.readAsBytesSync());
        imageFileName = imageFile.path.split('/').last;
        print(imageFileName + '------' + base64);
      });
    } catch (e) {
      print(e);
    }
  }
  Future<void> captureVideo(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickVideo(source: imageSource);
      setState(() {
        _videoFile = imageFile;
        byteimage = imageFile.readAsBytesSync();
        base64 = base64Encode(imageFile.readAsBytesSync());
        fileNameVideo = imageFile.path.split('/').last;
        print(imageFileName + '------' + base64);
        if(_videoFile!=null)
          createVideoMuteFile();
      });
    } catch (e) {
      print(e);
    }
  }

  // void _pickVideo() async {
  //   File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
  //
  //   print(_video.path);
  //   _videoMerger();
  // }


  // it will override audio of video file
  void _videoMerger() async {
    try {
      if (_videoFile != null) {
        setState(() {
          visible=true;
        });
        final fDelete = '/storage/emulated/0/news_${id}.mp4';
        if(await File(fDelete).exists() ){
            File(fDelete).delete();
        }
        var _video = File('/storage/emulated/0/mute_${id}.mp4');
        print("videopath"+_video.path);
        final appDir = await syspaths.getApplicationDocumentsDirectory();
        String rawDocumentPath = appDir.path;
        final outputPath = '$rawDocumentPath/output.mp4';
        final op = '/storage/emulated/0/news_${id}.mp4';
        final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
        print('we_watch' + outputPath);  //  -i video.mp4 -i audio.wav -map 0:v -map 1:a -c:v copy -shortest output.mp4
        String commandToExecute =    //"-i video.mp4 -i audio.mp4 -c copy output.mp4"
            '-y -i ${_video.path} -i ${recording.path} -c:v copy -c:a aac ${op}';//-map 0:v -map 1:a -c:v copy -shortest ${op}';  //-i v.mp4 -i a.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4
        // '-y -i ${_storedVideoOne.path} -an ${op}';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        _flutterFFmpeg.execute(commandToExecute).then((r) {
          setState(() {
            rc = r;
              visible=false;
              _videoFile=new File(op);
              _videoPlayerController.pause();
              fileNameVideo=_videoFile.path.split('/').last;
              //_videoPlayerController.dispose();
              _videoPlayerController.initialize();
          });
        });
      }else{
        UtilityClass.showMsg("Please add video file first");
      }
    }catch(ex){
      print("sk exception"+ex);
      setState(() {
        visible=false;
      });
    }
  }

// This funcion will helps you to pick a Video File

  _start() async {
    await Permission.storage.request();

    await Permission.microphone.request().whenComplete(() async {
      if (id > 0) {
        for (int i = 1; i <= id; i++) {
          File('/storage/emulated/0/we_watch${i}.m4a').delete();
        }
      }
      if(await File('/storage/emulated/0/we_watch${id}.m4a').exists()){
        File('/storage/emulated/0/we_watch${id}.m4a').delete();

      }

      await AudioRecorder.start(
          path: '/storage/emulated/0/we_watch${id}',
          audioOutputFormat: AudioOutputFormat.AAC);
     // id = id + 1;
      bool isRecording = await AudioRecorder.isRecording;
      setState(() {
        _recording = new Recording(duration: new Duration(), path: "");
        _isRecording = isRecording;
      });
      print(id);
    });
  }

  _stop() async {

    recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    var  info= await videoInfo.getVideoInfo(recording.path);
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
      check = 1;
      audioLength=((info.duration.round()/1000)%60).toString();
      //if(_videoPlayerController.play().)
    //  _videoPlayerController.pause();
      preview=false;
      if(recording.path!=null && _videoFile!=null){
        //createVideoMuteFile();
        _videoMerger();
      }
    });
    print(recording.path);
  }

  // void combine() {
  //   _videoMerger();
  // }

  final videoInfo = FlutterVideoInfo();
  String audioLength;
  Future<String> _recordVideo() async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String rawDocumentPath = appDir.path;
    final outputPath = '$rawDocumentPath/output.mp4';
    ImagePicker.pickVideo(source: ImageSource.camera)
        .then((File recordedVideo) {
      setState(() {
        _buttonText = 'Saving in Progress...';
      });
      GallerySaver.saveVideo(recordedVideo.path).then((_) {
        setState(() {
          final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
          visible=true;
          _buttonText = 'Video Saved!\n\nClick to Record New Video';
          // var  info= await videoInfo.getVideoInfo(recordedVideo.path);
          // print("length=+"+info.duration.toString());
          _videoFile = recordedVideo;
          fileNameVideo=_videoFile.path.split('/').last;
          createVideoMuteFile();
        });
      });
    });
  }
  loadTrimmer(File f) async{
    if (f.path != null) {
      await _trimmer.loadVideo(videoFile: File(f.path));
      var trimFile= await  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrimmerView(_trimmer)));
      print("trim"+trimFile);
      if(trimFile!=null){
        setState(() {
          _videoFile=new File(trimFile);
          //if(recording!=null)
            createVideoMuteFile();

        });
      }else {
        createVideoMuteFile();
      }
    }
  }

  Future<void> videoFromGallery() async {
    try {
      var videoFile = await ImagePicker.pickVideo(source: ImageSource.gallery,);

//      videoFile = await videoFile.rename("${_videoFile.path}.mp4");
      setState(() async {
        _videoFile = videoFile;
        bytevideo = videoFile.readAsBytesSync();
        base64video = base64Encode(videoFile.readAsBytesSync());
        fileNameVideo = videoFile.path.split('/').last;
        final letter = 'jpg';
        final newLetter = 'mp4';
        fileNameVideo = fileNameVideo.replaceAll(letter, newLetter);
        print(fileNameVideo + '------' + base64video);
        //createVideoMuteFile();
        if(_videoFile.path!=null){
           //await showTrimAlert();
           loadTrimmer(_videoFile);

        }
      });
      //showTrimAlert();
      //await loadTrimmer(_videoFile);

    } catch (e) {
      print(e);
    }
  }



  createVideoMuteFile() async{
    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
    final op = '/storage/emulated/0/mute_${id}.mp4';
    if(await File(op).exists()){
      File(op).delete();
    }
    setState(() {
      _buttonText = 'Video Saved!\n\nClick to Record New Video';
      visible=true;
      if (_videoFile == null) {
        String commandToExecute =
        // '-y -i ${_storedVideoOne.path} -i ${recording.path} -c:v copy -c:a aac ${op}';
            '-y -i ${_videoFile.path} -an ${op}';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        _flutterFFmpeg
            .execute(commandToExecute)
            .then((rc) {
              setState(() {
                visible=false;
              });
          print("FFmpeg process exited with rc mute file created $rc");
        });
        print('video 1 done');
      } else {
        String commandToExecute =
        // '-y -i ${_storedVideoOne.path} -i ${recording.path} -c:v copy -c:a aac ${op}';
            '-y -i ${_videoFile.path} -an ${op}';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
        // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        _flutterFFmpeg.execute(commandToExecute).then((rc) {
          if (rc == 0) {
            print(rc);
            setState(() {
              visible=false;

            });

          }
        });
      }
    });
  }


  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      geolocator = Geolocator();
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          latitude,longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        print("sunny District "+place.locality+" state " +place.administrativeArea+" country "+place.country +"pin code"+place.postalCode);
        userCity=place.locality;
        userState=place.administrativeArea;
        userLocality=place.country;
        userPostalCode=place.postalCode;
      });
     // UtilityClass.showMsg("District "+place.locality+" state " +place.administrativeArea+" country "+place.country );

    } catch (e) {
      print(e);
      print("locality exception"+e.toString());
    }
  }



  postData(){
    // updateProfile();

    if (![
      "",
      null,
      false,
      0
    ].contains(controllerTitle.text.toString())) {
      if (!["", null, false, 0].contains(
          controllerDescription.text.toString())) {
        if (![
          "",
          null,
          false,
          0,
        ].contains(userState)) {
          if (![
            "",
            null,
            false,
            0,
          ].contains(userCity)) {
            if (![
              "",
              null,
              false,
              0,
            ].contains(
                userLocality)) {
              if (![
                "",
                null,
                false,
                0,
              ].contains(categoryName)) {
                if (![
                  "",
                  null,
                  false,
                  0,
                ].contains(_videoFile)) {
                  if(!["",null].contains(_imageFile)){

                    FocusScope.of(context)
                        .requestFocus(FocusNode());

                    ProgressDialog pr;
                    pr = ProgressDialog(
                      context,
                      // customBody: LinearProgressIndicator(
                      //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      //   backgroundColor: Colors.white,
                      // ),
                    );
                    pr.show();
                    updateProfile();
                    Future.delayed(Duration(seconds: 2))
                        .then((onvalue) {
                      percentage = percentage + 10.0;
                      print(percentage);

                      pr.update(
                        progress: percentage,
                        message:
                        "Uploading...${percentage}",
                        progressWidget: Container(
                            padding: EdgeInsets.all(8.0),
                            child:
                            CircularProgressIndicator()),
                        maxProgress: 100.0,
                        progressTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400),
                        messageTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600),
                      );

                      Future.delayed(Duration(seconds: 2))
                          .then((value) {
                        Future.delayed(Duration(seconds: 2))
                            .then((value) {
                          percentage = percentage + 10.0;
                          pr.update(
                              progress: percentage,
                              message:
                              "Uploading...${percentage}");
                          print(percentage);
                          Future.delayed(
                              Duration(seconds: 2))
                              .then((value) {
                            percentage = percentage + 10.0;
                            pr.update(
                                progress: percentage,
                                message:
                                "Uploading...${percentage}");
                            print(percentage);
                            Future.delayed(
                                Duration(seconds: 2))
                                .then((value) {
                              percentage =
                                  percentage + 10.0;
                              pr.update(
                                  progress: percentage,
                                  message:
                                  "Uploading...${percentage}");
                              print(percentage);
                              Future.delayed(
                                  Duration(seconds: 2))
                                  .then((value) {
                                percentage =
                                    percentage + 10.0;
                                pr.update(
                                    progress: percentage,
                                    message:
                                    "Uploading...${percentage}");
                                print(percentage);
                                Future.delayed(Duration(
                                    seconds: 2))
                                    .then((value) {
                                  percentage =
                                      percentage + 10.0;
                                  pr.update(
                                      progress: percentage,
                                      message:
                                      "Uploading...${percentage}");
                                  print(percentage);
                                  Future.delayed(Duration(
                                      seconds: 2))
                                      .then((value) {
                                    percentage =
                                        percentage + 10.0;
                                    pr.update(
                                        progress:
                                        percentage,
                                        message:
                                        "Uploading...${percentage}");
                                    print(percentage);
                                    Future.delayed(Duration(
                                        seconds: 2))
                                        .then((value) {
                                      percentage =
                                          percentage + 10.0;
                                      pr.update(
                                          progress:
                                          percentage,
                                          message:
                                          "Uploading...${percentage}");
                                      print(percentage);
                                      Future.delayed(
                                          Duration(
                                              seconds:
                                              2))
                                          .then((value) {
                                        percentage =
                                            percentage +
                                                10.0;
                                        pr.update(
                                            progress:
                                            percentage,
                                            message:
                                            "Uploading...${percentage}");
                                        print(percentage);
                                        percentage =
                                            percentage +
                                                10.0;
                                        pr.update(
                                            progress:
                                            percentage,
                                            message:
                                            "Almost done...");
                                        print(percentage);
                                        Future.delayed(
                                            Duration(
                                                seconds:
                                                2))
                                            .then((value) {
                                          percentage =
                                              percentage +
                                                  10.0;
                                          pr
                                              .hide()
                                              .whenComplete(
                                                  () async{
                                                    if(await File('/storage/emulated/0/news_${id}.mp4').exists()){
                                                    new File('/storage/emulated/0/news_${id}.mp4').copy("/storage/emulated/0/${controllerTitle.text.isNotEmpty?controllerTitle.text:""+"_"+DateTime.now().millisecondsSinceEpoch.toString()}.mp4");
                                                    }
                                                print(pr
                                                    .isShowing());
                                                Navigator
                                                    .pushReplacement(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder:
                                                          (context) =>
                                                          HomePageTwo()),
                                                );
                                              });
                                        });
                                      });
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                    print("Done");
                  }else{
                    Fluttertoast.showToast(
                        msg: "Please add image file",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 10,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Please add video file",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 10,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              } else {
                Fluttertoast.showToast(
                    msg: "Please enter category",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 10,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }

              //getToekn();

            } else {
              Fluttertoast.showToast(
                  msg: "Please Enter Locality",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          } else {
            Fluttertoast.showToast(
                msg: "Select City",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          //getToekn();

        } else {
          Fluttertoast.showToast(
              msg: "Select State",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Please Enter Description",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Enter Title",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

//                    setPersonalData();
  }

  Future updateProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String access_token = prefs.getString('access_token');
      setState(() {
        //visible = true;
      });
      Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
      var stream = new http.ByteStream(_imageFile.openRead());
      var streamVideo = new http.ByteStream(_videoFile.openRead());
      // get file length
      var length = await _imageFile.length();
      var lengthVideo = await _videoFile.length();
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/video'));
      request.fields["video_title"] = controllerTitle.text;
      request.fields["video_description"] = controllerDescription.text;
      request.fields["video_locality"] =
          userLocality; // _localityController.text;
      request.fields["state_name"] =userState;// 14.toString(); //// _myselection2;
      request.fields["city_name"] =userCity;// 1208.toString();// _mySelection;
      request.fields["video_tag"] = "news"; // _videoTagController.text;
      request.fields["video_category"] = "reporter"; //categoryName;   //
      request.fields["pincode"]=  userPostalCode;// postal_code
      request.files.add(await http.MultipartFile(
          'video_thumb_image', stream, length,
          filename: imageFileName));
      request.files.add(await http.MultipartFile(
          'video_file', streamVideo, lengthVideo,
          filename: fileNameVideo));
      request.headers.addAll(headers);
      var response = await request.send();

      if (response.statusCode == 200) {
        // setState(() {
        //   // visible = false;
        // });
        // Navigator
        //     .pushReplacement(
        //   context,
        //   CupertinoPageRoute(
        //       builder:
        //           (context) =>
        //           HomePageTwo()),
        // );
        Fluttertoast.showToast(
            msg: "Your video uploaded successfully!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        // setState(() {
        //   // visible = false;
        // });
        Fluttertoast.showToast(
            msg: "Failed!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Upload Failed");
      }
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }
    catch(ex){
      print(ex);
    }
  }

}


class CustomCamraScreen extends StatefulWidget{
  @override
  CustomCameraState createState() => new CustomCameraState();

}

class CustomCameraState extends State<CustomCamraScreen>{


  CameraController controller;
  String videoPath;

  List<CameraDescription> cameras;
  int selectedCameraIdx;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Get the listonNewCameraSelected of available cameras.
    // Then set the first camera as selected.
    availableCameras()
        .then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
      }
    })
        .catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Camera example'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _cameraTogglesRowWidget(),
                _captureControlRowWidget(),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,
            icon: Icon(
                _getCameraLensIcon(lensDirection)
            ),
            label: Text("${lensDirection.toString()
                .substring(lensDirection.toString().indexOf('.')+1)}")
        ),
      ),
    );
  }

  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.videocam),
              color: Colors.blue,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo
                  ? _onRecordButtonPressed
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              color: Colors.red,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  controller.value.isRecordingVideo
                  ? _onStopButtonPressed
                  : null,
            )
          ],
        ),
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx = selectedCameraIdx < cameras.length - 1
        ? selectedCameraIdx + 1
        : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey,
            textColor: Colors.white
        );
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {
        File(videoPath).copy("/storage/emulated/0/sk.mp4");
      });
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

}




