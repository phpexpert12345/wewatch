import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/ui/to_subscribe_detail.dart';
import 'package:we_watch_app/util/AppNotifierClass.dart';

import 'conts/config.dart';

class VideoPlay extends StatefulWidget {
  String id,
      user_id,
      video_thumb_image,
      video_file,
      video_title,
      video_description,
      state_id,
      citi_id,
      video_locality,
      video_tag,
      video_category,
      date,
      time,
      reporter_name;
  var channel_name;
  var channel_id;
  int like_count, dislike_count, comments_count;
  bool islike;
  bool is_subscribed;
  int subscriber_count;
  int total_views;

  VideoPlay(
      {Key key,
      @required this.id,
      @required this.user_id,
      @required this.video_thumb_image,
      @required this.video_file,
      @required this.video_title,
      @required this.video_description,
      @required this.state_id,
      @required this.citi_id,
      @required this.video_locality,
      @required this.video_tag,
      @required this.video_category,
      @required this.like_count,
      @required this.dislike_count,
      @required this.islike,
      @required this.comments_count,
      @required this.date,
      @required this.time,
      @required this.reporter_name,
      @required this.channel_id,
      @required this.is_subscribed,
      @required this.channel_name,
      @required this.subscriber_count,
      @required this.total_views})
      : super(key: key);

  @override
  _VideoPlayState createState() => _VideoPlayState(
        id: id,
        user_id: user_id,
        video_thumb_image: video_thumb_image,
        video_file: video_file,
        video_title: video_title,
        video_description: video_description,
        state_id: state_id,
        citi_id: citi_id,
        video_locality: video_locality,
        video_category: video_category,
        video_tag: video_tag,
        like_count: like_count,
        dislike_count: dislike_count,
        islike: islike,
        comments_count: comments_count,
        date: date,
        time: time,
        reporter_name: reporter_name,
        channel_id: channel_id,
        is_subscribed: is_subscribed,
        subscriber_count: subscriber_count,
        channel_name: channel_name,
        total_views: total_views,
      );
}



class _VideoPlayState extends State<VideoPlay> {
  String id,
      user_id,
      video_thumb_image,
      video_file,
      video_title,
      video_description,
      state_id,
      citi_id,
      video_locality,
      video_tag,
      video_category,
      date,
      time,
      reporter_name;
  var channel_id;
  var channel_name;
  int like_count, dislike_count, comments_count;
  bool is_subscribed;
  int subscriber_count;
  int total_views;
  bool islike;
  bool visible = false;

  AppNotifierClass _appNotifierClass;
  GlobalKey<FormState> _key = new GlobalKey();
  bool checkBoxValue2 = false;
  bool _validate = false;
  final TextEditingController _commentController = new TextEditingController();
  String _comment;
  String image;
  bool countValue = false, countValue1 = false;
  bool is_sub;
  int doLogin;

  _VideoPlayState({
    @required this.id,
    @required this.user_id,
    @required this.video_thumb_image,
    @required this.video_file,
    @required this.video_title,
    @required this.video_description,
    @required this.state_id,
    @required this.citi_id,
    @required this.video_locality,
    @required this.video_tag,
    @required this.video_category,
    @required this.like_count,
    @required this.dislike_count,
    @required this.islike,
    @required this.comments_count,
    @required this.date,
    @required this.time,
    @required this.reporter_name,
    @required this.channel_id,
    @required this.is_subscribed,
    @required this.channel_name,
    @required this.subscriber_count,
    @required this.total_views,
  }) : super();
  TargetPlatform _platform;
  // VideoPlayerController _controller;
  Future<List<Comments>> getComments(String type, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String access_token = prefs.getString('access_token');
    image = prefs.getString('image');

    String login_url =
        "https://wewatch.in/wewatch-up/api/v1/video_comments/${widget.id}";
    var response = await http.get(login_url, headers: {
//      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    //Simulate a service call

    Map<String, dynamic> decodedMap = jsonDecode(response.body);
    Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    var body = await json.decode(response.body);
    print('sundar' + response.body);
    try {
      if (response.statusCode == 200) {
        List<dynamic> dynamicList = decodedMap['data']['results'];
        List<Comments> students = new List<Comments>();
        dynamicList.forEach((f) {
          Comments s = Comments.fromJson(f);
          students.add(s);
        });

        return students;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(e);
    }
//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }

  Future addComment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.'
    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });

    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/video_comments';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "video_id": widget.id,
        "comment": _commentController.text.toString(),
      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "video_id": widget.id,
        "comment": _commentController.text.toString(),
      });
    }

    // Starting Web API Call.
    var response = await http.post(url, body: formData, headers: headers);

    // Getting Server response into variable.

    var body = json.decode(response.body);
    var message = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
        _commentController.text = "";
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  List<Channel_details> channel = [];
  Future<List<String>> subscribed(String type, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String access_token = prefs.getString('access_token');
    image = prefs.getString('image');
    FormData formData;

    // if (Platform.isIOS) {
    //   formData = new FormData.from({
    //     "channel_id": type,
    //     "is_subscribed": text,
    //   });
    // }
    // if (Platform.isAndroid) {
    //   formData = new FormData.from({
    //     "channel_id": type,
    //     "is_subscribed": text,
    //   });
    // }
    String login_url =
        "https://wewatch.in/wewatch-up/api/v1/channel-subscribers";
    var response = await http.post(login_url, headers: {
      'Authorization': 'Bearer $access_token',
    },
      body: <String,dynamic>{
        "channel_id": type,
        "is_subscribed": text
      }

    );

    //Simulate a service call
    print(response.statusCode);
    //Map<String, dynamic> decodedMap = jsonDecode(response.body);
    //Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        // Hiding the CircularProgressIndicator.
        var body = json.decode(response.body);
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          visible = false;
        });
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
  }

  Future<List<String>> report(String type, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String access_token = prefs.getString('access_token');
    image = prefs.getString('image');
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "video_id": type,
        "comment": text,
      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "video_id": type,
        "comment": text,
      });
    }

    String report_url = WatchAPI.VIDEO_REPORT;
    var response = await http.post(report_url, body: formData, headers: {
      // 'Content-type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    //Simulate a service call
    print(response.statusCode);
    // Map<String, dynamic> decodedMap = jsonDecode(response.body);
    // Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        // Hiding the CircularProgressIndicator.
        var body = await json.decode(response.body);
        setState(() {
          otherTextController.text="";
          choice=null;
          val=0;
        });
        //reportcomment = "";

        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          visible = false;
        });
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
  }

  bool isHomeDataLoading = false;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  FlickManager flickManager;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      doLogin = 1;
    } else {
      doLogin = 0;
    }
  }
  String reportcomment;
  String _radioValue; //Initial definition of radio button value
  String choice;
  int val ;
  @override
  void initState() {
    // TODO: implement initState
    reportcomment = "";
    val = 0;
    super.initState();

    print(video_file);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          !["", null].contains(video_file) ? video_file : video_file,videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false)
      ),

    );

    //flickManager.flickDisplayManager.showPlayerControls;


    countValue = islike;
    countValue1 = islike;
    checkFirstSeen();
    is_sub = is_subscribed;
    print('sundar ${is_sub}');
  }

  @override
  void dispose() {
    flickManager.dispose();
    // _controller.dispose();
    super.dispose();
  }

  Future saveLike(String videoId, String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');

    // Getting value from Controller
//    String email = _emailFilter.text.toString();
//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/likes';
    Map data = {
//      'API_KEY':"4762265654DFGDF00546FDG4FD654G6DF",
      'video_id': videoId,
      'status': status,
    };
    String formD = json.encode(data);

    // Store all data with Param Name.

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    // Starting Web API Call.
//  var response = await http.post(url, body: formD,headers: headers);
    var response = await http.post(url, body: formD, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    // Getting Server response into variable.


    try {


      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        //var message = jsonDecode(response.body);
        _appNotifierClass.setChange(true);
        _appNotifierClass.notifyListeners();
//        otp = body["otp"];
        //prefs.setString('user_token',body['user_token'] );
//        prefs.setString('id', body['id']);
//        prefs.setString('std_id', body['std_id']);
//        prefs.setString('name', body['name']);
//        prefs.setString('designation', body['designation']);
//        prefs.setString('phone', body['phone']);
//        prefs.setString('email', body['email']);
//        prefs.setString('doj', body['doj']);
//        prefs.setString('pincode', body['pincode']);
//        prefs.setString('state', body['state']);
//        prefs.setString('address', body['address']);
//        prefs.setString('image', body['image']);
//        prefs.setString('role', body['role']);
        //  prefs.setString('image',body['image'] );
        // prefs.setString('image',body['image'] );
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff00adef),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          if (status == "1") {
            like_count = like_count + 1;
            if (dislike_count > 0) {
              dislike_count = dislike_count - 1;
            }
          }

          if (status == "0") {
            if (like_count > 0) {
              like_count = like_count - 1;
            }

            dislike_count = dislike_count + 1;
          }
        });
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Sexual content':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Violent or repulsive content':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Hateful or abusive content':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Harmful or dangerous acts':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Child abuse':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Infringes my rights':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Promotes terrorism':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        case 'Spam or misleading':
          choice = value;
          setState(() {
            reportcomment = value;
          });
          break;
        default:
          choice = null;
      }
    });
  }
  var otherTextController=TextEditingController(text: '');
  // bool pressAttention = is_sub ? true : false;
  @override
  Widget build(BuildContext context) {
   _appNotifierClass = Provider.of<AppNotifierClass>(context);
    print(is_subscribed);
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        right: false,
        left: false,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            height: 250,
//                width: 100,
                            child: Container(
                                child: VisibilityDetector(
                              key: ObjectKey(flickManager),
                              onVisibilityChanged: (visibility) {
                                if (visibility.visibleFraction == 0 &&
                                    this.mounted) {
                                  flickManager.flickControlManager
                                      .autoPause();
                                } else if (visibility.visibleFraction == 1) {
                                  flickManager.flickControlManager
                                      .autoResume();
                                }
                              },
                              child: Container(
                                child: FlickVideoPlayer(
                                  flickManager: flickManager,
                                  flickVideoWithControls:
                                      FlickVideoWithControls(
                                    controls: FlickPortraitControls(),

                                  ),
                                  flickVideoWithControlsFullscreen:
                                      FlickVideoWithControls(
                                    controls: FlickLandscapeControls(),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                    height: 250,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 1, 10, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(video_title.toString(),style: new TextStyle(fontSize: 18,color: Colors.black,),),
                                    Text((![
                                      "",
                                      null,
                                      false,
                                      0,
                                    ].contains(video_description))
                                        ? " || "+video_description
                                        : "",style: new TextStyle(fontSize: 18,color: Colors.black,),)

                                  ],
                                ),
                              ),
                              ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(total_views.toString()),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('views'),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (doLogin == 1) {
                                                setState(() {
                                                  if (!countValue) {
                                                    saveLike(id, "1");
                                                    countValue = true;
                                                    countValue1 = false;
                                                  }
                                                });
                                              }
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                  child: Center(
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding: EdgeInsets.all(0),
                                                          child: Image.asset(
                                                            "assets/images/like_grey.png",

//                                              height: 150.0,
//                                              width: 50.0,
                                                            fit: BoxFit.fill,
                                                            color: countValue
                                                                ? Color(0xff00adef)
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      !["", null].contains(like_count)
                                                          ? like_count.toString() +
                                                          " Likes"
                                                          : '0 Likes',
                                                      style: TextStyle(
                                                        color: Color(0xff444b69),
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      textDirection: TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (doLogin == 1) {
                                              setState(() {
                                                if (!countValue1) {
                                                  countValue1 = true;
                                                  countValue = false;
                                                  saveLike(id, "0");
                                                }
                                              });
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(0),
                                                        child: Image.asset(
                                                          "assets/images/dislike_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                          fit: BoxFit.fill,
                                                          color: countValue1
                                                              ? Color(0xff00adef)
                                                              : Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    !["", null].contains(dislike_count)
                                                        ? dislike_count.toString() +
                                                        " Dislikes"
                                                        : '0 Dislikes',
                                                    style: TextStyle(
                                                      color: Color(0xff444b69),
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    textDirection: TextDirection.ltr,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Share.share(
                                            state_id,
                                            subject: video_title,
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(0),
                                                        child: Image.asset(
                                                          "assets/images/share_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Share',
                                                    style: TextStyle(
                                                      color: Color(0xff444b69),
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    textDirection: TextDirection.ltr,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             Padding(
//                                               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                               child: Center(
//                                                 child: Container(
//                                                   height: 30,
//                                                   width: 30,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(30)),
// //                                            border: Border.all(
// //                                                                   width: 0,
// //                                                                   color: Colors
// //                                                                       .lightBlue,
// //                                                                   style:
// //                                                                   BorderStyle
// //                                                                       .solid)
//                                                   ),
//                                                   child: Center(
//                                                     child: Padding(
//                                                       padding: EdgeInsets.all(0),
//                                                       child: Icon(
//                                                         Icons.file_download,
//                                                         color: Color(0xff757998),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.fromLTRB(
//                                                   0.0, 0.0, 0.0, 0.0),
//                                               child: Align(
//                                                 child: new Text(
//                                                   'Download',
//                                                   style: TextStyle(
//                                                     color: Color(0xff444b69),
//                                                     fontSize: 12,
//                                                     letterSpacing: 0,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                   textDirection: TextDirection.ltr,
//                                                 ),
//                                                 alignment: Alignment.center,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             Padding(
//                                               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                               child: Center(
//                                                 child: Container(
//                                                   height: 30,
//                                                   width: 30,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(30)),
// //                                            border: Border.all(
// //                                                                   width: 0,
// //                                                                   color: Colors
// //                                                                       .lightBlue,
// //                                                                   style:
// //                                                                   BorderStyle
// //                                                                       .solid)
//                                                   ),
//                                                   child: Center(
//                                                     child: Padding(
//                                                       padding: EdgeInsets.all(0),
//                                                       child: Image.asset(
//                                                         "assets/images/watch_list_grey.png",
// //                                              height: 150.0,
// //                                              width: 50.0,
//                                                         fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.fromLTRB(
//                                                   0.0, 0.0, 0.0, 0.0),
//                                               child: Align(
//                                                 child: new Text(
//                                                   'Watchlist',
//                                                   style: TextStyle(
//                                                     color: Color(0xff444b69),
//                                                     fontSize: 12,
//                                                     letterSpacing: 0,
//                                                     fontWeight: FontWeight.w400,
//                                                   ),
//                                                   textAlign: TextAlign.center,
//                                                   textDirection: TextDirection.ltr,
//                                                 ),
//                                                 alignment: Alignment.center,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, new MaterialPageRoute(builder: (context)=> SubscribeDetail(userId: user_id,)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: (![
                                                      "",
                                                      null,
                                                      false,
                                                      0,
                                                    ].contains(
                                                        widget.video_thumb_image))
                                                        ? NetworkImage(
                                                      widget.video_thumb_image,
                                                    )
                                                        : AssetImage(
                                                      "assets/images/logo_splash.png",
                                                    ),
                                                  ))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            widget.video_title,
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    (![
                                      "",
                                      null,
                                      false,
                                      0,
                                    ].contains(video_description))
                                        ? video_description
                                        : "NA",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      child: Align(
                                        child: new Text(
                                          (![
                                            "",
                                            null,
                                            false,
                                            0,
                                          ].contains(reporter_name))
                                              ? reporter_name + " | "
                                              : "NA  | ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Align(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: new Text(
                                            (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(video_locality))
                                                ? video_locality + ", "
                                                : "NA, ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 0,
                                            ),
                                            textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),

//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    (![
                                      "",
                                      null,
                                      false,
                                      0,
                                    ].contains(time))
                                        ? date + " | " + "Posted at " + time
                                        : "NA",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.4,
                        ),
                        ListTile(
                          leading: CircleAvatar(),
                          title: InkWell(
                            onTap: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=> SubscribeDetail(userId: user_id,)));
                            },
                              child: Text(channel_name.toString())),
                          subtitle: Text(widget.subscriber_count.toString()),

                          trailing: Container(
                              height: 100,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new RaisedButton(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Subscribe',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ]),
                                      textColor: Colors.white,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(18.0),
                                      ),
                                      color: is_sub ? Colors.grey : Colors.blue,
                                      onPressed: () {
                                        subscribed(user_id.toString(),
                                            is_sub ? '0' : '1');
                                        setState(() => is_sub = !is_sub);
                                      }),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                            enableFeedback: true,
                                            splashColor: Colors.grey.shade200,
                                            child: Container(
                                              padding:EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(18)
                                              ),
                                              child: Row(
                                                children: [
                                                  Text("Report ",style: new TextStyle(color: Colors.white),),
                                                  Icon(Icons.flag,color: Colors.white,),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              showGeneralDialog(
                                                transitionDuration:
                                                Duration(milliseconds: 500),
                                                barrierColor: Colors.black87,
                                                barrierLabel: '',
                                                barrierDismissible: true,
                                                context: context,
                                                pageBuilder: (ctx, anim1, anim2) =>
                                                    AlertDialog(
                                                      content: StatefulBuilder(
                                                        builder: (BuildContext context,
                                                            StateSetter setState) {
                                                          return Container(
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .height >
                                                                667
                                                                ? MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.6
                                                                : MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.8,
                                                            width: 300,
                                                            child: ListView(
                                                              shrinkWrap: true,
                                                              children: [
                                                                Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          bottom: 5.0),
                                                                      child: new Text(
                                                                        'Report Video',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                            'Montserrat',
                                                                            fontSize: 16,
                                                                            color:
                                                                            Colors.black),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Sexual content',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          "Sexual content",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors
                                                                                  .black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Violent or repulsive content',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Flexible(
                                                                          child: Text(
                                                                            "Violent or repulsive content",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: Colors
                                                                                    .black),
                                                                            maxLines: 2,
                                                                            textWidthBasis:
                                                                            TextWidthBasis
                                                                                .longestLine,
                                                                            overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Hateful or abusive content',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Flexible(
                                                                          child: Text(
                                                                            "Hateful or abusive content",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: Colors
                                                                                    .black),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Harmful or dangerous acts',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Flexible(
                                                                          child: Text(
                                                                            "Harmful or dangerous acts",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: Colors
                                                                                    .black),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Child abuse',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          "Child abuse",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors
                                                                                  .black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Infringes my rights',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          "Infringes my rights",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors
                                                                                  .black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Promotes terrorism',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          "Promotes terrorism",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors
                                                                                  .black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: <Widget>[
                                                                        Radio(
                                                                          value:
                                                                          'Spam or misleading',
                                                                          groupValue:
                                                                          _radioValue,
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              radioButtonChanges(
                                                                                  value);
                                                                            });
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          "Spam or misleading",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors
                                                                                  .black),
                                                                        ),
                                                                      ],
                                                                    ),

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
                                                                        maxLines: 3,
                                                                        cursorColor: Colors.black,
                                                                        controller: otherTextController,
                                                                        decoration: new InputDecoration(
                                                                            border: InputBorder.none,
                                                                            focusedBorder: InputBorder.none,
                                                                            enabledBorder: InputBorder.none,
                                                                            errorBorder: InputBorder.none,
                                                                            disabledBorder: InputBorder.none,
                                                                            contentPadding: EdgeInsets.only(
                                                                                left: 15, bottom: 11, top: 11, right: 15),
                                                                            hintText: 'comments here -',
                                                                            hintStyle: new TextStyle(color: Colors.black45)),
                                                                        inputFormatters: [
                                                                          LengthLimitingTextInputFormatter(100),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('Cancel')),
                                                        FlatButton(
                                                            onPressed: () {
                                                              if(otherTextController.text.isNotEmpty && reportcomment==""){
                                                                report(id, otherTextController.text);
                                                              }else if (reportcomment!="" && otherTextController.text.isEmpty){
                                                                report(id, reportcomment);
                                                              }else if(otherTextController.text.isNotEmpty && !["",null].contains(reportcomment)){
                                                                String comment=reportcomment+" "+otherTextController.text;
                                                                report(id, comment);
                                                              }
                                                              //report(id, reportcomment);
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('Report'))
                                                      ],
                                                    ),
                                                transitionBuilder:
                                                    (ctx, anim1, anim2, child) =>
                                                    BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 4 * anim1.value,
                                                          sigmaY: 4 * anim1.value),
                                                      child: FadeTransition(
                                                        child: child,
                                                        opacity: anim1,
                                                      ),
                                                    ),
                                              );
                                            }),
                                      )),
                                ],
                              )),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.4,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Form(
                            key: _key,
                            autovalidate: _validate,
                            child: new Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
//                                      Padding(
//                                        padding:
//                                        const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
//                                        child: Text(
//                                          'Email ID',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      child: Center(
                                        child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: (![
                                                    "",
                                                    null,
                                                    false,
                                                    0,
                                                  ].contains(image))
                                                      ? NetworkImage(
                                                    image,
                                                  )
                                                      : AssetImage(
                                                    "assets/images/logo_splash.png",
                                                  ),
                                                ))),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 8,
                                    child: new TextFormField(
                                      controller: _commentController,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: new InputDecoration(
                                        hintText: 'Add comment',
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF5a6381),
                                        ),
                                        suffixIcon: Container(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                            child: IconButton(
                                              icon: Icon(Icons.send),
                                              onPressed: () {
                                                if (doLogin == 1) {
                                                  addComment();
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: "Login first",
                                                      toastLength:
                                                      Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                      Colors.redAccent,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              },
                                            )),
                                      ),
                                      maxLines: 1,
                                      autofocus: false,
//                                    validator: validatePassword,
                                      onFieldSubmitted: (String val) {
                                        if (doLogin == 1) {
                                          _comment = val;

                                          addComment();
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Login first",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.redAccent,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: SizedBox(
//                  height: MediaQuery.of(context).size.height/3,
//                  width: MediaQuery.of(context).size.width,
                            child: FutureBuilder<List<Comments>>(
                              future: getComments("", ""),
                              builder: (context, snapshot) {
                                return snapshot.connectionState ==
                                    ConnectionState.done
                                    ? snapshot.hasData
                                    ? _CommentsCellState.homeGrid(
                                    snapshot, context)
                                    : _CommentsCellState.retryButton(fetch)
                                    : _CommentsCellState.circularProgress();
                              },
                            ),
                          ),
                        ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0, 5, 0, 0),
//                                                child: Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 50,
//                                                          width: 50,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    50)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                        const EdgeInsets.all(
//                                                            4.0),
//                                                        child: Column(
//                                                          mainAxisAlignment:
//                                                          MainAxisAlignment
//                                                              .start,
//                                                          crossAxisAlignment:
//                                                          CrossAxisAlignment
//                                                              .start,
//                                                          children: <Widget>[
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  'Channel Name',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Color(
//                                                                        0xff444b69),
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  '1day ago',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Colors
//                                                                        .black45,
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                          ],
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 30,
//                                                          width: 128,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    30)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/subscribe_button.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Icon(
//                                                          Icons.notifications,
//                                                          color:
//                                                          Color(0xffc9ccde),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    10, 10, 10, 10),
//                                                child: GestureDetector(
//                                                  onTap: () {},
//                                                  child: Card(
//                                                    child: Container(
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0, 5, 0, 0),
//                                                            child: Row(
//                                                              mainAxisAlignment:
//                                                              MainAxisAlignment
//                                                                  .center,
//                                                              crossAxisAlignment:
//                                                              CrossAxisAlignment
//                                                                  .center,
//                                                              children: <Widget>[
//                                                                Padding(
//                                                                  padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                      0,
//                                                                      0,
//                                                                      0,
//                                                                      0),
//                                                                  child: Center(
//                                                                    child:
//                                                                    Container(
//                                                                      height: 50,
//                                                                      width: 50,
//                                                                      decoration:
//                                                                      BoxDecoration(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        borderRadius:
//                                                                        BorderRadius.all(
//                                                                            Radius.circular(50)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                                      ),
//                                                                      child:
//                                                                      Center(
//                                                                        child:
//                                                                        Padding(
//                                                                          padding:
//                                                                          EdgeInsets.all(0),
//                                                                          child: Image
//                                                                              .asset(
//                                                                            "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                            fit: BoxFit
//                                                                                .fill,
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Expanded(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    const EdgeInsets
//                                                                        .all(
//                                                                        4.0),
//                                                                    child: Column(
//                                                                      mainAxisAlignment:
//                                                                      MainAxisAlignment
//                                                                          .start,
//                                                                      crossAxisAlignment:
//                                                                      CrossAxisAlignment
//                                                                          .start,
//                                                                      children: <
//                                                                          Widget>[
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Add your Comment…..',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 15,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                                                    ),
//                                                    elevation: 0,
//                                                    shape: RoundedRectangleBorder(
//                                                      borderRadius:
//                                                      BorderRadius.only(
//                                                        topRight:
//                                                        Radius.circular(15),
//                                                        topLeft:
//                                                        Radius.circular(15),
//                                                        bottomLeft:
//                                                        Radius.circular(15),
//                                                        bottomRight:
//                                                        Radius.circular(15),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                              Container(
//                                                height: 1,
//                                                color: Colors.black26,
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0.0, 0, 0, 10),
//                                                child: GestureDetector(
//                                                  onTap: () {},
//                                                  child: Card(
//                                                    child: Container(
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0, 5, 0, 0),
//                                                            child: Row(
//                                                              mainAxisAlignment:
//                                                              MainAxisAlignment
//                                                                  .center,
//                                                              crossAxisAlignment:
//                                                              CrossAxisAlignment
//                                                                  .center,
//                                                              children: <Widget>[
//                                                                Padding(
//                                                                  padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                      0,
//                                                                      0,
//                                                                      0,
//                                                                      0),
//                                                                  child: Center(
//                                                                    child:
//                                                                    Container(
//                                                                      height: 50,
//                                                                      width: 50,
//                                                                      decoration:
//                                                                      BoxDecoration(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        borderRadius:
//                                                                        BorderRadius.all(
//                                                                            Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                                      ),
//                                                                      child:
//                                                                      Center(
//                                                                        child:
//                                                                        Padding(
//                                                                          padding:
//                                                                          EdgeInsets.all(0),
//                                                                          child: Image
//                                                                              .asset(
//                                                                            "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                            fit: BoxFit
//                                                                                .fill,
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Expanded(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    const EdgeInsets
//                                                                        .all(
//                                                                        4.0),
//                                                                    child: Column(
//                                                                      mainAxisAlignment:
//                                                                      MainAxisAlignment
//                                                                          .center,
//                                                                      crossAxisAlignment:
//                                                                      CrossAxisAlignment
//                                                                          .center,
//                                                                      children: <
//                                                                          Widget>[
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nisha singha - 2 day ago',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 15,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nice song but video hota to acha lagta﻿',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 16,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'View 13 Reples',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Color(0xff08c1f8),
//                                                                                fontSize: 14,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Center(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    EdgeInsets
//                                                                        .all(
//                                                                        20),
//                                                                    child: Image
//                                                                        .asset(
//                                                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                                      fit: BoxFit
//                                                                          .fill,
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                                                    ),
//                                                    elevation: 0,
//                                                    shape: RoundedRectangleBorder(
//                                                      borderRadius:
//                                                      BorderRadius.only(
//                                                        topRight:
//                                                        Radius.circular(15),
//                                                        topLeft:
//                                                        Radius.circular(15),
//                                                        bottomLeft:
//                                                        Radius.circular(15),
//                                                        bottomRight:
//                                                        Radius.circular(15),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                              Container(
//                                                height: 1,
//                                                color: Colors.black26,
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0.0, 0, 0, 10),
//                                                child: GestureDetector(
//                                                  onTap: () {},
//                                                  child: Card(
//                                                    child: Container(
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0, 5, 0, 0),
//                                                            child: Row(
//                                                              mainAxisAlignment:
//                                                              MainAxisAlignment
//                                                                  .center,
//                                                              crossAxisAlignment:
//                                                              CrossAxisAlignment
//                                                                  .center,
//                                                              children: <Widget>[
//                                                                Padding(
//                                                                  padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                      0,
//                                                                      0,
//                                                                      0,
//                                                                      0),
//                                                                  child: Center(
//                                                                    child:
//                                                                    Container(
//                                                                      height: 50,
//                                                                      width: 50,
//                                                                      decoration:
//                                                                      BoxDecoration(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        borderRadius:
//                                                                        BorderRadius.all(
//                                                                            Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                                      ),
//                                                                      child:
//                                                                      Center(
//                                                                        child:
//                                                                        Padding(
//                                                                          padding:
//                                                                          EdgeInsets.all(0),
//                                                                          child: Image
//                                                                              .asset(
//                                                                            "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                            fit: BoxFit
//                                                                                .fill,
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Expanded(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    const EdgeInsets
//                                                                        .all(
//                                                                        4.0),
//                                                                    child: Column(
//                                                                      mainAxisAlignment:
//                                                                      MainAxisAlignment
//                                                                          .center,
//                                                                      crossAxisAlignment:
//                                                                      CrossAxisAlignment
//                                                                          .center,
//                                                                      children: <
//                                                                          Widget>[
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nisha singha - 2 day ago',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 15,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nice song but video hota to acha lagta﻿',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 16,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'View 13 Reples',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Color(0xff08c1f8),
//                                                                                fontSize: 14,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Center(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    EdgeInsets
//                                                                        .all(
//                                                                        20),
//                                                                    child: Image
//                                                                        .asset(
//                                                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                                      fit: BoxFit
//                                                                          .fill,
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                                                    ),
//                                                    elevation: 0,
//                                                    shape: RoundedRectangleBorder(
//                                                      borderRadius:
//                                                      BorderRadius.only(
//                                                        topRight:
//                                                        Radius.circular(15),
//                                                        topLeft:
//                                                        Radius.circular(15),
//                                                        bottomLeft:
//                                                        Radius.circular(15),
//                                                        bottomRight:
//                                                        Radius.circular(15),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                              Container(
//                                                height: 1,
//                                                color: Colors.black26,
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0.0, 0, 0, 10),
//                                                child: GestureDetector(
//                                                  onTap: () {},
//                                                  child: Card(
//                                                    child: Container(
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0, 5, 0, 0),
//                                                            child: Row(
//                                                              mainAxisAlignment:
//                                                              MainAxisAlignment
//                                                                  .center,
//                                                              crossAxisAlignment:
//                                                              CrossAxisAlignment
//                                                                  .center,
//                                                              children: <Widget>[
//                                                                Padding(
//                                                                  padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                      0,
//                                                                      0,
//                                                                      0,
//                                                                      0),
//                                                                  child: Center(
//                                                                    child:
//                                                                    Container(
//                                                                      height: 50,
//                                                                      width: 50,
//                                                                      decoration:
//                                                                      BoxDecoration(
//                                                                        color: Colors
//                                                                            .white,
//                                                                        borderRadius:
//                                                                        BorderRadius.all(
//                                                                            Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                                      ),
//                                                                      child:
//                                                                      Center(
//                                                                        child:
//                                                                        Padding(
//                                                                          padding:
//                                                                          EdgeInsets.all(0),
//                                                                          child: Image
//                                                                              .asset(
//                                                                            "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                            fit: BoxFit
//                                                                                .fill,
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Expanded(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    const EdgeInsets
//                                                                        .all(
//                                                                        4.0),
//                                                                    child: Column(
//                                                                      mainAxisAlignment:
//                                                                      MainAxisAlignment
//                                                                          .center,
//                                                                      crossAxisAlignment:
//                                                                      CrossAxisAlignment
//                                                                          .center,
//                                                                      children: <
//                                                                          Widget>[
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nisha singha - 2 day ago',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 15,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'Nice song but video hota to acha lagta﻿',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Colors.black45,
//                                                                                fontSize: 16,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                        Padding(
//                                                                          padding: const EdgeInsets.fromLTRB(
//                                                                              0.0,
//                                                                              10.0,
//                                                                              0.0,
//                                                                              0.0),
//                                                                          child:
//                                                                          Align(
//                                                                            child:
//                                                                            new Text(
//                                                                              'View 13 Reples',
//                                                                              style:
//                                                                              TextStyle(
//
//                                                                                color: Color(0xff08c1f8),
//                                                                                fontSize: 14,
//                                                                                letterSpacing: 0,
//                                                                                fontWeight: FontWeight.w400,
//                                                                              ),
//                                                                              textAlign:
//                                                                              TextAlign.left,
//                                                                              textDirection:
//                                                                              TextDirection.ltr,
//                                                                            ),
//                                                                            alignment:
//                                                                            Alignment.centerLeft,
//                                                                          ),
//                                                                        ),
//                                                                      ],
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                                Center(
//                                                                  child: Padding(
//                                                                    padding:
//                                                                    EdgeInsets
//                                                                        .all(
//                                                                        20),
//                                                                    child: Image
//                                                                        .asset(
//                                                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                                      fit: BoxFit
//                                                                          .fill,
//                                                                    ),
//                                                                  ),
//                                                                ),
//                                                              ],
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                                                    ),
//                                                    elevation: 0,
//                                                    shape: RoundedRectangleBorder(
//                                                      borderRadius:
//                                                      BorderRadius.only(
//                                                        topRight:
//                                                        Radius.circular(15),
//                                                        topLeft:
//                                                        Radius.circular(15),
//                                                        bottomLeft:
//                                                        Radius.circular(15),
//                                                        bottomRight:
//                                                        Radius.circular(15),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0, 5, 0, 0),
//                                                child: Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 50,
//                                                          width: 50,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    50)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                        const EdgeInsets.all(
//                                                            4.0),
//                                                        child: Column(
//                                                          mainAxisAlignment:
//                                                          MainAxisAlignment
//                                                              .start,
//                                                          crossAxisAlignment:
//                                                          CrossAxisAlignment
//                                                              .start,
//                                                          children: <Widget>[
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  'Channel Name',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Color(
//                                                                        0xff444b69),
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  '1day ago',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Colors
//                                                                        .black45,
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                          ],
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding: EdgeInsets.fromLTRB(
//                                                    0, 10, 0, 0),
//                                                child: Center(
//                                                  child: Container(
////                                        height: 100,
////                                        width: 75,
//                                                    decoration: BoxDecoration(
//                                                      color: Colors.white,
//                                                      borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(
//                                                              50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                    ),
//                                                    child: Center(
//                                                      child: Padding(
//                                                        padding:
//                                                        EdgeInsets.all(0),
//                                                        child: Image.asset(
//                                                          "assets/images/image_twelve.png",
////                                                      height:  double.infinity,
//                                                          width: MediaQuery.of(
//                                                              context)
//                                                              .size
//                                                              .width,
//                                                          fit: BoxFit.fitHeight,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0, 5, 0, 0),
//                                                child: Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.start,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 30,
//                                                          width: 30,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    30)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/like_grey.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          10),
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0.0,
//                                                                0.0,
//                                                                0.0,
//                                                                0.0),
//                                                            child: Align(
//                                                              child: new Text(
//                                                                '1.8k',
//                                                                style: TextStyle(
//                                                                  fontFamily:
//                                                                  'Poppins',
//                                                                  color: Color(
//                                                                      0xff444b69),
//                                                                  fontSize: 15,
//                                                                  letterSpacing:
//                                                                  0,
//                                                                  fontWeight:
//                                                                  FontWeight
//                                                                      .w400,
//                                                                ),
//                                                                textAlign:
//                                                                TextAlign
//                                                                    .left,
//                                                                textDirection:
//                                                                TextDirection
//                                                                    .ltr,
//                                                              ),
//                                                              alignment: Alignment
//                                                                  .centerLeft,
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 5, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 30,
//                                                          width: 30,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    30)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/dislike_grey.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          10),
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0.0,
//                                                                0.0,
//                                                                0.0,
//                                                                0.0),
//                                                            child: Align(
//                                                              child: new Text(
//                                                                '1.8k',
//                                                                style: TextStyle(
//                                                                  fontFamily:
//                                                                  'Poppins',
//                                                                  color: Color(
//                                                                      0xff444b69),
//                                                                  fontSize: 15,
//                                                                  letterSpacing:
//                                                                  0,
//                                                                  fontWeight:
//                                                                  FontWeight
//                                                                      .w400,
//                                                                ),
//                                                                textAlign:
//                                                                TextAlign
//                                                                    .left,
//                                                                textDirection:
//                                                                TextDirection
//                                                                    .ltr,
//                                                              ),
//                                                              alignment: Alignment
//                                                                  .centerLeft,
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                    Spacer(),
//                                                    Center(
//                                                      child: Padding(
//                                                        padding:
//                                                        EdgeInsets.all(20),
//                                                        child: Image.asset(
//                                                          "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                          fit: BoxFit.fill,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0, 5, 0, 0),
//                                                child: Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 50,
//                                                          width: 50,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    50)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/comment_dp.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Expanded(
//                                                      child: Padding(
//                                                        padding:
//                                                        const EdgeInsets.all(
//                                                            4.0),
//                                                        child: Column(
//                                                          mainAxisAlignment:
//                                                          MainAxisAlignment
//                                                              .start,
//                                                          crossAxisAlignment:
//                                                          CrossAxisAlignment
//                                                              .start,
//                                                          children: <Widget>[
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  'Channel Name',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Color(
//                                                                        0xff444b69),
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                            Padding(
//                                                              padding:
//                                                              const EdgeInsets
//                                                                  .fromLTRB(
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0,
//                                                                  0.0),
//                                                              child: Align(
//                                                                child: new Text(
//                                                                  '1day ago',
//                                                                  style:
//                                                                  TextStyle(
//                                                                    fontFamily:
//                                                                    'Poppins',
//                                                                    color: Colors
//                                                                        .black45,
//                                                                    fontSize: 15,
//                                                                    letterSpacing:
//                                                                    0,
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .w400,
//                                                                  ),
//                                                                  textAlign:
//                                                                  TextAlign
//                                                                      .left,
//                                                                  textDirection:
//                                                                  TextDirection
//                                                                      .ltr,
//                                                                ),
//                                                                alignment: Alignment
//                                                                    .centerLeft,
//                                                              ),
//                                                            ),
//                                                          ],
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding: EdgeInsets.fromLTRB(
//                                                    0, 10, 0, 0),
//                                                child: Center(
//                                                  child: Container(
////                                        height: 100,
////                                        width: 75,
//                                                    decoration: BoxDecoration(
//                                                      color: Colors.white,
//                                                      borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(
//                                                              50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                    ),
//                                                    child: Center(
//                                                      child: Padding(
//                                                        padding:
//                                                        EdgeInsets.all(0),
//                                                        child: Image.asset(
//                                                          "assets/images/image_twelve.png",
////                                                      height:  double.infinity,
//                                                          width: MediaQuery.of(
//                                                              context)
//                                                              .size
//                                                              .width,
//                                                          fit: BoxFit.fitHeight,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding:
//                                                const EdgeInsets.fromLTRB(
//                                                    0, 5, 0, 0),
//                                                child: Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.start,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 30,
//                                                          width: 30,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    30)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/like_grey.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          10),
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0.0,
//                                                                0.0,
//                                                                0.0,
//                                                                0.0),
//                                                            child: Align(
//                                                              child: new Text(
//                                                                '1.8k',
//                                                                style: TextStyle(
//                                                                  fontFamily:
//                                                                  'Poppins',
//                                                                  color: Color(
//                                                                      0xff444b69),
//                                                                  fontSize: 15,
//                                                                  letterSpacing:
//                                                                  0,
//                                                                  fontWeight:
//                                                                  FontWeight
//                                                                      .w400,
//                                                                ),
//                                                                textAlign:
//                                                                TextAlign
//                                                                    .left,
//                                                                textDirection:
//                                                                TextDirection
//                                                                    .ltr,
//                                                              ),
//                                                              alignment: Alignment
//                                                                  .centerLeft,
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      EdgeInsets.fromLTRB(
//                                                          0, 5, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 30,
//                                                          width: 30,
//                                                          decoration:
//                                                          BoxDecoration(
//                                                            color: Colors.white,
//                                                            borderRadius:
//                                                            BorderRadius.all(
//                                                                Radius
//                                                                    .circular(
//                                                                    30)),
////                                            border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                          ),
//                                                          child: Center(
//                                                            child: Padding(
//                                                              padding:
//                                                              EdgeInsets.all(
//                                                                  0),
//                                                              child: Image.asset(
//                                                                "assets/images/dislike_grey.png",
////                                              height: 150.0,
////                                              width: 50.0,
//                                                                fit: BoxFit.fill,
//                                                              ),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          10),
//                                                      child: Column(
//                                                        mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .start,
//                                                        crossAxisAlignment:
//                                                        CrossAxisAlignment
//                                                            .start,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .fromLTRB(
//                                                                0.0,
//                                                                0.0,
//                                                                0.0,
//                                                                0.0),
//                                                            child: Align(
//                                                              child: new Text(
//                                                                '1.8k',
//                                                                style: TextStyle(
//                                                                  fontFamily:
//                                                                  'Poppins',
//                                                                  color: Color(
//                                                                      0xff444b69),
//                                                                  fontSize: 15,
//                                                                  letterSpacing:
//                                                                  0,
//                                                                  fontWeight:
//                                                                  FontWeight
//                                                                      .w400,
//                                                                ),
//                                                                textAlign:
//                                                                TextAlign
//                                                                    .left,
//                                                                textDirection:
//                                                                TextDirection
//                                                                    .ltr,
//                                                              ),
//                                                              alignment: Alignment
//                                                                  .centerLeft,
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ),
//                                                    Spacer(),
//                                                    Center(
//                                                      child: Padding(
//                                                        padding:
//                                                        EdgeInsets.all(20),
//                                                        child: Image.asset(
//                                                          "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                          fit: BoxFit.fill,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  FlatButton(
//                    onPressed: () {
//                      _chewieController.enterFullScreen();
//                    },
//                    child: Text('Fullscreen'),
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: FlatButton(
//                          onPressed: () {
//                            setState(() {
//                              _chewieController.dispose();
//                              _videoPlayerController2.pause();
//                              _videoPlayerController2
//                                  .seekTo(Duration(seconds: 0));
//                              _chewieController = ChewieController(
//                                videoPlayerController:
//                                _videoPlayerController1,
//                                aspectRatio: 3 / 2,
//                                autoPlay: true,
//                                looping: true,
//                              );
//                            });
//                          },
//                          child: Padding(
//                            child: Text("Video 1"),
//                            padding: EdgeInsets.symmetric(vertical: 16.0),
//                          ),
//                        ),
//                      ),
//                      Expanded(
//                        child: FlatButton(
//                          onPressed: () {
//                            setState(() {
//                              _chewieController.dispose();
//                              _videoPlayerController1.pause();
//                              _videoPlayerController1
//                                  .seekTo(Duration(seconds: 0));
//                              _chewieController = ChewieController(
//                                videoPlayerController:
//                                _videoPlayerController2,
//                                aspectRatio: 3 / 2,
//                                autoPlay: true,
//                                looping: true,
//                              );
//                            });
//                          },
//                          child: Padding(
//                            padding: EdgeInsets.symmetric(vertical: 16.0),
//                            child: Text("Error Video"),
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: FlatButton(
//                          onPressed: () {
//                            setState(() {
//                              _platform = TargetPlatform.android;
//                            });
//                          },
//                          child: Padding(
//                            child: Text("Android controls"),
//                            padding: EdgeInsets.symmetric(vertical: 16.0),
//                          ),
//                        ),
//                      ),
//                      Expanded(
//                        child: FlatButton(
//                          onPressed: () {
//                            setState(() {
//                              _platform = TargetPlatform.iOS;
//                            });
//                          },
//                          child: Padding(
//                            padding: EdgeInsets.symmetric(vertical: 16.0),
//                            child: Text("iOS controls"),
//                          ),
//                        ),
//                      )
//                    ],
//                  )
                      ],
                    ),
                  )
                ],
              ),

          ),
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
              !["", null].contains(video_title) ? video_title : "Video Details",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
//          bottomNavigationBar: BottomNavigationBar(
//            items: const <BottomNavigationBarItem>[
//              BottomNavigationBarItem(
//                icon: Icon(Icons.home),
//                title: Text(''),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.play_arrow),
//                title: Text(''),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.shopping_basket),
//                title: Text(''),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.explore),
//                title: Text(''),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.notifications),
//                title: Text(''),
//              ),
//            ],
//            selectedItemColor: Color(0xff00adef),
//            unselectedItemColor: Colors.black54,
//          ),
        ),
      ),
    );
  }


}

class Comments {
  var id;
  var video_id;
  var comment;
  var posted_date;
  var posted_time;
  var name;
  String image;

  Comments(
      {this.id,
      this.video_id,
      this.comment,
      this.posted_date,
      this.posted_time,
      this.name,
      this.image});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
        id: json['id'],
        video_id: json['video_id'],
        comment: json['comment'],
        posted_date: json['posted_date'],
        posted_time: json['posted_time'],
        name: json['added_by'],
        image: json['user_image']);
  }
}

class Channel_details {
  var id;
  var channel_name;
  var channel_logo;
  var channel_cover;
  var channel_description;

  Channel_details({
    this.id,
    this.channel_name,
    this.channel_logo,
    this.channel_cover,
    this.channel_description,
  });

  factory Channel_details.fromJson(Map<String, dynamic> json) {
    return Channel_details(
      id: json['id'],
      channel_name: json['channel_name'],
      channel_logo: json['channel_logo'],
      channel_cover: json['channel_cover'],
      channel_description: json['channel_description'],
    );
  }
}

class CommentsCell extends StatefulWidget {
  int countValue = 0;

  CommentsCell(this.cellModel);

  @required
  final Comments cellModel;

  @override
  _CommentsCellState createState() => _CommentsCellState(this.cellModel);
}

class _CommentsCellState extends State<CommentsCell> {
  int countValue = 0;

  _CommentsCellState(this.cellModel);

  String comment_new = "";
  @required
  final Comments cellModel;

  static Container homeGrid(AsyncSnapshot<List<Comments>> snapshot, context) {
    Size size = MediaQuery.of(context).size;

    return Container(
//      height: double.infinity,
//      width: double.infinity,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return CommentsCell(
            snapshot.data[index],
          );
        },
      ),
    );
  }

  static Center circularProgress() {
    return Center(
      child: SizedBox(
        height: 50.0,
        width: 50.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(COLORS.APP_THEME_COLOR),
        ),
      ),
    );
  }

//  _launchURL(String url) async {
//
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//  _displayDialog(BuildContext context,String url) async {
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text('Feedback'),
//
//            content:Center(
//              child:  _launchURL(url),
//            ),
//
//            actions: <Widget>[
//              new RaisedButton(
//                onPressed: (){
//                  Navigator.of(context, rootNavigator: true).pop();
//                },
//                shape: RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.red)
//                ),
//                padding: const EdgeInsets.all(8.0),
//                textColor: Colors.white,
//                color: Colors.redAccent[100],
//                child: new Text("Ok"),
//              )
//            ],
//          );
//        });
//  }
  static Center retryButton(Function fetch) {
    return Center(
      child: FlatButton(
        child: Text(
          MESSAGES.INTERNET_ERROR_RETRY,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        onPressed: () => fetch(),
      ),
    );
  }

  // void _showDialog(var id) {
  // showGeneralDialog(
  //   transitionDuration: Duration(milliseconds: 500),
  //   barrierColor: Colors.black87,
  //   barrierLabel: '',
  //   barrierDismissible: true,
  //   context: context,
  //   pageBuilder: (ctx, anim1, anim2) => new AlertDialog(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     actions: [
  //       Container(
  //         height: 100,
  //         width: 400,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.all(Radius.circular(10))),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextField(
  //               controller: _editcommentController,
  //             )
  //           ],
  //         ),
  //       ),
  //       Align(
  //         alignment: Alignment.center,
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 20.0),
  //           child: Container(
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.all(Radius.circular(10))),
  //               height: 40,
  //               width: 150,
  //               child: RaisedButton(
  //                   child: Text(
  //                     'Submit',
  //                     style: TextStyle(fontSize: 10, color: Colors.white),
  //                   ),
  //                   color: Colors.greenAccent,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(25.0),
  //                   ),
  //                   onPressed: () {
  //                     updatecomment(id);
  //                   })),
  //         ),
  //       ),
  //     ],
  //   ),
  //   transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
  //     filter:
  //         ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
  //     child: FadeTransition(
  //       child: child,
  //       opacity: anim1,
  //     ),
  //   ),
  // );
  var sk;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comment_new = cellModel.comment;
    getUserName();
    sk=(15700/1000)%60;
    print("sk"+sk.toString());

  }

  String userName;
  getUserName() async{
    await SharedPreferences.getInstance().then((value) {
      String f_name=value.getString('first_name') ?? '';
      String l_name=value.getString('last_name') ?? '';
      setState(() {
        userName=f_name+" "+l_name;
        print("name "+userName);
      });
    });
  }

  String _showDialog(BuildContext contex, var id) {
    slideDialog.showSlideDialog(
      barrierDismissible: true,
      context: contex,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.cellModel.image),
        ),
        title: Container(
          width: 400,
          child: TextField(
            controller: _editcommentController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                setState(() {
                  Navigator.of(context, rootNavigator: true).pop();
                });
              },
            )),
          ),
        ),
      ),
    );
  }
  // }

  bool visible = false;
  final TextEditingController _editcommentController =
      new TextEditingController();
  Future updatecomment(var id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.'
    String access_token = prefs.getString('access_token');

    setState(() => {});
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/video-comment/${id}';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "comment": _editcommentController.text.toString(),
      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "comment": _editcommentController.text.toString(),
      });
    }

    // Starting Web API Call.
    var response = await http.put(url,
        body: {
          "comment": _editcommentController.text.toString(),
        },
        headers: headers);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        // Hiding the CircularProgressIndicator.

        setState(() {
          comment_new = _editcommentController.text.toString();
        });

        _editcommentController.clear();
        // _editcommentController.text="";

        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() => {});
        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() => {});
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() => {});

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() => {});
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  String name;
  Future deletecomment(var id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.'
    String access_token = prefs.getString('access_token');
    name = prefs.get('first_name');
    setState(() {
      visible = true;
    });
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/video-comment/${id}';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "comment": _editcommentController.text.toString(),
      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "comment": _editcommentController.text.toString(),
      });
    }

    // Starting Web API Call.
    var response = await http.delete(url, headers: headers);

    // Getting Server response into variable.

    var body = json.decode(response.body);
   // var message = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Validation Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
            msg: "Authorization Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  @override
  Widget build(BuildContext context) {
    // Color color2 = HexColor(cellModel.color);
//    bool _visible = false;
//    if(!["", null].contains(cellModel.doc))
//    {
//      _visible=true;
//    }
//    else
//      _visible=false;
//    colorFlag = !colorFlag;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
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
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Center(
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            child: CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      cellModel
                                                                          .image),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                              child: Align(
                                                                child: new Text(
                                                                  (![
                                                                    "",
                                                                    null,
                                                                    false,
                                                                    0,
                                                                  ].contains(cellModel
                                                                          .name))
                                                                      ? cellModel
                                                                          .name
                                                                      : "",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        15,
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                ),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                              child: Align(
                                                                child: new Text(
                                                                  (![
                                                                    "",
                                                                    null,
                                                                    false,
                                                                    0,
                                                                  ].contains(cellModel
                                                                          .posted_date))
                                                                      ? cellModel
                                                                          .posted_date
                                                                      : "Date",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        15,
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  18.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              (![
                                                                "",
                                                                null,
                                                                false,
                                                                0,
                                                              ].contains(
                                                                      comment_new))
                                                                  ? comment_new
                                                                  : "Comments",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 16,
                                                                letterSpacing:
                                                                    0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                            ),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        // Padding(
                                                        //   padding:
                                                        //       const EdgeInsets
                                                        //               .fromLTRB(
                                                        //           0.0,
                                                        //           10.0,
                                                        //           0.0,
                                                        //           0.0),
                                                        //   child: Align(
                                                        //     child: new Text(
                                                        //       'View 13 Reples',
                                                        //       style: TextStyle(
                                                        //         fontFamily:
                                                        //             'Poppins',
                                                        //         color: Color(
                                                        //             0xff08c1f8),
                                                        //         fontSize: 14,
                                                        //         letterSpacing:
                                                        //             0,
                                                        //         fontWeight:
                                                        //             FontWeight
                                                        //                 .w400,
                                                        //       ),
                                                        //       textAlign:
                                                        //           TextAlign
                                                        //               .left,
                                                        //       textDirection:
                                                        //           TextDirection
                                                        //               .ltr,
                                                        //     ),
                                                        //     alignment: Alignment
                                                        //         .centerLeft,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                userName.toString().toLowerCase().trim()==cellModel.name.toString().toLowerCase().trim()?Center(
                                                  //
                                                  child: PopupMenuButton<int>(
                                                    itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        value: 1,
                                                        child: Text("Edit"),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child: Text("Delete"),
                                                      ),
                                                    ],
                                                    initialValue: 0,
                                                    onCanceled: () {
                                                      print(cellModel.name);
                                                      print(
                                                          "You have canceled the menu.");
                                                    },
                                                    onSelected: (value) {
                                                      setState(() {
                                                        if (value == 1) {
                                                          setState(() {
                                                            _editcommentController.text=widget
                                                                .cellModel
                                                                .comment;
                                                          });
                                                          slideDialog
                                                              .showSlideDialog(
                                                            barrierDismissible:
                                                                true,
                                                            context: context,
                                                            child: ListTile(
                                                              leading:
                                                                  CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(widget
                                                                        .cellModel
                                                                        .image),
                                                              ),
                                                              title: Container(
                                                                width: 400,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _editcommentController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                          suffixIcon:
                                                                              IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .send),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        updatecomment(widget
                                                                            .cellModel
                                                                            .id);
                                                                        Navigator.of(context,
                                                                                rootNavigator: true)
                                                                            .pop();
                                                                      });
                                                                    },
                                                                  )),
                                                                ),
                                                              ),
                                                            ),
                                                          );

                                                        }
                                                        if (value == 2) {
                                                          deletecomment(widget
                                                              .cellModel.id);
                                                          setState(() => {});
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(Icons.more_vert),
                                                  ),
                                                ):Container(width: 50,),
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
                            ],
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
    );
  }
}

Widget _selectPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ],
      initialValue: 2,
      onCanceled: () {
        print("You have canceled the menu.");
      },
      onSelected: (value) {
        print("value:$value");
      },
      icon: Icon(Icons.list),
    );
