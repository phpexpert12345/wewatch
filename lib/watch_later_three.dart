import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchThree extends StatefulWidget {
  @override
  _WatchThreeState createState() => new _WatchThreeState();
}

class _WatchThreeState extends State<WatchThree> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              '346',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69).withOpacity(0.5),
                                                                fontSize: 12,
                                                                letterSpacing: 0,
                                                                fontWeight:
                                                                FontWeight.w400,
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
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Views',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 15,
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
                                                ),
                                                Container(
                                                  width: 1,
                                                    height: 45,
                                                    color:Color(0xff444b69),
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              '45k',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69).withOpacity(0.5),
                                                                fontSize: 12,
                                                                letterSpacing: 0,
                                                                fontWeight:
                                                                FontWeight.w400,
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
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Subscribers',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 15,
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
                                                ),
                                                Container(
                                                  width: 1,
                                                  height: 45,
                                                  color:Color(0xff444b69),
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              '75k',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69).withOpacity(0.5),
                                                                fontSize: 12,
                                                                letterSpacing: 0,
                                                                fontWeight:
                                                                FontWeight.w400,
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
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Comments',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 15,
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
                                                ),


                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding:EdgeInsets.all(10),
//                                            width: 1,
                                            height: 1,
                                            color:Color(0xff444b69),
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
                          const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Videos',

                                    style: TextStyle(

                                      color:
                                      Color(0xff444b69),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight:
                                      FontWeight.w500,
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
                                                '2.4M Views - 45 Commennt- 1k like -5k dlike',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
                                                  fontSize: 10,
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
                                                '2.4M Views - 45 Commennt- 1k like -5k dlike',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black45,
                                                  fontSize: 10,
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
                  padding:EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child:Container(

//                                            width: 1,
                  height: 1,
                  color:Color(0xff444b69).withOpacity(0.3),
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
                                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Views all 23',

                                    style: TextStyle(

                                      color:
                                      Color(0xff08c1f8),
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

                            ],
                          ),
                        ),
                      ),






                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child:Container(

//                                            width: 1,
                    height: 1,
                    color:Color(0xff444b69).withOpacity(0.3),
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
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'ANALYTICS Last 28 days',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
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







                                ],
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
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Watch time (minutes) :',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 13,
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
                                                            0.0, 0.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            '456h',

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xff444b69),
                                                              fontSize: 13,
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


                                              ],
                                            ),
                                          ),




                                        ],
                                      ),
                                    ),
                                  ),







                                ],
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
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Views : ',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 13,
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
                                                            0.0, 0.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            '45k',

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xff444b69),
                                                              fontSize: 13,
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


                                              ],
                                            ),
                                          ),




                                        ],
                                      ),
                                    ),
                                  ),







                                ],
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
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Subscribers :',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 13,
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
                                                            0.0, 0.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            '45k',

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xff444b69),
                                                              fontSize: 13,
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


                                              ],
                                            ),
                                          ),




                                        ],
                                      ),
                                    ),
                                  ),







                                ],
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
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                              0.0, 0.0, 0.0, 0.0),
                                                          child: Align(
                                                            child: new Text(
                                                              'Your estimated revenue : ',

                                                              style: TextStyle(

                                                                color:
                                                                Color(0xff444b69),
                                                                fontSize: 13,
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
                                                            0.0, 0.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            '45k',

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xff444b69),
                                                              fontSize: 13,
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


                                              ],
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
            "My Channel",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
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

}