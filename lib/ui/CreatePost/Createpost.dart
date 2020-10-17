import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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

int rc = 1;
int id = 0;
int check = 0;
bool audioplay = false;
bool preview = false;

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
  TextEditingController _controller = new TextEditingController();
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
  getThumbNail() async{
      uint8list = await VideoThumbnail.thumbnailData(
      video: _videoFile.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
  }

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
          children: <Widget>[
            Stack(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Image.network(widget.userImage),
                        ),
                        title: Text(widget.userName!=null?widget.userName:"",style: new TextStyle(fontSize:18 ),),
                      ),
                    ),
                    preview
                        ? _video != null
                            ? AspectRatio(
                                aspectRatio: 16 / 9,
                                child: VideoPlayer(_videoPlayerController),
                              )
                            : Container()
                        : Container(
                            height: 150,
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
                              maxLines: 15,
                              cursorColor: Colors.black,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: 'What is your mind '+widget.userName +"?",
                              hintStyle: new TextStyle(color: Colors.black45)),
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
                        maxLines: 2,
                        cursorColor: Colors.black,
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
                    GestureDetector(
                      onTap: () {
                        print('tap');
                        //_recordVideo();
                        // Navigator.push(context, new MaterialPageRoute(builder: (context)=> CustomCamraScreen()));
                        showBottomDialogAddVideo("Video");
                      },
                      child: ListTile(
                        trailing: Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Video'),
                            //Text(fileNameVideo!=null?fileNameVideo:"",style: new TextStyle(fontSize: 12,color: Colors.black45),)
                            fileNameVideo!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container()
                          ],
                        ),
                        leading: Icon(
                          Icons.video_call,
                          color: Colors.black,
                        ),
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
                            fileName!=null?Icon(Icons.check_circle,size: 18,color: Colors.green.shade500,):Container()

                          ],
                        ),
                        trailing: Icon(
                          Icons.add_circle_outline,
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
                        replacement: GestureDetector(
                          onTap: () {
                            _stop();
                            setState(() {
                              audioplay = !audioplay;
                            });
                          },
                          child: Icon(
                            Icons.stop,
                            color: Colors.red,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _start();
                            setState(() {
                              audioplay = !audioplay;
                              print(DateTime.now().millisecondsSinceEpoch.toString());
                            });
                          },
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      title: Text('Add Voice Recording'),
                      leading: Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      title: Text('Add Location'),
                      trailing: GestureDetector(
                        onTap: (){
                          _getCurrentLocation();
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => GeoLocation()));
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: preview ? false : true,
                      replacement: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              setState(() {
                                id = 1;
                                check = 0;
                                preview = false;
                                for (int i = 1; i <= id; i++) {
                                  print(i);
                                  File('/storage/emulated/0/sundar${i}.m4a').delete();
                                  File('/storage/emulated/0/mute_${i}.mp4').delete();
                                }
                                File('/storage/emulated/0/news_${id}.mkv').delete();
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text(
                              'Post',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {
                            setState(() {
                              combine();

                              _videoPlayerController = VideoPlayerController.file(
                                  File('/storage/emulated/0/news_${id}.mkv'))
                                ..initialize().then((_) {
                                  setState(() {});
                                  _videoPlayerController.play();
                                  _video = File('/storage/emulated/0/news_${id}.mkv');
                                  preview = true;
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
                            });

                            // confirmationDialog();
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
                          Expanded(child: GestureDetector(
                            onTap: () async{
                              if(s.trim().compareTo("Video")==0){
                                Navigator.pop(cntxt);
                                await _recordVideo();
                              } else if(s.trim().compareTo("Image")==0){
                                Navigator.pop(cntxt);
                                captureImage(ImageSource.camera);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Camera",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ),
                          )),
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
        fileName = imageFile.path.split('/').last;
        print(fileName + '------' + base64);
      });
    } catch (e) {
      print(e);
    }
  }

  void _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);

    print(_video.path);
    _videoMerger();
  }


  // it will override audio of video file
  void _videoMerger() async {
    _video = File('/storage/emulated/0/mute_${id}.mp4');
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String rawDocumentPath = appDir.path;
    final outputPath = '$rawDocumentPath/output.mp4';
    final op = '/storage/emulated/0/news_${id}.mkv';
    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
    print('sundar' + outputPath);
    String commandToExecute =
        '-y -i ${_video.path} -i ${recording.path} -c:v copy -c:a aac ${op}';
    // '-y -i ${_storedVideoOne.path} -an ${op}';
    // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
    // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
    _flutterFFmpeg.execute(commandToExecute).then((r) {
      setState(() {
        rc = r;
      });
    });
  }

// This funcion will helps you to pick a Video File

  _start() async {
    await Permission.storage.request();

    await Permission.microphone.request().whenComplete(() async {
      if (id > 0) {
        for (int i = 1; i <= id; i++) {
          File('/storage/emulated/0/sundar${i}.m4a').delete();
        }
      }
      id = id + 1;
      await AudioRecorder.start(
          path: '/storage/emulated/0/sundar${id}',
          audioOutputFormat: AudioOutputFormat.AAC);

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

    setState(() {
      _recording = recording;
      _isRecording = isRecording;
      check = 1;
    });
    print(recording.path);
  }

  void combine() {
    _videoMerger();
  }

  Future<String> _recordVideo() async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String rawDocumentPath = appDir.path;
    final outputPath = '$rawDocumentPath/output.mp4';
    final op = '/storage/emulated/0/mute_${id}.mp4';
    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
    ImagePicker.pickVideo(source: ImageSource.camera)
        .then((File recordedVideo) {
      setState(() {
        _buttonText = 'Saving in Progress...';
      });
      GallerySaver.saveVideo(recordedVideo.path).then((_) {
        print("path"+recordedVideo.path);
        loadTrimmer(recordedVideo);
        setState(() {
          _buttonText = 'Video Saved!\n\nClick to Record New Video';
          if (_storedVideoOne == null) {
            _storedVideoOne = recordedVideo;
            String commandToExecute =
                // '-y -i ${_storedVideoOne.path} -i ${recording.path} -c:v copy -c:a aac ${op}';
                '-y -i ${_storedVideoOne.path} -an ${op}';
            // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
            // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
            _flutterFFmpeg
                .execute(commandToExecute)
                .then((rc) => print("FFmpeg process exited with rc $rc"));
            print('video 1 done');
          } else {
            _storedVideoOne = recordedVideo;
            String commandToExecute =
                // '-y -i ${_storedVideoOne.path} -i ${recording.path} -c:v copy -c:a aac ${op}';
                '-y -i ${_storedVideoOne.path} -an ${op}';
            // setState(() {
            //   fileNameVideo="${op}";
            //
            // });
            // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
            // '-y -i ${_storedVideoOne.path} -i ${_storedVideoTwo.path} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
            _flutterFFmpeg.execute(commandToExecute).then((rc) {
              if (rc == 0) {
                print(rc);
              }
            });
          }
        });
      });
    });

  }
  loadTrimmer(File f) async{

    if (f != null) {
      await _trimmer.loadVideo(videoFile: File(f.path));
      var sk= await  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrimmerView(_trimmer)));
      if(sk!=null){
        setState(() {
          _videoFile=new File(sk);
        });
      }
    }
  }
  File _imageFile;
  File _videoFile;

  List<int> byteimage;
  List<int> bytevideo;
  String base64 = '', fileName;
  String base64video = '', fileNameVideo;
  Future<void> videoFromGallery() async {
    try {
      var videoFile = await ImagePicker.pickVideo(source: ImageSource.gallery);
//      videoFile = await videoFile.rename("${_videoFile.path}.mp4");
      setState(() {
        _videoFile = videoFile;
        bytevideo = videoFile.readAsBytesSync();
        base64video = base64Encode(videoFile.readAsBytesSync());
        fileNameVideo = videoFile.path.split('/').last;
        final letter = 'jpg';
        final newLetter = 'mp4';
        fileNameVideo = fileNameVideo.replaceAll(letter, newLetter);
        print(fileNameVideo + '------' + base64video);
      });
      await loadTrimmer(_videoFile);

    } catch (e) {
      print(e);
    }
  }


  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        print("sunny District "+place.locality+" state " +place.administrativeArea+" country "+place.country );
      });
      UtilityClass.showMsg("District "+place.locality+" state " +place.administrativeArea+" country "+place.country );

    } catch (e) {
      print(e);
      print("sunny locality exception"+e.toString());
    }
  }

}


class CustomCamraScreen extends StatefulWidget{
  @override
  CustomCameraState createState() => new CustomCameraState();

}

class CustomCameraState extends State<CustomCamraScreen>{
  Size deviceSize;
  @override
  Widget build(BuildContext context) {
    deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: deviceSize.height*.2,
            width: deviceSize.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.flash_auto,color: Colors.white54,size: 30,),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(

            ),
          ),
          Container(
            height: deviceSize.height*.2,
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.image,size: 40,color: Colors.white54,),
                  onPressed: (){},
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {

                    },
                    child: Icon(Icons.pause_circle_filled) ,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}