import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/watch_later_three.dart';
import 'package:http/http.dart' as http;

import 'conts/config.dart';

class Subscribed extends StatefulWidget {
  @override
  _SubscribedState createState() => new _SubscribedState();
}

class _SubscribedState extends State<Subscribed> {
  Future<List<Quotes>> getQuotes(String type, String text) async {


    SharedPreferences prefs = await SharedPreferences.getInstance();

    String access_token = prefs.getString('access_token');
    String login_url =
        "https://wewatch.in/wewatch-up/api/v1/get-channels";
    var response = await http.get(login_url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    print(response.body);

    //Simulate a service call
    print('submitting to backend...');
    Map<String, dynamic> decodedMap = jsonDecode(response.body);
    Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    var body = await json.decode(response.body);

    try {
      if (response.statusCode == 200) {
        print("Ankit"+body.toString());

        List<dynamic> dynamicList = decodedMap['data']['results'];
        List<Quotes> students = new List<Quotes>();
        dynamicList.forEach((f) {
          Quotes s = Quotes.fromJson(f);
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Flexible(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ListView(
                      shrinkWrap: true,

                      children: <Widget>[

                        Padding(
                          padding:
                          EdgeInsets.all(0),
                          child: SizedBox(
//                  height: MediaQuery.of(context).size.height/3,
//                  width: MediaQuery.of(context).size.width,
                            child: FutureBuilder<List<Quotes>>(
                              future: getQuotes("",""),
                              builder: (context, snapshot) {
                                return snapshot.connectionState == ConnectionState.done
                                    ? snapshot.hasData
                                    ? _QuotesCellState.homeGrid(snapshot, context)
                                    : _QuotesCellState.retryButton(fetch)
                                    : _QuotesCellState.circularProgress();
                              },
                            ),
                          ),
                        ),


//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/comment_dp.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Color(0xff00adef),
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/image_ten.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Colors.grey,
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/comment_dp.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Color(0xff00adef),
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/image_ten.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Colors.grey,
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/comment_dp.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Color(0xff00adef),
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/image_ten.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Colors.grey,
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/comment_dp.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Color(0xff00adef),
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
//                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Card(
//                              child: Container(
//
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//
//
//                                    Padding(
//                                      padding:
//                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                      child: Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.start,
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                            EdgeInsets.fromLTRB(
//                                                0, 0, 0, 0),
//                                            child: Center(
//                                              child: Container(
//                                                height: 75,
//                                                width: 75,
//                                                decoration: BoxDecoration(
//                                                  color: Colors.white,
//                                                  borderRadius:
//                                                  BorderRadius
//                                                      .all(Radius
//                                                      .circular(
//                                                      50)),
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
//                                                    padding:
//                                                    EdgeInsets.all(
//                                                        0),
//                                                    child: Image.asset(
//                                                      "assets/images/image_ten.png",
//                                                      height: 50.0,
//                                                      width: 50.0,
//                                                      fit: BoxFit.fill,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                              const EdgeInsets.all(4.0),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        'Linkin Park',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 16,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets
//                                                        .fromLTRB(
//                                                        0.0, 10.0, 0.0, 0.0),
//                                                    child: Align(
//                                                      child: new Text(
//                                                        '67k Subscribers',
//
//                                                        style: TextStyle(
//
//                                                          color:
//                                                          Colors.black45,
//                                                          fontSize: 14,
//                                                          letterSpacing: 0,
//                                                          fontWeight:
//                                                          FontWeight.w400,
//                                                        ),
//                                                        textAlign:
//                                                        TextAlign.left,
//                                                        textDirection:
//                                                        TextDirection.ltr,
//                                                      ),
//                                                      alignment:
//                                                      Alignment.centerLeft,
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding: const EdgeInsets.fromLTRB(
//                                                  0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                    onTap: () {
//
//
//                                                    },
//                                                    child: Padding(
//                                                      padding: const EdgeInsets
//                                                          .fromLTRB(0, 0, 0, 0),
//                                                      child: Card(
//                                                        child: Container(
//                                                          decoration: new BoxDecoration(
//                                                            color: Colors.grey,
//                                                            borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                          ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                          child: Center(
//                                                              child: Row(
//                                                                mainAxisAlignment:
//                                                                MainAxisAlignment
//                                                                    .center,
//                                                                children: <Widget>[
//                                                                  Padding(
//                                                                    padding: EdgeInsets
//                                                                        .fromLTRB(
//                                                                        5, 5, 5, 5),
//                                                                    child: Icon(
//                                                                      Icons
//                                                                          .play_circle_outline,
//                                                                      color: Colors
//                                                                          .white,
//                                                                      size: 20,),
//                                                                  ),
//
//                                                                  Expanded(
//                                                                    child: Padding(
//                                                                      padding: EdgeInsets
//                                                                          .fromLTRB(
//                                                                          0, 5, 5,
//                                                                          5),
//                                                                      child: Text(
//                                                                        'Subsrcibed',
//                                                                        style: TextStyle(
//
//                                                                            fontSize: 18,
//                                                                            color: Colors
//                                                                                .white,
//                                                                            fontWeight: FontWeight
//                                                                                .w400),
//                                                                      ),
//                                                                    ),)
//
//
//                                                                ],
//                                                              )),
//                                                        ),
////                                    elevation: 5,
//                                                        shape: RoundedRectangleBorder(
//                                                          borderRadius: BorderRadius
//                                                              .circular(40.0),
//                                                        ),
//                                                      ),),
//                                                  )),
//                                            ),
//                                          ),
//
//                                          Center(
//                                            child: Padding(
//                                              padding:
//                                              EdgeInsets.fromLTRB(5, 20, 5, 20),
//                                              child: Icon(Icons.notifications,
//                                                color: Colors.grey,),
//                                            ),
//                                          ),
//
//
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
//
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
                    )),
              ),
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
            "Subscribed",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),

      ),
    );
  }

}

class Quotes {
  var id;
  var channel_logo;
  var channel_cover;
  var channel_name;
  var channel_description;


  Quotes({
    this.id,
    this.channel_logo,
    this.channel_cover,
    this.channel_name,
    this.channel_description,

  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id'],
      channel_logo: json['channel_logo'],
      channel_cover: json['channel_cover'],
      channel_name: json['channel_name'],
      channel_description: json['channel_description'],

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
  int countValue = 0;

  _QuotesCellState(this.cellModel);
  @required
  final Quotes cellModel;

  static Container homeGrid(AsyncSnapshot<List<Quotes>> snapshot, context) {
    Size size = MediaQuery.of(context).size;

    return Container(
//      height: double.infinity,
//      width: double.infinity,
      child: ListView.builder(
        physics:
        ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection:
        Axis.vertical,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                child: GestureDetector(
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => VideoPlay(id: cellModel.id.toString(),user_id: cellModel.user_id.toString(),citi_id: cellModel.citi_id.toString(),state_id: cellModel.state_id.toString(),video_category: cellModel.video_category.toString(),video_description: cellModel.video_description.toString(),video_file: cellModel.video_file.toString(),video_locality: cellModel.video_locality.toString(),video_tag: cellModel.video_tag.toString(),video_thumb_image: cellModel.video_thumb_image.toString(),video_title: cellModel.video_title.toString(), )),
//                    );
                  },
                  child: Card(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        cellModel.channel_cover,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
//                                    decoration: BoxDecoration(
//                                      image:
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
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
                                    padding: EdgeInsets.all(0),

                                  ),
                                ),
                              ),
//                              Center(
//                                child: Icon(
//                                  Icons
//                                      .play_circle_outline,
//                                  color: Color(0xff00adef)Accent,
//                                  size: 50,
//                                ),
//                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10, 0, 10, 10),
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
                                                  cellModel.channel_logo))
                                                  ? NetworkImage(
                                                cellModel.channel_logo,
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 10.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              (!["", null, false, 0,].contains(cellModel.channel_name)) ? cellModel.channel_name : "Channel Name",
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
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 10.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              (!["", null, false, 0,].contains(cellModel.channel_description)) ? cellModel.channel_description : "Channel Desc",
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
          )
      ),
      onTap: () {
        // setState(() => countValue == 0 ? countValue = 1 : countValue = 0);
        // Grid Click
      },
    );
  }
}