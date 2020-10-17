import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/create_an_account.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/verify_otp.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/onboard_three.png'),
                  )),
            ),
            Scaffold(
//      backgroundColor: Colors.transparent,
              appBar: AppBar(
//        backgroundColor: Colors.transparent,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {


                          },
                          child: Padding( padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                bottom: TabBar(
                  labelPadding: EdgeInsets.all(0),
//                  indicatorColor: Color(0xfff2a064),
                  tabs: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('Trending',style: TextStyle(fontSize: 13),),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('Subscriptions',style: TextStyle(fontSize: 13),),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('Categories',style: TextStyle(fontSize: 13),),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('My Videos',style: TextStyle(fontSize: 13),),
                      ),
                    ),


                  ],
                ),
              ),
              body:  SafeArea(
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
                               )),
                          ),
                        ),
                      ],
                    ),

                    Container(),
                    Container(),
                    Container(),


                  ],
                ),
              ),
              drawer: Drawer(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/back_two.png'),
                          )),
                    ),
                    ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          decoration: new BoxDecoration(),
                          accountEmail: Text(
                            "Ankit.aic193@Gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          accountName: Text(
                            "Ankit Prajapati",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Color(0xfff2a064),
                            child: Text(
                              "AP",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.dashboard,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Predictions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("/periodical_prediction");
                          },
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/circular_list.png',
                            height: 30.0,
                            width: 30.0,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Horoscope",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("/zodiac_horoscope");
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.add_to_photos,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Spin to Win",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Roulette()),
//                    );
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                          title: Text(
                            "About Us",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Share with Friends",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.rate_review,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Rate and Review",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.flag,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
//                    );
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.flag,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Payment Terms & Conditions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => PaymentTermsConditions()),
//                    );
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.highlight_off,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Sign out",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
//                    erase();
//                    Navigator.of(context).pushAndRemoveUntil ( MaterialPageRoute(builder: (BuildContext context) => LanguageSelection()) , (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
                  ],
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
                currentIndex: _selectedIndex,
                selectedItemColor: Color(0xff00adef),
                unselectedItemColor: Colors.black54,
                onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }

}