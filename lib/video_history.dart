import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoHistory extends StatefulWidget {
  @override
  _VideoHistoryState createState() => new _VideoHistoryState();
}

class _VideoHistoryState extends State<VideoHistory> {
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
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        50)),
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors
                                                            .lightBlue,
                                                        style:
                                                        BorderStyle
                                                            .solid)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        0),
                                                    child: Image.asset(
                                                      "assets/images/fitness.png",
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Music',
                                                style: TextStyle(

                                                  color:
                                                  Color(0xFF253F5A),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        50)),
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors
                                                            .lightBlue,
                                                        style:
                                                        BorderStyle
                                                            .solid)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        0),
                                                    child: Image.asset(
                                                      "assets/images/entertainment.png",
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Movies',
                                                style: TextStyle(

                                                  color:
                                                  Color(0xFF253F5A),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        50)),
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors
                                                            .lightBlue,
                                                        style:
                                                        BorderStyle
                                                            .solid)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        0),
                                                    child: Image.asset(
                                                      "assets/images/fitness.png",
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Music',
                                                style: TextStyle(

                                                  color:
                                                  Color(0xFF253F5A),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        50)),
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors
                                                            .lightBlue,
                                                        style:
                                                        BorderStyle
                                                            .solid)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        0),
                                                    child: Image.asset(
                                                      "assets/images/entertainment.png",
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Movies',
                                                style: TextStyle(

                                                  color:
                                                  Color(0xFF253F5A),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        50)),
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors
                                                            .lightBlue,
                                                        style:
                                                        BorderStyle
                                                            .solid)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.all(
                                                        0),
                                                    child: Image.asset(
                                                      "assets/images/fitness.png",
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Music',
                                                style: TextStyle(

                                                  color:
                                                  Color(0xFF253F5A),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w200,
                                                ),
                                                textAlign:
                                                TextAlign.center,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                              alignment:
                                              Alignment.center,
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
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),

                      ),
                      elevation: 5,
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
                    onTap: () {},
                    child: Card(
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.all(0),
                              child: Container(
                                padding:
                                EdgeInsets.all(0),
                                decoration:
                                BoxDecoration(
                                  //borderRadius: BorderRadius.circular(40.0),
                                  image:
                                  DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_one.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  color: Colors
                                      .transparent,
                                ),
                                height: 200.0,
                                child: Container(
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                    color: Colors
                                        .transparent,
                                  ),
                                  padding:
                                  EdgeInsets.all(
                                      0),
                                  child: Stack(
                                    children: <
                                        Widget>[
                                      Align(
                                        alignment:FractionalOffset.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.all(
                                                0),
                                            child: Image.asset(
                                              "assets/images/live.png",
                                              height: 20.0,
                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Column(
                                        children: <
                                            Widget>[

                                          Padding(
                                            padding: EdgeInsets
                                                .fromLTRB(
                                                5,
                                                5,
                                                0,
                                                0),
                                            child:
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <
                                                  Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Center(
                                                    child:Container(
                                                      height:100,
                                                      width:100,
                                                      child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              ),
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
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius
                                              .all(Radius
                                              .circular(
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
                                                'India News',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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
                                                'WeWatch - 3.5k views',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          20),
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
                            Padding(
                              padding:
                              EdgeInsets.all(0),
                              child: Container(
                                padding:
                                EdgeInsets.all(0),
                                decoration:
                                BoxDecoration(
                                  //borderRadius: BorderRadius.circular(40.0),
                                  image:
                                  DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_two.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  color: Colors
                                      .transparent,
                                ),
                                height: 200.0,
                                child: Container(
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                    color: Colors
                                        .transparent,
                                  ),
                                  padding:
                                  EdgeInsets.all(
                                      20),
                                  child: Stack(
                                    children: <
                                        Widget>[
                                      Align(
                                        alignment:FractionalOffset.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.all(
                                                0),
                                            child: Image.asset(
                                              "assets/images/live.png",
                                              height: 20.0,
                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <
                                            Widget>[

                                          Padding(
                                            padding: EdgeInsets
                                                .fromLTRB(
                                                5,
                                                5,
                                                0,
                                                0),
                                            child:
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <
                                                  Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Center(
                                                    child:Container(
                                                      height:100,
                                                      width:100,
                                                      child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              ),
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
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius
                                              .all(Radius
                                              .circular(
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
                                                'India News',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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
                                                'WeWatch - 3.5k views',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          20),
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
                            Padding(
                              padding:
                              EdgeInsets.all(0),
                              child: Container(
                                padding:
                                EdgeInsets.all(0),
                                decoration:
                                BoxDecoration(
                                  //borderRadius: BorderRadius.circular(40.0),
                                  image:
                                  DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_three.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  color: Colors
                                      .transparent,
                                ),
                                height: 200.0,
                                child: Container(
                                  decoration:
                                  BoxDecoration(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                    color: Colors
                                        .transparent,
                                  ),
                                  padding:
                                  EdgeInsets.all(
                                      20),
                                  child: Stack(
                                    children: <
                                        Widget>[
                                      Column(
                                        children: <
                                            Widget>[

                                          Padding(
                                            padding: EdgeInsets
                                                .fromLTRB(
                                                5,
                                                5,
                                                0,
                                                0),
                                            child:
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <
                                                  Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Center(
                                                    child:Container(
                                                      height:100,
                                                      width:100,
                                                      child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              ),
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
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius
                                              .all(Radius
                                              .circular(
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
                                                'India News',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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
                                                'WeWatch - 3.5k views',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
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

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          20),
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
            "History",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),
//        bottomNavigationBar: BottomNavigationBar(
//          items: const <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text(''),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.play_arrow),
//              title: Text(''),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.shopping_basket),
//              title: Text(''),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.explore),
//              title: Text(''),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.notifications),
//              title: Text(''),
//            ),
//          ],
//
//          selectedItemColor: Color(0xff00adef),
//          unselectedItemColor: Colors.black54,
//
//        ),
      ),
    );
  }

}