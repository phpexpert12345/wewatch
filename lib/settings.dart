import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/auto_play.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/change_password.dart';
import 'package:we_watch_app/util/UtilityClass.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState(){
    checkNotificationSetting();
    super.initState();
  }
  int index=0;
  checkNotificationSetting() async{
    await SharedPreferences.getInstance().then((value) {
       String noti= value.getString("notification") ?? "";
       if(!["",null].contains(noti) && noti.compareTo("on")==0){
         setState(() {
           index=1;
         });

       }else if(!["",null].contains(noti) && noti.compareTo("Off")==0){
         setState(() {
           index=0;
         });

       }
    });
  }

  bool isSwitched = true;
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
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'General',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AutoPlay()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'Autoplay',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Settings()),
//                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'Downloads',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'History & privacy',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                    const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets
                                .fromLTRB(
                                5.0, 10.0, 0.0, 0.0),
                            child: Align(
                              child: new Text(
                                'Notifications',
                                style: TextStyle(
                                  color:
                                  Color(0xff444b69),
                                  fontSize: 18,
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
                        ),

                        Container(
                          //width: 80,
                          padding: EdgeInsets.only(left:5,right: 5),
                          child: ToggleSwitch(
                            minWidth: 60.0,
                            cornerRadius: 20.0,
                            activeBgColor: Colors.cyan,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            labels: ['Off', 'On'],
                            initialLabelIndex: index,
                            icons: [FontAwesomeIcons.times,FontAwesomeIcons.check],
                            onToggle: (index) {
                              print('switched to: $index');
                              notificationOnOff(index.toString());
                            },
                          ),
                        ),


                      ],
                    ),


                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: Text("Change Password",style: TextStyle(

                      color:
                      Color(0xff444b69),
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight:
                      FontWeight.w400,
                    ),
                      textAlign:
                      TextAlign.left,
                      textDirection:
                      TextDirection.ltr,),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'Live Chat',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'Captions',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child:  Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[

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
                                              'About',

                                              style: TextStyle(

                                                color:
                                                Color(0xff444b69),
                                                fontSize: 18,
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


                              ],
                            ),
                          ),
                        ],
                      ),


                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginScreenProcessTwo()),
                            (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 0, 0, 10),
                    child: ListTile(
                      title: Text("Logout",style: TextStyle(

                        color:
                        Color(0xff444b69),
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight:
                        FontWeight.w400,
                      ),
                        textAlign:
                        TextAlign.left,
                        textDirection:
                        TextDirection.ltr,),
                    )
                  ),
                ),






              ],
            ),
          ],
        ),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),

          title: Text(
            "Settings",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),

      ),
    );
  }
  Future erase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.commit();
  }

  void notificationOnOff(String status) async {
    print("status "+status);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    var url = WatchAPI.ON_OFF_NOTIFICATION;
    var response = await http.post(url,
        body: <String,dynamic>{
      "status":status
    }, headers: {
      'Authorization': 'Bearer $access_token',
    });
    try {
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print("noti +"+body['notification']);
        prefs.setString("notification", body['notification']);
        Fluttertoast.showToast(
            msg:"notification "+ body['notification'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color(0xff00adef),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Please try after some time",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      if(int.parse(status)==0){
        setState(() {

          index=1;
        });
      }else if(int.parse(status)==1){
        setState(() {

          index=0;
        });
      }
      throw Exception(e);
    }
  }
}