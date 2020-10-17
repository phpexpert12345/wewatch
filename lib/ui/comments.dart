import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => new _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                                0.0, 10.0, 0.0, 0.0),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'View 13 Reples',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff08c1f8),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'View 13 Reples',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff08c1f8),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'View 13 Reples',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff08c1f8),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'View 13 Reples',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff08c1f8),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
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
                                              Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'View 13 Reples',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff08c1f8),
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
                Container(
                  height: 1,
                  color: Colors.black26,
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
            "Live",
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