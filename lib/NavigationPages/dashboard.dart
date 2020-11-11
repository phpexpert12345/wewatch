import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/NavigationPages/video_list.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:we_watch_app/job_description.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/CreatePost/Createpost.dart';

import 'package:we_watch_app/ui/chewie_list_item.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/util/AppNotifierClass.dart';
import 'package:we_watch_app/util/UtilityClass.dart';

import '../video_home_page.dart';
import '../video_play_detail.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

var now = new DateTime.now();
var monthf = new DateFormat('MMMM');
var yearf = new DateFormat('y');
var dayf = new DateFormat('d');
var weekdayf = new DateFormat('EEEE');
String month = monthf.format(now);
String year = yearf.format(now);
String day2 = dayf.format(now);
String weekday = weekdayf.format(now);
String formattedTime = DateFormat.H().format(now);

class _DashboardState extends State<Dashboard> {
  static List<Item> itemListTwo;
  bool isHomeDataLoading = false;
  VideoPlayerController _controller;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  String first_name, last_name, image,user_type;
  String greeting = "";
  bool visible = false;
  TargetPlatform _platform;
  FlickManager flickManager;
  String welcome_video_file = "",
      headline_title,
      video_locality,
      reporter_name,
      reporter_image,
      posted_date,
      posted_time;
  static int _listLimit ;
  List<Quotes> students = new List<Quotes>();

  List names = new List();
  ScrollController scrollController = new ScrollController();

  String addVideoPermission;
  Future getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/profile';

    // Store all data with Param Name.

    // Starting Web API Call.
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());

    try {
      if (response.statusCode == 200) {
//        prefs.setString('first_name',body['data']['first_name'] );
//        prefs.setString('last_name',body['data']['last_name'] );
//        prefs.setString('email',body['data']['email'] );
//        prefs.setString('emp_type',body['data']['emp_type'] );
//        prefs.setString('gender',body['data']['gender'] );
//        prefs.setString('mobile_number',body['data']['mobile_number'] );
//        prefs.setString('slug',body['data']['slug'] );
//        prefs.setString('date_of_birth',body['data']['date_of_birth'] );
//        prefs.setString('otp',body['data']['otp'] );
//        prefs.setString('status',body['data']['status'] );
//        prefs.setString('user_type',body['data']['user_type'] );
//        prefs.setString('address',body['data']['address'] );
//        prefs.setString('city_id',body['data']['city_id'] );
//        prefs.setString('state_id',body['data']['state_id'] );
//        prefs.setString('country_id',body['data']['country_id'] );
//        prefs.setString('zipcode',body['data']['zipcode'] );
//        prefs.setString('image',body['data']['image'] );

        first_name = body['data']['first_name'].toString() +
            " " +
            body['data']['last_name'].toString();
        image = body['data']['image'].toString();
        addVideoPermission=body['data']["permission"];
        user_type=body['data']['user_type'].toString();

        print("Ankit 22" + first_name);
        prefs.setString("user_name", first_name);

        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
//        Fluttertoast.showToast(
//            msg: body['data']['access_token'],
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
////            timeInSecForIos: 1
//        );
//        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Navigate to Profile Screen & Sending Email to Next Screen.

      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Validation Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Request Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Authorization Failure',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Server Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
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

  Future getWelcomeVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/welcome-video';

    // Store all data with Param Name.

    // Starting Web API Call.

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());

    try {
      if (response.statusCode == 200) {
        setState(() {
          welcome_video_file = body['data']['video_file'];
          headline_title = body['data']['headline_title'];
          video_locality = body['data']['video_locality'];
          reporter_name = body['data']['reporter_name'];
          reporter_image = body['data']['reporter_image'];
          posted_time = body['data']['posted_time'];
          posted_date = body['data']['posted_date'];
        });
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Validation Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Request Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Authorization Failure',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Server Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
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

  bool isLoading = false;

  //call on scroll
  void getQuotes(String type, String text) async {
    if (!isLoading) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String access_token = prefs.getString('access_token');
      print("token: "+access_token);
      String login_url =
          "https://wewatch.in/wewatch-up/api/v1/video-listing?page=" + type;
      var response = await http.get(login_url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access_token',
      });


      try {
        if (response.statusCode == 200) {
          //print("Ankit" + body.toString());
          print(response.body);

          //Simulate a service call
          print('submitting to backend...');
          Map<String, dynamic> decodedMap = jsonDecode(response.body);
          Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
          // var body = await json.decode(response.body);
          apiCalled=true;
          _appNotifierClass.setChange(false);
          _appNotifierClass.notifyListeners();

          if(decodedMap['data']['results']!=null) {
            List<dynamic> dynamicList = decodedMap['data']['results'];

            List<Quotes> tempList = new List<Quotes>();
            dynamicList.forEach((f) {
              Quotes s = Quotes.fromJson(f);
              tempList.add(s);
            });
            setState(() {
              moreDataLoading = false;
              isLoading = false;
              students.addAll(tempList);
            });
          }else{
            print("no more data available");
          }
        } else {
          throw Exception(MESSAGES.INTERNET_ERROR);
        }
      } catch (e) {
        throw Exception(e);
      }
    }

//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }

  bool moreDataLoading;
  loadListTwo() {
    itemListTwo = List();

    itemListTwo.add(Item('Employee', 1, "empolyee_two"));
    itemListTwo.add(Item('Jobs Feeds', 1, "jobs_feed_two"));
    itemListTwo.add(Item('Latest Videos', 1, "latest_video_two"));
    itemListTwo.add(Item('Social Workers', 1, "social_workers_two"));
//    itemListTwo.add(Item('Groups', 1, "category_food"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
  }

  String first = ' ';
  String second = 'Guest';
  bool apiCalled;
  @override
  void initState() {
    // TODO: implement initState
    getWelcomeVideo();
    moreDataLoading=true;
    _listLimit = 1;
    this.getQuotes(_listLimit.toString(), "");
    apiCalled=true;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _listLimit = _listLimit + 1;
        setState(() {
          moreDataLoading=true;
        });
        if(apiCalled) {
          apiCalled=false;
          getQuotes(_listLimit.toString(), "");
        }
      }
    });

    super.initState();
    loadListTwo();
    getProfile();

    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            !["", null].contains(welcome_video_file)
                ? welcome_video_file
                : welcome_video_file),
        autoPlay: false,);
  }

  void fetchfive() {
    getQuotes(_listLimit.toString(), "");
  }
  AppNotifierClass _appNotifierClass;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int a = int.parse(formattedTime);
    print(a);
    if (a >= 5 && a < 12) {
      greeting = "Good Morning";
    } else if (a >= 12 && a < 17) {
      greeting = "Good Afternoon";
    } else if (a >= 17 && a < 20) {
      greeting = "Good Evening";
    } else {
      greeting = "Good Night";
    }
    Timer _timer;
    _AnimatedFlutterLogoState() {
      _timer = new Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          first = first_name;
        });
      });
    }
    _appNotifierClass = Provider.of<AppNotifierClass>(context);
    if(_appNotifierClass.getChange()){
      _listLimit=1;
      setState(() {
        moreDataLoading=true;
        students.clear();
      });
      this.getQuotes(_listLimit.toString(), "");
    }


    return Scaffold(
        floatingActionButton: !["",null].contains(user_type) && user_type.compareTo("reporter")==0
            ? FloatingActionButton(
                child: Icon(Icons.switch_video),
                onPressed: () {
                  if(!["",null].contains(addVideoPermission) && addVideoPermission.trim().compareTo("yes")==0){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => CreatePost(userName: first_name,userImage: image,),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                    //setState(() {});
                  }else {
                    //UtilityClass.showMsg("soorry");
                    showPermissionDialog();
                  }

                })
            : null,
        body:
            // FutureBuilder(
            // future: Future.delayed(Duration(seconds: 1)),
            // builder: (c, s) => s.connectionState == ConnectionState.done
            //     ? Stack(
            //         children: <Widget>[
            //           ListView.builder(
            //             shrinkWrap: true,
            //             physics: ScrollPhysics(),
            //             controller: scrollController,
            //             itemBuilder: (contex, index) {
            //               return QuotesCell(
            //                 students[index],
            //               );
            //             },
            //             itemCount: students.length,
            //           ),
            //         ],
            //       )
            //     : CircularProgressIndicator(),
            Container(
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              ShowUp(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:  AssetImage(
                                    "assets/images/logo_splash.png",
                                  ),
                                ))),
                      ),
                      Text(
                        "We Watch App",style: new TextStyle(fontSize: 20,color: Colors.black54,),
                      )
                    ],
                  ),
                ),
                delay: 100,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade200,
                ),
              ),
              ShowUp(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                            width: 40.0,
                            height: 40.0,
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
                      FutureBuilder(
                        future: Future.delayed(Duration(seconds: 3)),
                        builder: (c, s) => s.connectionState ==
                                ConnectionState.done
                            ? first_name != null
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                "Hi! " + first_name,

                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.left,
//                                    textDirection:
//                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 5.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                day2 + " " + month + " " + year,
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
//                                    textDirection:
//                                    TextDirection.LTR,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    (![
                                                      "",
                                                      null,
                                                      false,
                                                      0,
                                                    ].contains(greeting))
                                                        ? greeting
                                                        : "Good Evening",
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
//                                        textDirection:
//                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 5.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    '',
                                                    style: TextStyle(
                                                      color: Color(0xff00adef),
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
//                                        textDirection:
//                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                "Hi! Guest",

                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.left,
//                                    textDirection:
//                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 5.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                day2 + " " + month + " " + year,
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
//                                    textDirection:
//                                    TextDirection.LTR,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    (![
                                                      "",
                                                      null,
                                                      false,
                                                      0,
                                                    ].contains(greeting))
                                                        ? greeting
                                                        : "Good Evening",
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
//                                        textDirection:
//                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 5.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    '',
                                                    style: TextStyle(
                                                      color: Color(0xff00adef),
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
//                                        textDirection:
//                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                            : Text(''),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      //   child: Center(
                      //     child: Padding(
                      //       padding: EdgeInsets.all(0),
                      //       child: Image.asset(
                      //         "assets/images/live_two.png",
                      //         width: 40,
                      //         height: 40,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                delay: 100,
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoHomePage()));
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                        child: Icon(Icons.play_circle_fill_sharp,size: 50,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: Align(
                                child: new Text(
                                  'Latest Videos',
                                  style: TextStyle(
                                    color: Color(0xff444b69),
                                    fontSize: 10,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
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
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                          "assets/images/social_workers_two.png",
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
                                    0.0, 5.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Social',
                                    style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 10,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Coming soon",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
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
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                          "assets/images/jobs_feed_two.png",
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
                                    0.0, 5.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Job Feeds',
                                    style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 10,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDescription()));
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                          "assets/images/empolyee_two.png",
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
                                    0.0, 5.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Employee',
                                    style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 10,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Coming soon",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 0,
              ),
//              Container(
//                width: MediaQuery.of(context).size.width,
//                height: 100,
//                child: Center(
//                  child: Chewie(
//                    controller: _chewieController,
//                  ),
//                ),
//              ),

              Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),

//                                    decoration: BoxDecoration(
//                                      image:
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
                    color: Colors.transparent,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Center(
                                child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: (![
                                            "",
                                            null,
                                            false,
                                            0,
                                          ].contains(reporter_image))
                                              ? NetworkImage(
                                                  reporter_image,
                                                )
                                              : AssetImage(
                                                  "assets/images/logo_splash.png",
                                                ),
                                        ))),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
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
                                          ].contains(headline_title))
                                              ? headline_title
                                              : "Video title",
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
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    : "NA | ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
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
                                                0.0, 0.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                (![
                                                  "",
                                                  null,
                                                  false,
                                                  0,
                                                ].contains(video_locality))
                                                    ? video_locality + ", "
                                                    : "No Location, ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
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
                                          ].contains(posted_time))
                                              ? posted_date +
                                                  " | " +
                                                  "Posted at " +
                                                  posted_time
                                              : "NA",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
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
                            ),
//                                Center(
//                                  child: Padding(
//                                    padding: EdgeInsets.all(20),
//                                    child: Image.asset(
//                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                      fit: BoxFit.fill,
//                                    ),
//                                  ),
//                                ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              child: Container(
                                height: 300,
//                width: 100,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                    child: Container(
                                        height: 300,
//                width: 100,
                                        child: VisibilityDetector(
                                          key: ObjectKey(flickManager),
                                          onVisibilityChanged: (visibility) {
                                            if (visibility.visibleFraction ==
                                                    0 &&
                                                this.mounted) {
                                              flickManager.flickControlManager
                                                  .play();
                                            } else if (visibility
                                                    .visibleFraction ==
                                                1) {
                                              flickManager.flickControlManager
                                                  .play();
                                            }
                                          },
                                          child: Container(
                                            child: FlickVideoPlayer(
                                              flickManager: flickManager,
                                              flickVideoWithControls:
                                                  FlickVideoWithControls(
                                                controls:
                                                    FlickPortraitControls(),
                                              ),
                                              flickVideoWithControlsFullscreen:
                                                  FlickVideoWithControls(
                                                controls:
                                                    FlickLandscapeControls(),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

//                          ChewieListItem(
//                            videoPlayerController: VideoPlayerController.network(
//                              cellModel.video_file,
//                            ),
//                          ),
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
                elevation: 5,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
//               Padding(
//                 padding: EdgeInsets.all(0),
//                 child: SizedBox(
// //                  height: MediaQuery.of(context).size.height/3,
// //                  width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                       itemCount: students.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return FutureBuilder(
//                             future: Future.delayed(Duration(seconds: 1)),
//                             builder: (c, s) =>
//                             s.connectionState == ConnectionState.done
//                                 ? QuotesCell(
//                               students[index],
//                             )
//                                 : Center(
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 child: Text(''),
//                               ),
//                             ));
//                       },
//                     )),
//               ),
              Padding(
                padding: EdgeInsets.all(0),
                child: SizedBox(
//                  height: MediaQuery.of(context).size.height/3,
//                  width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        itemCount: students.length,
                        itemBuilder: (BuildContext context, int index) {
                          return QuotesCell(
                            students[index],
                          );
                        },
                )),
              ),
              moreDataLoading? Center(
                  child: CupertinoActivityIndicator(radius: 16.0,)
              ):Container()
            ],
          ),
          color: Color(0xfff9f9f9),
        ));
  }

  void showPermissionDialog() {
    Alert(context: context,
      title: "Video Functionality",
      desc: "You don't have permission to use this option, Please send a request for use it.",
      buttons: [
        DialogButton(
          child: Text(
            "Send Request",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            sendRequestForVideoModule();
            Navigator.pop(context);
          },
          width: 120,

        ),
        DialogButton(
          child: Text(
            "Not Now",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )

      ]

    ).show();
  }


  Future sendRequestForVideoModule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    String userId = prefs.getString("user_id");
    var response = await http.post(WatchAPI.PERMISSION_TO_ACCESS_VIDEO_MODULE,

        body: <String,dynamic>{
            "userid": userId,
            "permission":"yes"
        },
        headers: {
        'Authorization': 'Bearer $access_token',
    });
    try {
      if (response.statusCode == 200) {
        getProfile();
        prefs.setString("permission_videomodule", "ok");
        Fluttertoast.showToast(
            msg: "Request has been sent successfully!!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff00adef),
            textColor: Colors.white,
            fontSize: 16.0);

      } else if (response.statusCode == 422) {
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
      throw Exception(e);
    }
  }
}

class ItemTwo {
  String text;
  int id;
  String image;
  String imageTwo;

  ItemTwo(this.text, this.id, this.image, this.imageTwo);
}

class Quotes {
  var id;
  var user_id;
  var video_thumb_image;
  var video_file;
  var video_title;
  var video_description;
  var state_id;
  var citi_id;
  var video_locality;
  var video_tag;
  var video_category;
  var posted_date;
  var posted_time;
  var is_like;
  var reporter_name;
  int total_likes, total_dislikes, total_comments;
  var channel_id;
  var is_subscribed;
  int subscriber_count;
  var channel_name;
  int total_views;

  Quotes({
    this.id,
    this.user_id,
    this.video_thumb_image,
    this.video_file,
    this.video_title,
    this.video_description,
    this.state_id,
    this.citi_id,
    this.video_locality,
    this.video_tag,
    this.video_category,
    this.posted_date,
    this.posted_time,
    this.is_like,
    this.reporter_name,
    this.total_likes,
    this.total_dislikes,
    this.total_comments,
    this.channel_id,
    this.is_subscribed,
    this.channel_name,
    this.subscriber_count,
    this.total_views,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id'],
      user_id: json['user_id'],
      video_thumb_image: json['video_thumb_image'],
      video_file: json['video_file'],
      video_title: json['video_title'],
      video_description: json['video_description'],
      state_id: json['sharing_content'],
      citi_id: json['citi_id'],
      video_locality: json['location'],
      video_tag: json['video_tag'],
      video_category: json['video_category'],
      posted_date: json['posted_date'],
      posted_time: json['posted_time'],
      is_like: json['is_like'],
      reporter_name: json['reporter_name'],
      total_likes: json['total_likes'],
      total_dislikes: json['total_dislikes'],
      total_comments: json['total_comments'],
      channel_id: json['channel_id'],
      is_subscribed: json['is_subscribed'],
      subscriber_count: json['subscriber_count'],
      channel_name: json['channel_name'],
      total_views: json['total_views'],
    );
  }
}

class QuotesCell extends StatefulWidget {
  int countValue = 0;

  QuotesCell(this.cellModel);
  @required
  final Quotes cellModel;

  @override
  _QuotesCellState createState() => _QuotesCellState(this.cellModel);
}

class _QuotesCellState extends State<QuotesCell> {
  bool countValue = false, countValue1 = false;
  int doLogin;
  _QuotesCellState(this.cellModel);
  @required
  final Quotes cellModel;
  FlickManager flickManager;
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countValue = cellModel.is_like;
    countValue1 = cellModel.is_like;
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            !["", null].contains(cellModel.video_file)
                ? cellModel.video_file
                : '  '),
        autoPlay: false);

    checkFirstSeen();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  static Container homeGrid(AsyncSnapshot<List<Quotes>> snapshot, context) {
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
          return QuotesCell(
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

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      doLogin = 1;
    } else {
      doLogin = 0;
    }

//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
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

    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),

//                                    decoration: BoxDecoration(
//                                      image:
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
                      color: Colors.transparent,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Center(
                                  child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(cellModel
                                                    .video_thumb_image))
                                                ? NetworkImage(
                                                    cellModel.video_thumb_image,
                                                  )
                                                : AssetImage(
                                                    "assets/images/logo_splash.png",
                                                  ),
                                          ))),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            ].contains(cellModel.video_title))
                                                ? cellModel.video_title
                                                : "Video title",
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    (![
                                                      "",
                                                      null,
                                                      false,
                                                      0,
                                                    ].contains(cellModel
                                                            .reporter_name))
                                                        ? cellModel
                                                                .reporter_name +
                                                            " | "
                                                        : "Video title | ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: Container(
                                                      child: new Text(
                                                        (![
                                                          "",
                                                          null,
                                                          false,
                                                          0,
                                                        ].contains(cellModel
                                                                .video_locality))
                                                            ? cellModel
                                                                    .video_locality +
                                                                ", "
                                                            : "Video title, ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.6,
                                                          letterSpacing: 0,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
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
                                      ),
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
                                            ].contains(cellModel.posted_time))
                                                ? cellModel.posted_date +
                                                    " | " +
                                                    "Posted at " +
                                                    cellModel.posted_time
                                                : "NA",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
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
                              ),
//                                Center(
//                                  child: Padding(
//                                    padding: EdgeInsets.all(20),
//                                    child: Image.asset(
//                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                      fit: BoxFit.fill,
//                                    ),
//                                  ),
//                                ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlay(
                                        id: cellModel.id.toString(),
                                        user_id: cellModel.user_id.toString(),
                                        citi_id: cellModel.citi_id.toString(),
                                        state_id: cellModel.state_id.toString(),
                                        video_category:
                                            cellModel.video_category.toString(),
                                        video_description: cellModel
                                            .video_description
                                            .toString(),
                                        video_file:
                                            cellModel.video_file.toString(),
                                        video_locality:
                                            cellModel.video_locality.toString(),
                                        video_tag:
                                            cellModel.video_tag.toString(),
                                        video_thumb_image: cellModel
                                            .video_thumb_image
                                            .toString(),
                                        video_title:
                                            cellModel.video_title.toString(),
                                        like_count: cellModel.total_likes,
                                        dislike_count: cellModel.total_dislikes,
                                        comments_count:
                                            cellModel.total_comments,
                                        islike: cellModel.is_like,
                                        date: cellModel.posted_date,
                                        time: cellModel.posted_time,
                                        reporter_name: cellModel.reporter_name,
                                        channel_id: cellModel.channel_id,
                                        is_subscribed: cellModel.is_subscribed,
                                        channel_name: cellModel.channel_name,
                                        subscriber_count:
                                            cellModel.subscriber_count,
                                        total_views: cellModel.total_views,
                                      )),
                            );
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Container(
                                    height: 300,
//                width: 100,
                                    child: VisibilityDetector(
                                      key: ObjectKey(flickManager),
                                      onVisibilityChanged: (visibility) {
                                        if (visibility.visibleFraction == 0 &&
                                            this.mounted) {
                                          flickManager.flickControlManager
                                              .pause();
                                        } else if (visibility.visibleFraction ==
                                            1) {
                                          flickManager.flickControlManager
                                              .play();
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
                            ],
                          ),
                        ),

//                          ChewieListItem(
//                            videoPlayerController: VideoPlayerController.network(
//                              cellModel.video_file,
//                            ),
//                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  if (doLogin == 1) {
                                    setState(() {
                                      // if(countValue){
                                      //   countValue=false;
                                      //   countValue1=true;
                                      // }
                                      if (!countValue) {
                                        countValue = true;
                                        countValue1 = false;
                                        saveLike(cellModel.id.toString(), "1");
                                        cellModel.total_likes =
                                            cellModel.total_likes + 1;
                                        if (cellModel.total_dislikes > 0) {
                                          cellModel.total_dislikes =
                                              cellModel.total_dislikes - 1;
                                        }
                                      }
                                    });
                                  }

                                  if (doLogin == 0) {}
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
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
                                            height: 15,
                                            width: 15,
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
                                            cellModel.total_likes != 0
                                                ? cellModel.total_likes
                                                        .toString() +
                                                    ' Like'
                                                : '0 Like',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  if (doLogin == 1) {
                                    setState(() {
                                      // if(countValue1){
                                      //   countValue1=false;
                                      //   countValue=true;
                                      // }
                                      if (!countValue1) {
                                        countValue1 = true;
                                        countValue = false;
                                        saveLike(cellModel.id.toString(), "0");
                                        cellModel.total_dislikes =
                                            cellModel.total_dislikes + 1;
                                        if (cellModel.total_likes > 0) {
                                          cellModel.total_likes =
                                              cellModel.total_likes - 1;
                                        }
                                      }
                                    });
                                  } else {}
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
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
                                            height: 15,
                                            width: 15,
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
                                                        : Colors.grey),
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
                                            !["", null].contains(cellModel
                                                    .total_dislikes
                                                    .toString())
                                                ? cellModel.total_dislikes
                                                        .toString() +
                                                    ' Dislike'
                                                : '0 Dislike',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 10),
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
                                            height: 15,
                                            width: 15,
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
                                                  "assets/images/comments.png",
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
                                            !["", null].contains(cellModel
                                                    .total_comments
                                                    .toString())
                                                ? cellModel.total_comments
                                                        .toString() +
                                                    ' Comment'
                                                : '0 Comment',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Share.share(
                                        cellModel.state_id,
                                        subject: cellModel.video_title,
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height: 15,
                                              width: 15,
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
                                                fontSize: 13,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
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
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
//              Center(
////                                        heightFactor: 5,
//                child: InkWell(
//                  onTap: () {
//
//
//                  },
//                  child: Container(
//
//                    margin: EdgeInsets.all(10.0),
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        child: Stack(
//                          alignment: Alignment.center,
//                          children: <Widget>[
//                            Center(
//                              child: Align(
//                                alignment: FractionalOffset.center,
//                                child: Container(
//                                  height: MediaQuery.of(context).size.height/3,
//                                  width: MediaQuery.of(context).size.width,
////                                  width: SizeConfig.heightMultiplier * 30,
////                                  height: SizeConfig.heightMultiplier * 50,
//                                  decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                      image: NetworkImage(
//                                        cellModel.video_thumb_image,
//                                      ),
//                                      fit: BoxFit.fill,
//                                    ),
//                                    borderRadius: BorderRadius.circular(20.0),
//                                  ),
//
//                                ),
//                              ),
//                            ),
//
//
//                          ],
//                        )),
//                  ),
//                ),
//              ),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoPlay(
                    id: cellModel.id.toString(),
                    user_id: cellModel.user_id.toString(),
                    citi_id: cellModel.citi_id.toString(),
                    state_id: cellModel.state_id.toString(),
                    video_category: cellModel.video_category.toString(),
                    video_description: cellModel.video_description.toString(),
                    video_file: cellModel.video_file.toString(),
                    video_locality: cellModel.video_locality.toString(),
                    video_tag: cellModel.video_tag.toString(),
                    video_thumb_image: cellModel.video_thumb_image.toString(),
                    video_title: cellModel.video_title.toString(),
                    like_count: cellModel.total_likes,
                    dislike_count: cellModel.total_dislikes,
                    comments_count: cellModel.total_comments,
                    islike: cellModel.is_like,
                    date: cellModel.posted_date,
                    time: cellModel.posted_time,
                    reporter_name: cellModel.reporter_name,
                    channel_id: cellModel.channel_id,
                    is_subscribed: cellModel.is_subscribed,
                    channel_name: cellModel.channel_name,
                    subscriber_count: cellModel.subscriber_count,
                    total_views: cellModel.total_views,
                  )),
        );
        // setState(() => countValue == 0 ? countValue = 1 : countValue = 0);
        // Grid Click
      },
    );
  }
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

  var body = json.decode(response.body);
  var message = jsonDecode(response.body);

  print("ffff" + message.toString());

  try {
    if (response.statusCode == 200) {
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
//     Fluttertoast.showToast(
//       msg: e.toString(),
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//     );
    throw Exception(e);
  }
  // If the Response Message is Matched.
}
