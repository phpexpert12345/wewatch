import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/edit_channel.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/ui/add_channel.dart';

import 'conts/config.dart';

class MyChannel extends StatefulWidget {
  @override
  _MyChannelState createState() => new _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
  bool visible = false;
  bool isPrivate ;
  bool isSubscribers;
  bool isPlaylist ;
  String channel_name,channel_logo,channel_cover,channel_description,video_private,subscribers_private,playlists_private;

  Future getChannel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/channel';

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
        channel_name=body['data']['results']['channel_name'];
        channel_logo=body['data']['results']['channel_logo'];
        channel_cover=body['data']['results']['channel_cover'];
        channel_description=body['data']['results']['channel_description'];
        video_private=body['data']['results']['video_private'].toString();
        if(video_private=="1")
          isPrivate=true;
        else
          isPrivate=false;
        subscribers_private=body['data']['results']['subscribers_private'].toString();
        if(subscribers_private=="1")
          isSubscribers=true;
        else
          isSubscribers=false;
        playlists_private=body['data']['results']['playlists_private'].toString();
        if(playlists_private=="1")
          isPlaylist=true;
        else
          isPlaylist=false;
//        channel_name=body['data']['results']['channel_name'];

//        prefs.setString('first_name', body['data']['first_name']);
//        prefs.setString('last_name', body['data']['last_name']);
//        prefs.setString('email', body['data']['email']);
//        prefs.setString('emp_type', body['data']['emp_type']);
//        prefs.setString('gender', body['data']['gender']);
//        prefs.setString('mobile_number', body['data']['mobile_number']);
//        prefs.setString('slug', body['data']['slug']);
//        prefs.setString('date_of_birth', body['data']['date_of_birth']);
//        prefs.setString('otp', body['data']['otp']);
//        prefs.setString('status', body['data']['status']);
//        prefs.setString('user_type', body['data']['user_type']);
//        prefs.setString('address', body['data']['address']);
//        prefs.setString('city_id', body['data']['city_id']);
//        prefs.setString('state_id', body['data']['state_id']);
//        prefs.setString('country_id', body['data']['country_id']);
//        prefs.setString('zipcode', body['data']['zipcode']);
//        prefs.setString('image', body['data']['image']);

        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: body['data']['access_token'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//            timeInSecForIosWeb: 1
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();

//         Navigate to Profile Screen & Sending Email to Next Screen.

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
            timeInSecForIosWeb: 10,
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
            msg: 'Request Fail',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 10,
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
            msg: 'Authorization Failure',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 10,
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
            msg: 'Server Error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 10,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
//        timeInSecForIosWeb: 1,
      );
      throw Exception(e);
    }
    // If the Response Message is Matched.
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

  @override
  void initState() {
    super.initState();
    isPrivate=false;
    isSubscribers=false;
    isPlaylist=false;
    getChannel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
//                        Image.network(
//                          'https://wewatch.s3.ap-south-1.amazonaws.com/channel/1597347957-profile4.png',
//                        ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            (![
                              "",
                              null,
                              false,
                              0,
                            ].contains(channel_cover))
                                ? ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20)),
                                child: Image.network(
                                  channel_cover,
                                  width: MediaQuery.of(context).size.width,
                                  height:MediaQuery.of(context).size.height/3,
                                  fit: BoxFit.fill,
                                ))
                                : Image.asset(
                              "assets/images/logo_splash.png",
                              width: MediaQuery.of(context).size.width*0.9,
                              height:MediaQuery.of(context).size.height/3,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 0, 10, 0),
                                    child: Center(
                                      child: Container(
                                          width: 75.0,
                                          height: 75.0,
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
                                                    channel_logo))
                                                    ? NetworkImage(
                                                  channel_cover,
                                                )
                                                    : AssetImage(
                                                  "assets/images/logo_splash.png",
                                                ),
                                              ))),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                (![
                                                  "",
                                                  null,
                                                  false,
                                                  0,
                                                ].contains(
                                                    channel_logo))
                                                    ? channel_name
                                                    : "Channel name",
                                                style: TextStyle(

                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                (![
                                                  "",
                                                  null,
                                                  false,
                                                  0,
                                                ].contains(
                                                    channel_logo))
                                                    ? channel_description
                                                    : "Description",
                                                style: TextStyle(

                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.fromLTRB(
//                                                      0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                onTap: () {},
//                                                child: Padding(
//                                                  padding:
//                                                      const EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                  child: Card(
//                                                    child: Container(
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: Color(0xff00adef),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                      ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                      child: Center(
//                                                          child: Row(
//                                                        mainAxisAlignment:
//                                                            MainAxisAlignment
//                                                                .center,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding: EdgeInsets
//                                                                .fromLTRB(
//                                                                    5, 5, 5, 5),
//                                                            child: Icon(
//                                                              Icons
//                                                                  .play_circle_outline,
//                                                              color:
//                                                                  Colors.white,
//                                                              size: 20,
//                                                            ),
//                                                          ),
//                                                          Expanded(
//                                                            child: Padding(
//                                                              padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                          0,
//                                                                          5,
//                                                                          5,
//                                                                          5),
//                                                              child: Text(
//                                                                'Subsrcibed',
//                                                                style: TextStyle(
//                                                                    fontFamily:
//                                                                        'Helvetica Neue',
//                                                                    fontSize:
//                                                                        18,
//                                                                    color: Colors
//                                                                        .white,
//                                                                    fontWeight:
//                                                                        FontWeight
//                                                                            .w400),
//                                                              ),
//                                                            ),
//                                                          )
//                                                        ],
//                                                      )),
//                                                    ),
////                                    elevation: 5,
//                                                    shape:
//                                                        RoundedRectangleBorder(
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              40.0),
//                                                    ),
//                                                  ),
//                                                ),
//                                              )),
//                                            ),
//                                          ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5, 20, 5, 20),
                                      child: Icon(
                                        Icons.notifications,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),
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
//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: EdgeInsets.all(0),
//                                      child: Container(
//                                        padding: EdgeInsets.all(0),
//                                        decoration: BoxDecoration(
//                                          //borderRadius: BorderRadius.circular(40.0),
//                                          image: DecorationImage(
//                                            image: AssetImage(
//                                                "assets/images/image_eight.png"),
//                                            fit: BoxFit.fill,
//                                          ),
//                                          color: Colors.transparent,
//                                        ),
//                                        height: 200.0,
//                                        child: Container(
//                                          decoration: BoxDecoration(
//                                            borderRadius:
//                                                BorderRadius.circular(10.0),
////                        image: DecorationImage(
////                          image: AssetImage("assets/images/card_background.png"),
////                          fit: BoxFit.fill,
////
////                        ),
//                                            color: Colors.transparent,
//                                          ),
//                                          padding: EdgeInsets.all(20),
//                                          child: Stack(
//                                            children: <Widget>[
//                                              Align(
//                                                alignment:
//                                                    FractionalOffset.topRight,
//                                                child: Padding(
//                                                  padding: EdgeInsets.all(10),
//                                                  child: Padding(
//                                                    padding: EdgeInsets.all(0),
//                                                    child: Image.asset(
//                                                      "assets/images/live.png",
//                                                      height: 20.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
////                                                            Column(
////                                                              children: <
////                                                                  Widget>[
////
////                                                                Padding(
////                                                                  padding: EdgeInsets
////                                                                      .fromLTRB(
////                                                                      5,
////                                                                      5,
////                                                                      0,
////                                                                      0),
////                                                                  child:
////                                                                  Row(
////                                                                    crossAxisAlignment:
////                                                                    CrossAxisAlignment.center,
////                                                                    mainAxisAlignment:
////                                                                    MainAxisAlignment.center,
////                                                                    children: <
////                                                                        Widget>[
////                                                                      Padding(
////                                                                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
////                                                                        child: Center(
////                                                                          child:Container(
////                                                                            height:100,
////                                                                            width:100,
////                                                                            child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
////                                                                          ),
////                                                                        ),
////                                                                      ),
////                                                                    ],
////                                                                  ),
////                                                                ),
////
////
////                                                              ],
////                                                            ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding:
//                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                ),
//                                                child: Center(
//                                                  child: Padding(
//                                                    padding: EdgeInsets.all(0),
//                                                    child: Image.asset(
//                                                      "assets/images/bbbb.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'India News',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'WeWatch - 3.5k views',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Center(
//                                            child: Padding(
//                                              padding: EdgeInsets.all(20),
//                                              child: Image.asset(
//                                                "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                fit: BoxFit.fill,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
////                                           decoration: BoxDecoration(
////                                             image: DecorationImage(
////                                               image: AssetImage(
////                                                   "assets/images/background.png"),
////                                               fit: BoxFit.fill,
////                                             ),
////                                             borderRadius: BorderRadius.circular(10.0),
////                                           ),
//                              ),
//                              elevation: 0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.only(
//                                  topRight: Radius.circular(15),
//                                  topLeft: Radius.circular(15),
//                                  bottomLeft: Radius.circular(15),
//                                  bottomRight: Radius.circular(15),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding:
//                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
////                                        height: 100,
////                                        width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                ),
//                                                child: Center(
//                                                  child: Padding(
//                                                    padding: EdgeInsets.all(0),
//                                                    child: Image.asset(
//                                                      "assets/images/adventure.png",
//                                                      height: 150.0,
////                                              width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 15,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'AajTak News',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'WeWatch - 3.5k views - 1year ago',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Center(
//                                            child: Padding(
//                                              padding: EdgeInsets.all(20),
//                                              child: Image.asset(
//                                                "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                fit: BoxFit.fill,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                              ),
//                              elevation: 0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.only(
//                                  topRight: Radius.circular(15),
//                                  topLeft: Radius.circular(15),
//                                  bottomLeft: Radius.circular(15),
//                                  bottomRight: Radius.circular(15),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding:
//                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
////                                        height: 100,
////                                        width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                ),
//                                                child: Center(
//                                                  child: Padding(
//                                                    padding: EdgeInsets.all(0),
//                                                    child: Image.asset(
//                                                      "assets/images/desert.png",
//                                                      height: 150.0,
////                                              width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 15,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'AajTak News',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'WeWatch - 3.5k views - 1year ago',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Center(
//                                            child: Padding(
//                                              padding: EdgeInsets.all(20),
//                                              child: Image.asset(
//                                                "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                fit: BoxFit.fill,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                              ),
//                              elevation: 0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.only(
//                                  topRight: Radius.circular(15),
//                                  topLeft: Radius.circular(15),
//                                  bottomLeft: Radius.circular(15),
//                                  bottomRight: Radius.circular(15),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding:
//                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
////                                        height: 100,
////                                        width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                                ),
//                                                child: Center(
//                                                  child: Padding(
//                                                    padding: EdgeInsets.all(0),
//                                                    child: Image.asset(
//                                                      "assets/images/image_three.png",
//                                                      height: 150.0,
//                                                      width: 180.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 15,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'AajTak News',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                            .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'WeWatch - 3.5k views - 1year ago',
//                                                        style: TextStyle(
//
//                                                          color: Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                              FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                            TextAlign.left,
//                                                        textDirection:
//                                                            TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                          Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Center(
//                                            child: Padding(
//                                              padding: EdgeInsets.all(20),
//                                              child: Image.asset(
//                                                "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                                fit: BoxFit.fill,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                              ),
//                              elevation: 0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.only(
//                                  topRight: Radius.circular(15),
//                                  topLeft: Radius.circular(15),
//                                  bottomLeft: Radius.circular(15),
//                                  bottomRight: Radius.circular(15),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
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
            "My Channel",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Visibility(
              visible: (channel_name!=null),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => EditChannel()),
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


            Visibility(
              visible: (channel_name==null),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => AddChannel()),
                    );
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Channel {
  var id;
  var channel_name;
  var channel_logo;
  var channel_cover;
  var channel_description;
  var video_private;
  var subscribers_private;
  var playlists_private;

  Channel({
    this.id,
    this.channel_name,
    this.channel_logo,
    this.channel_cover,
    this.channel_description,
    this.video_private,
    this.subscribers_private,
    this.playlists_private,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      channel_name: json['channel_name'],
      channel_logo: json['channel_logo'],
      channel_cover: json['channel_cover'],
      channel_description: json['channel_description'],
      video_private: json['video_private'],
      subscribers_private: json['subscribers_private'],
      playlists_private: json['playlists_private'],
    );
  }
}

class ChannelCell extends StatefulWidget {
  int countValue = 0;

  ChannelCell(this.cellModel);

  @required
  final Channel cellModel;

  @override
  _ChannelCellState createState() => _ChannelCellState(this.cellModel);
}

class _ChannelCellState extends State<ChannelCell> {
  int countValue = 0;

  _ChannelCellState(this.cellModel);

  @required
  final Channel cellModel;

  static Container homeGrid(AsyncSnapshot<List<Channel>> snapshot, context) {
    Size size = MediaQuery.of(context).size;

    return Container(
//      width: size.width/2,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ChannelCell(
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
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Center(
//                                        heightFactor: 5,
                child: InkWell(
                  onTap: () {
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(builder: (context) => new VideoPage(youtubeLink: cellModel.youtube_link)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/image_eight.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  height: 200.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                      color: Colors.transparent,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: FractionalOffset.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Image.asset(
                                                "assets/images/live.png",
                                                height: 20.0,
                                                width: 50.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
//                                                            Column(
//                                                              children: <
//                                                                  Widget>[
//
//                                                                Padding(
//                                                                  padding: EdgeInsets
//                                                                      .fromLTRB(
//                                                                      5,
//                                                                      5,
//                                                                      0,
//                                                                      0),
//                                                                  child:
//                                                                  Row(
//                                                                    crossAxisAlignment:
//                                                                    CrossAxisAlignment.center,
//                                                                    mainAxisAlignment:
//                                                                    MainAxisAlignment.center,
//                                                                    children: <
//                                                                        Widget>[
//                                                                      Padding(
//                                                                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                                                        child: Center(
//                                                                          child:Container(
//                                                                            height:100,
//                                                                            width:100,
//                                                                            child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ],
//                                                                  ),
//                                                                ),
//
//
//                                                              ],
//                                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
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
                                              padding: EdgeInsets.all(0),
                                              child: Image.asset(
                                                "assets/images/bbbb.png",
                                                height: 50.0,
                                                width: 50.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'India News',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: 16,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'WeWatch - 3.5k views',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Image.asset(
                                          "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),
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
              ),
            ],
          )),
      onTap: () {
//        Navigator.of(context).push(
//            new MaterialPageRoute(builder: (context) => new VideoPage(youtubeLink: cellModel.youtube_link)));
      },
    );
  }
}
