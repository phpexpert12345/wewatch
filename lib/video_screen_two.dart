import 'package:flutter/material.dart';
import 'package:we_watch_app/help_center.dart';
import 'package:we_watch_app/settings.dart';
import 'package:we_watch_app/terms_policy.dart';


class VideoScreenTwo extends StatefulWidget {
  VideoScreenTwo({Key key}) : super(key: key);

  @override
  _VideoScreenTwoState createState() => _VideoScreenTwoState();
}

class _VideoScreenTwoState extends State<VideoScreenTwo> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[

    Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Stack(
            children: <Widget>[
//              Container(
//                decoration: new BoxDecoration(
//                    image: new DecorationImage(
//                      fit: BoxFit.fill,
//                      image: AssetImage('assets/images/onboard_three.png'),
//                    )),
//              ),
              Scaffold(
//      backgroundColor: Colors.transparent,
                appBar: new PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: new Container(
                    height: 50,
                    color: Color(0xff00adef),
                    child: new TabBar(
                      labelPadding: EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      tabs: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Trending', style: TextStyle(fontSize: 13),),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Subscriptions', style: TextStyle(fontSize: 13),),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Categories', style: TextStyle(fontSize: 13),),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'My Videos', style: TextStyle(fontSize: 13),),
                          ),
                        ),


                      ],
                    ),

                  ),
                ),

                body: SafeArea(
                  child: TabBarView(
                    children: [
                      Stack(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
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
                                                              "assets/images/image_seven.png"),
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
//                                                            Align(
//                                                              alignment:FractionalOffset.topRight,
//                                                              child: Padding(
//                                                                padding: EdgeInsets.all(10),
//                                                                child: Padding(
//                                                                  padding:
//                                                                  EdgeInsets.all(
//                                                                      0),
//                                                                  child: Image.asset(
//                                                                    "assets/images/live.png",
//                                                                    height: 20.0,
//                                                                    width: 50.0,
//                                                                    fit: BoxFit.fill,
//                                                                  ),
//                                                                ),
//                                                              ),
//                                                            ),
//
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
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/comment_dp.png",
                                                                    height: 50.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Linkin Park',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      '67k Subscribers',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(
                                                                0, 10, 0, 10),
                                                            child: Center(
                                                                child: GestureDetector(
                                                                  onTap: () {


                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0, 0, 0,
                                                                        0),
                                                                    child: Card(
                                                                      child: Container(
                                                                        decoration: new BoxDecoration(
                                                                          color: Colors
                                                                              .blue,
                                                                          borderRadius:
                                                                          new BorderRadius
                                                                              .circular(
                                                                              50),
                                                                        ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                                        child: Center(
                                                                            child: Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .center,
                                                                              children: <
                                                                                  Widget>[
                                                                                Padding(
                                                                                  padding: EdgeInsets
                                                                                      .fromLTRB(
                                                                                      5,
                                                                                      5,
                                                                                      5,
                                                                                      5),
                                                                                  child: Icon(
                                                                                    Icons
                                                                                        .play_circle_outline,
                                                                                    color: Colors
                                                                                        .white,
                                                                                    size: 20,),
                                                                                ),

                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets
                                                                                        .fromLTRB(
                                                                                        0,
                                                                                        5,
                                                                                        5,
                                                                                        5),
                                                                                    child: Text(
                                                                                      'Subsrcibed',
                                                                                      style: TextStyle(

                                                                                          fontSize: 18,
                                                                                          color: Colors
                                                                                              .white,
                                                                                          fontWeight: FontWeight
                                                                                              .w400),
                                                                                    ),
                                                                                  ),)


                                                                              ],
                                                                            )),
                                                                      ),
//                                    elevation: 5,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius
                                                                            .circular(
                                                                            40.0),
                                                                      ),
                                                                    ),),
                                                                )),
                                                          ),
                                                        ),

                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 20, 5, 20),
                                                            child: Icon(Icons
                                                                .notifications,
                                                              color: Colors
                                                                  .grey,),
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
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
                                                              "assets/images/image_eight.png"),
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
                                                              alignment: FractionalOffset
                                                                  .topRight,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .all(10),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/live.png",
                                                                    height: 20.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
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
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/bbbb.png",
                                                                    height: 50.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'India News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[


                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
//                                        height: 100,
//                                        width: 75,
                                                              decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/adventure.png",
                                                                    height: 150.0,
//                                              width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Discovery TRVLR is a white-knuckle ride into the Live',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 15,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'AajTak News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views - 1year ago',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[


                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
//                                        height: 100,
//                                        width: 75,
                                                              decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/desert.png",
                                                                    height: 150.0,
//                                              width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Discovery TRVLR is a white-knuckle ride into the Live',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 15,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'AajTak News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views - 1year ago',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[


                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
//                                        height: 100,
//                                        width: 75,
                                                              decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/image_three.png",
                                                                    height: 150.0,
                                                                    width: 180.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Discovery TRVLR is a white-knuckle ride into the Live',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 15,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'AajTak News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views - 1year ago',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),

                      Stack(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0,
                                                                      0),
                                                                  child: Center(
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  50)),
                                                                          border: Border
                                                                              .all(
                                                                              width: 0,
                                                                              color: Colors
                                                                                  .lightBlue,
                                                                              style:
                                                                              BorderStyle
                                                                                  .solid)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/fitness.png",
                                                                            height: 50.0,
                                                                            width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Music',
                                                                      style: TextStyle(

                                                                        color:
                                                                        Color(
                                                                            0xFF253F5A),
                                                                        fontSize: 13,
                                                                        letterSpacing: 0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0,
                                                                      0),
                                                                  child: Center(
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  50)),
                                                                          border: Border
                                                                              .all(
                                                                              width: 0,
                                                                              color: Colors
                                                                                  .lightBlue,
                                                                              style:
                                                                              BorderStyle
                                                                                  .solid)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/entertainment.png",
                                                                            height: 50.0,
                                                                            width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Movies',
                                                                      style: TextStyle(

                                                                        color:
                                                                        Color(
                                                                            0xFF253F5A),
                                                                        fontSize: 13,
                                                                        letterSpacing: 0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0,
                                                                      0),
                                                                  child: Center(
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  50)),
                                                                          border: Border
                                                                              .all(
                                                                              width: 0,
                                                                              color: Colors
                                                                                  .lightBlue,
                                                                              style:
                                                                              BorderStyle
                                                                                  .solid)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/fitness.png",
                                                                            height: 50.0,
                                                                            width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Music',
                                                                      style: TextStyle(

                                                                        color:
                                                                        Color(
                                                                            0xFF253F5A),
                                                                        fontSize: 13,
                                                                        letterSpacing: 0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0,
                                                                      0),
                                                                  child: Center(
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  50)),
                                                                          border: Border
                                                                              .all(
                                                                              width: 0,
                                                                              color: Colors
                                                                                  .lightBlue,
                                                                              style:
                                                                              BorderStyle
                                                                                  .solid)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/entertainment.png",
                                                                            height: 50.0,
                                                                            width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Movies',
                                                                      style: TextStyle(

                                                                        color:
                                                                        Color(
                                                                            0xFF253F5A),
                                                                        fontSize: 13,
                                                                        letterSpacing: 0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0,
                                                                      0),
                                                                  child: Center(
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: 50,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  50)),
                                                                          border: Border
                                                                              .all(
                                                                              width: 0,
                                                                              color: Colors
                                                                                  .lightBlue,
                                                                              style:
                                                                              BorderStyle
                                                                                  .solid)),
                                                                      child: Center(
                                                                        child: Padding(
                                                                          padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                              0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/fitness.png",
                                                                            height: 50.0,
                                                                            width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'Music',
                                                                      style: TextStyle(

                                                                        color:
                                                                        Color(
                                                                            0xFF253F5A),
                                                                        fontSize: 13,
                                                                        letterSpacing: 0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
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
                                                              alignment: FractionalOffset
                                                                  .topRight,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .all(10),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/live.png",
                                                                    height: 20.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
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
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding: EdgeInsets
                                                                            .fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child: Center(
                                                                          child: Container(
                                                                            height: 100,
                                                                            width: 100,
                                                                            child: Icon(
                                                                              Icons
                                                                                  .play_circle_outline,
                                                                              color: Colors
                                                                                  .white,
                                                                              size: 50,),
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
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/bbbb.png",
                                                                    height: 50.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'India News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
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
                                                              alignment: FractionalOffset
                                                                  .topRight,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .all(10),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/live.png",
                                                                    height: 20.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
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
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding: EdgeInsets
                                                                            .fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child: Center(
                                                                          child: Container(
                                                                            height: 100,
                                                                            width: 100,
                                                                            child: Icon(
                                                                              Icons
                                                                                  .play_circle_outline,
                                                                              color: Colors
                                                                                  .white,
                                                                              size: 50,),
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
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/bbbb.png",
                                                                    height: 50.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'India News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 0, 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            child: Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
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
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding: EdgeInsets
                                                                            .fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child: Center(
                                                                          child: Container(
                                                                            height: 100,
                                                                            width: 100,
                                                                            child: Icon(
                                                                              Icons
                                                                                  .play_circle_outline,
                                                                              color: Colors
                                                                                  .white,
                                                                              size: 50,),
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
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
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
                                                                color: Colors
                                                                    .white,
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
                                                                  EdgeInsets
                                                                      .all(
                                                                      0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/bbbb.png",
                                                                    height: 50.0,
                                                                    width: 50.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <
                                                                  Widget>[

                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'India News',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 16,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0, 10.0,
                                                                      0.0, 0.0),
                                                                  child: Align(
                                                                    child: new Text(
                                                                      'WeWatch - 3.5k views',

                                                                      style: TextStyle(

                                                                        color:
                                                                        Colors
                                                                            .black45,
                                                                        fontSize: 14,
                                                                        letterSpacing: 0,
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
                                                                    alignment:
                                                                    Alignment
                                                                        .centerLeft,
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
                                                bottomRight: Radius.circular(
                                                    15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
//            Container(
//              width: double.infinity,
//              height: double.infinity,
//              child:  Image.asset("assets/images/on_bg_one.png",fit: BoxFit.fill,),
//
//            ),
                          ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 10, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
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
                                                      "assets/images/image_four.png"),
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
                                                      alignment: FractionalOffset
                                                          .topRight,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10),
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
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <
                                                                Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 10, 0,
                                                                    0),
                                                                child: Center(
                                                                  child: Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Icon(
                                                                      Icons
                                                                          .play_circle_outline,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 50,),
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
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
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
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
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
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
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
                                                      "assets/images/image_five.png"),
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
                                                      alignment: FractionalOffset
                                                          .topRight,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10),
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
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <
                                                                Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 10, 0,
                                                                    0),
                                                                child: Center(
                                                                  child: Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Icon(
                                                                      Icons
                                                                          .play_circle_outline,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 50,),
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
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
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
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
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
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
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
                                                      "assets/images/image_six.png"),
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
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <
                                                                Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 10, 0,
                                                                    0),
                                                                child: Center(
                                                                  child: Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Icon(
                                                                      Icons
                                                                          .play_circle_outline,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 50,),
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
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
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
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
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
                                                            Alignment
                                                                .centerLeft,
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
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
//              child:  Image.asset("assets/images/on_bg_one.png",fit: BoxFit.fill,),

                          ),
                          ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 10, 10, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                          padding:
                                                          EdgeInsets.all(
                                                              0),
                                                          child: Image.asset(
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Add your Comment…..',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
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
                              ),
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[

                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nisha singha - 2 day ago',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nice song but video hota to acha lagta﻿',

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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'View 13 Reples',

                                                              style: TextStyle(

                                                                color:
                                                                Color(
                                                                    0xff08c1f8),
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
                                                            Alignment
                                                                .centerLeft,
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
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[

                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nisha singha - 2 day ago',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nice song but video hota to acha lagta﻿',

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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'View 13 Reples',

                                                              style: TextStyle(

                                                                color:
                                                                Color(
                                                                    0xff08c1f8),
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
                                                            Alignment
                                                                .centerLeft,
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
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[

                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nisha singha - 2 day ago',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nice song but video hota to acha lagta﻿',

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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'View 13 Reples',

                                                              style: TextStyle(

                                                                color:
                                                                Color(
                                                                    0xff08c1f8),
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
                                                            Alignment
                                                                .centerLeft,
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
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[

                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nisha singha - 2 day ago',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nice song but video hota to acha lagta﻿',

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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'View 13 Reples',

                                                              style: TextStyle(

                                                                color:
                                                                Color(
                                                                    0xff08c1f8),
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
                                                            Alignment
                                                                .centerLeft,
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
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0, 0, 10),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[


                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Row(
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
                                                            "assets/images/comment_dp.png",
//                                              height: 150.0,
//                                              width: 50.0,
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
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[

                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nisha singha - 2 day ago',

                                                              style: TextStyle(

                                                                color:
                                                                Colors.black45,
                                                                fontSize: 15,
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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Nice song but video hota to acha lagta﻿',

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
                                                            Alignment
                                                                .centerLeft,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 10.0, 0.0,
                                                              0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'View 13 Reples',

                                                              style: TextStyle(

                                                                color:
                                                                Color(
                                                                    0xff08c1f8),
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
                                                            Alignment
                                                                .centerLeft,
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
                              Container(
                                height: 1,
                                color: Colors.black26,
                              ),


                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),


              ),
            ],
          ),
        ),
      ),
    ),
    Stack(
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
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                        onTap: () {},
                        child: Card(
                          child: Container(

                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
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
                                              "assets/images/comment_dp.png",
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
                                                'Discovery TRVLR is a white-knuckle ride into the Live',

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
                                                '2 day ago',

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
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 150,
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
                                              "assets/images/image_nine.png",
                                              height: 100,
                                              width: 150,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10),
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
                )),
          ),
        ),
      ],
    ),
    Stack(
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
                                                  "assets/images/comment_dp.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Color(0xff00adef),
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/image_ten.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/comment_dp.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Color(0xff00adef),
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/image_ten.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/comment_dp.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Color(0xff00adef),
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/image_ten.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/comment_dp.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Color(0xff00adef),
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                                                  "assets/images/image_ten.png",
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
                                                    'Linkin Park',

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
                                                    '67k Subscribers',

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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Center(
                                              child: GestureDetector(
                                                onTap: () {


                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(0, 0, 0, 0),
                                                  child: Card(
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                        new BorderRadius
                                                            .circular(50),
                                                      ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                      child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    5, 5, 5, 5),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,),
                                                              ),

                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 5,
                                                                      5),
                                                                  child: Text(
                                                                    'Subsrcibed',
                                                                    style: TextStyle(

                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight: FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),)


                                                            ],
                                                          )),
                                                    ),
//                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(40.0),
                                                    ),
                                                  ),),
                                              )),
                                        ),
                                      ),

                                      Center(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 20, 5, 20),
                                          child: Icon(Icons.notifications,
                                            color: Colors.grey,),
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
                )),
          ),
        ),
      ],
    ),
    Stack(
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
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
//                                        height: 100,
//                                        width: 75,
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
                                                "assets/images/adventure.png",
                                                height: 150.0,
//                                              width: 50.0,
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
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',

                                                  style: TextStyle(

                                                    color:
                                                    Colors.black45,
                                                    fontSize: 15,
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
                                                  'AajTak News',

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
                                                  'WeWatch - 3.5k views - 1year ago',

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
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
//                                        height: 100,
//                                        width: 75,
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
                                                "assets/images/desert.png",
                                                height: 150.0,
//                                              width: 50.0,
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
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',

                                                  style: TextStyle(

                                                    color:
                                                    Colors.black45,
                                                    fontSize: 15,
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
                                                  'AajTak News',

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
                                                  'WeWatch - 3.5k views - 1year ago',

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
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
//                                        height: 100,
//                                        width: 75,
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
                                                "assets/images/image_three.png",
                                                height: 150.0,
                                                width: 180.0,
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
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',

                                                  style: TextStyle(

                                                    color:
                                                    Colors.black45,
                                                    fontSize: 15,
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
                                                  'AajTak News',

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
                                                  'WeWatch - 3.5k views - 1year ago',

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
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
//                                        height: 100,
//                                        width: 75,
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
                                                "assets/images/adventure.png",
                                                height: 150.0,
//                                              width: 50.0,
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
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',

                                                  style: TextStyle(

                                                    color:
                                                    Colors.black45,
                                                    fontSize: 15,
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
                                                  'AajTak News',

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
                                                  'WeWatch - 3.5k views - 1year ago',

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
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
//                                        height: 100,
//                                        width: 75,
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
                                                "assets/images/adventure.png",
                                                height: 150.0,
//                                              width: 50.0,
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
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',

                                                  style: TextStyle(

                                                    color:
                                                    Colors.black45,
                                                    fontSize: 15,
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
                                                  'AajTak News',

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
                                                  'WeWatch - 3.5k views - 1year ago',

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
              ),),
          ),
        ),
      ],
    ),
    Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color:Color(0xff000000).withOpacity(0.17),
                        child: Container(


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[


                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[

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
                                          30,
                                          width:
                                          30,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff08c1f8).withOpacity(0.27),
                                                  Color(0xff3017ed).withOpacity(0.27)
                                                ]),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
//                                                 border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                            child:Padding(
                                              padding: EdgeInsets
                                                  .fromLTRB(0,
                                                  0,
                                                  0,
                                                  0),
                                              child:
                                              Center(
                                                child:
                                                Container(
                                                  height:
                                                  22,
                                                  width:
                                                  22,
                                                  decoration: BoxDecoration(



                                                    gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          Color(0xff08c1f8).withOpacity(0.52),
                                                          Color(0xff3017ed).withOpacity(0.52)
                                                        ]),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20)),
//                                                 border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                                  ),
                                                  child:Padding(
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
                                                        decoration: BoxDecoration(



                                                          gradient: LinearGradient(
                                                              begin: Alignment.topCenter,
                                                              end: Alignment.bottomCenter,
                                                              colors: [
                                                                Color(0xff08c1f8),
                                                                Color(0xff3017ed)
                                                              ]),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(10)),
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
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[


                                    Padding(
                                      padding: const EdgeInsets
                                          .fromLTRB(
                                          0.0, 10.0, 0.0, 30.0),
                                      child: Align(
                                        child: new Text(
                                          'Record',

                                          style: TextStyle(

                                            color:
                                            Color(0xff444b69),
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight:
                                            FontWeight.w500,
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
                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color:Color(0xff000000).withOpacity(0.17),
                        child: Container(


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[


                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets
                                          .fromLTRB(
                                          0,
                                          0,
                                          0,
                                          0),
                                      child:
                                      Center(
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
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[


                                    Padding(
                                      padding: const EdgeInsets
                                          .fromLTRB(
                                          0.0, 10.0, 0.0, 30.0),
                                      child: Align(
                                        child: new Text(
                                          'Go Live',

                                          style: TextStyle(

                                            color:
                                            Color(0xff444b69),
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight:
                                            FontWeight.w500,
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
                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color:Color(0xff000000).withOpacity(0.17),
                        child: Container(


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[


                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets
                                          .fromLTRB(
                                          0,
                                          0,
                                          0,
                                          0),
                                      child:
                                      Center(
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
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[


                                    Padding(
                                      padding: const EdgeInsets
                                          .fromLTRB(
                                          0.0, 10.0, 0.0, 30.0),
                                      child: Align(
                                        child: new Text(
                                          'Upload',

                                          style: TextStyle(

                                            color:
                                            Color(0xff444b69),
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight:
                                            FontWeight.w500,
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
              ),),
          ),
        ),
      ],
    ),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
                child: GestureDetector(
                  onTap: () {


                  },
                  child: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Card(
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xff00adef),
                          borderRadius:
                          new BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.white,
                              width: 1.0
                          ),

                        ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                        child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
//                                        Image.asset(
//                                          'assets/images/avatar.png',
//                                          height: 20.0,
//                                          width: 20.0,
//                                          fit: BoxFit.cover,
//                                        ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: Text(
                                    'I want to see…',
                                    style: TextStyle(

                                        fontSize: 15,
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
                    ),),
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(Icons.search,),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(Icons.message,),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(Icons.person,),
            ),
          ),

        ],
        title: Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: new IconThemeData(color: Colors.white),

      ),
      drawer: SizedBox(
        width: size.width,
        child: Drawer(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height / 4.5,
                width: size.width * 0.9,
                decoration: new BoxDecoration(
                    image: new DecorationImage(

                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/back_two.png'),
                    )),
              ),
              ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
//                  UserAccountsDrawerHeader(
//                    decoration: new BoxDecoration(),
//                    accountEmail: Text(
//                      "Ankit.aic193@Gmail.com",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    accountName: Text(
//                      "Ankit Prajapati",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    currentAccountPicture: CircleAvatar(
//                      backgroundColor: Color(0xfff2a064),
//                      child: Text(
//                        "AP",
//                        style: TextStyle(
//                          color: Colors.black,
//                        ),
//                      ),
//                    ),
//
//                  ),
                  ListTile(

                    title: Padding(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Account",
                              style: TextStyle(
                                color: Color(0xff5c5e6a),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/profile_pic.png',
                            height: 75.0,
                            width: 75.0,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xffe320e3),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/account.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "My Channel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => VideoScreenTwo()),
//                              );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xff151eaf),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/setting.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xff31b911),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/privacy_2.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Terms & Privacy policy",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsPolicy()),
                      );
                    },
                  ),

                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xfffa4e02),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/help.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Help & Feedback",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpCenter()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xfff40875),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/stopwatch.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "History",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
//                            onTap: () {
//                              Navigator.of(context)
//                                  .pushNamed("/zodiac_horoscope");
//                            },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xff42445d),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/outbox.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Downloads",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
//                            onTap: () {
//                              Navigator.of(context)
//                                  .pushNamed("/zodiac_horoscope");
//                            },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xfff40875),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/log_out.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
//                            onTap: () {
//                              Navigator.of(context)
//                                  .pushNamed("/zodiac_horoscope");
//                            },
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff00adef),
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){},
//          tooltip: 'Live',
        child: Container(

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Color(0xff08c1f8), Color(0xff3017ed)])
          ),
          child:  Center(

            child: Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("LIVE"),
                  Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.brightness_1,size: 5,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
