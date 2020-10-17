import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_watch_app/help_center.dart';
import 'package:we_watch_app/job_description.dart';
import 'package:we_watch_app/my_channel.dart';
import 'package:we_watch_app/settings.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/subscribed.dart';
import 'package:we_watch_app/terms_policy.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/upload_screen.dart';
import 'package:we_watch_app/video_history.dart';
import 'package:we_watch_app/video_play.dart';
import 'package:we_watch_app/watch_later_three.dart';

import 'change_password.dart';
import 'community.dart';
import 'downloads.dart';
import 'edit_profile.dart';

class VideoHomePage extends StatefulWidget {
  VideoHomePage({Key key}) : super(key: key);

  @override
  _VideoHomePageState createState() => _VideoHomePageState();
}

bool press = true;

class _VideoHomePageState extends State<VideoHomePage> {
  static List<Item> itemListTwo;

  loadListTwo() {
    itemListTwo = List();

    itemListTwo.add(Item('Employee', 1, "worker"));
    itemListTwo.add(Item('Jobs Feeds', 1, "job"));
    itemListTwo.add(Item('Latest Videos', 1, "group"));
    itemListTwo.add(Item('Social Workers', 1, "social_workers"));
    itemListTwo.add(Item('Employee', 1, "team"));
    itemListTwo.add(Item('Jobs Feeds', 1, "mind"));
    itemListTwo.add(Item('Latest Videos', 1, "group_two"));
    itemListTwo.add(Item('Social Workers', 1, "real_estate"));
    itemListTwo.add(Item('Employee', 1, "union"));
    itemListTwo.add(Item('Jobs Feeds', 1, "social_cause"));
    itemListTwo.add(Item('Latest Videos', 1, "group"));
    itemListTwo.add(Item('Social Workers', 1, "social_workers"));
    itemListTwo.add(Item('Employee', 1, "worker"));
    itemListTwo.add(Item('Jobs Feeds', 1, "job"));
    itemListTwo.add(Item('Latest Videos', 1, "group"));
    itemListTwo.add(Item('Social Workers', 1, "social_workers"));
    itemListTwo.add(Item('Employee', 1, "worker"));
    itemListTwo.add(Item('Jobs Feeds', 1, "job"));
    itemListTwo.add(Item('Latest Videos', 1, "group"));
    itemListTwo.add(Item('Social Workers', 1, "social_workers"));
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    loadListTwo();
  }

  @override
  Widget build(BuildContext context) {
    double _animatedHeight = 100.0;
    int delayAmount = 400;

    List<Widget> _widgetOptions = <Widget>[
      Builder(
        builder: (context) {
          return Stack(
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
                  ShowUp(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: ClipPath(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/images/bbbb.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
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
                                              'Hi! Raj Kaushal',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'Morning 23 April',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
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
                                                  'Good Morning',
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 5.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Dig',
                                                  style: TextStyle(
                                                    color: Color(0xff00adef),
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
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: SvgPicture.asset(
                                        "assets/images/tea.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    delay: 400,
                  ),
                  ShowUp(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: ClipPath(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: press ? 6 : 15,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio:
                                            SizeConfig.heightMultiplier * 0.14,
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (index == 0) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Community()));
                                      } else if (index == 1) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Community()));
                                      } else if (index == 2) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Community()));
                                      }
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: (Colors.accents[Random()
                                                  .nextInt(Colors
                                                      .accents.length)])[100],
                                            ),
//                            width: 75.0,
                                            height: 100,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                                color: Colors.transparent,
                                              ),
                                              padding: EdgeInsets.all(0),
                                              child: Stack(
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 10, 0, 0),
                                                        child: SvgPicture.asset(
                                                          "assets/images/${itemListTwo[index].image}.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                          height: 40,
                                                          width: 40,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              FractionalOffset
                                                                  .bottomCenter,
                                                          child: Container(
                                                            color: Colors
                                                                .transparent,
                                                            width:
                                                                double.infinity,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          5),
                                                              child: Text(
                                                                itemListTwo[
                                                                        index]
                                                                    .text,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff444b69),
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _animatedHeight != 0.0
                                          ? _animatedHeight = 0.0
                                          : _animatedHeight = 100.0;
                                      press = !press;
                                    });
//                          if(!["", null, false, 0].contains(_name.text.toString())){
//                            if(!["", null, false, 0].contains(gender))
//                            {
//                              if(!["", null, false, 0,"Select Date"].contains(dob))
//                              {
//                                if(!["", null, false, 0,"Select Time"].contains(time1))
//                                {
//                                  if(!["", null, false, 0,].contains(_pob.text.toString()))
//                                  {
//
//                                    if(!["", null, false, 0,].contains(_state.text.toString()))
//                                    {
//                                      FocusScope.of(context)
//                                          .requestFocus(FocusNode());
//                                      pr.show();
//                                      getToekn();
//                                    }
//                                    else{
//                                      Fluttertoast.showToast(
//                                          msg: "Please Enter State",
//                                          toastLength: Toast.LENGTH_SHORT,
//                                          gravity: ToastGravity.CENTER,
//                                          timeInSecForIos: 10
//                                      );
//                                    }
//
//
//                                    //getToekn();
//
//                                  }else{
//                                    Fluttertoast.showToast(
//                                        msg: "Enter Place of birth",
//                                        toastLength: Toast.LENGTH_SHORT,
//                                        gravity: ToastGravity.CENTER,
//                                        timeInSecForIos: 1
//                                    );
//
//
//                                  }
//
//
//
//                                }else{
//
//                                  Fluttertoast.showToast(
//                                      msg: "Enter time of birth",
//                                      toastLength: Toast.LENGTH_SHORT,
//                                      gravity: ToastGravity.CENTER,
//                                      timeInSecForIos: 1
//                                  );
//
//
//                                }
//
//                                //getToekn();
//
//                              }else{
//
//                                Fluttertoast.showToast(
//                                    msg: "Enter Date of birth",
//                                    toastLength: Toast.LENGTH_SHORT,
//                                    gravity: ToastGravity.CENTER,
//                                    timeInSecForIos: 1
//                                );
//
//                              }
//
//
//                            }else{
//
//                              Fluttertoast.showToast(
//                                  msg: "Please Select Gender",
//                                  toastLength: Toast.LENGTH_SHORT,
//                                  gravity: ToastGravity.CENTER,
//                                  timeInSecForIos: 1
//                              );
//
//                            }
//
//                          }else{
//
//
//                            Fluttertoast.showToast(
//                                msg: "Please Enter Name",
//                                toastLength: Toast.LENGTH_SHORT,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIos: 1
//                            );
//
//
//                          }
//
////                    setPersonalData();
                                  },
                                  child: Card(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(40),
                                          border: Border.all(
                                              color: Color(0xff00adef))),
                                      height: 40.0, // height of the button
                                      width: 120.0, // width of the button
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'View All',
                                            style: TextStyle(
                                                color: Color(0xff00adef),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          press
                                              ? Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Color(0xff00adef),
                                                )
                                              : Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: Color(0xff00adef),
                                                ),
                                        ],
                                      )),
                                    ),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    delay: 600,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => VideoPlay()),
//                        );
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 0),
                                        child: new Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: new BoxDecoration(
                                            color: const Color(0xff7c94b6),
                                            image: new DecorationImage(
                                              image: new AssetImage(
                                                "assets/images/image_profile.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(50.0)),
                                            border: new Border.all(
                                              color: Color(0xff00adef),
                                              width: 2.0,
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
                                                        0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Abhay',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'May 19 at 12:30 pm',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
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
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(40.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/social_worker_image.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        height: 200.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
//                                  Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Spacer(),
//                                          Align(
//                                            alignment:
//                                                FractionalOffset.topRight,
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.fromLTRB(
//                                                      10, 10, 10, 10),
//                                              child: Card(
//                                                child: Container(
//                                                  decoration: new BoxDecoration(
//                                                    color: Color(0xfff8082d),
//                                                    borderRadius:
//                                                        new BorderRadius
//                                                            .circular(50),
//                                                  ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                  child: Center(
//                                                      child: Row(
//                                                    mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .center,
//                                                    children: <Widget>[
//                                                      Padding(
//                                                        padding:
//                                                            EdgeInsets.fromLTRB(
//                                                                10, 2, 10, 2),
//                                                        child: Text(
//                                                          'LIVE',
//                                                          style: TextStyle(
//                                                              fontFamily:
//                                                                  'Helvetica Neue',
//                                                              fontSize: 12,
//                                                              color:
//                                                                  Colors.white,
//                                                              fontWeight:
//                                                                  FontWeight
//                                                                      .w400),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  )),
//                                                ),
////                                    elevation: 5,
//                                                shape: RoundedRectangleBorder(
//                                                  borderRadius:
//                                                      BorderRadius.circular(
//                                                          40.0),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                      Column(
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                            child: Row(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding: EdgeInsets.fromLTRB(
//                                                      0, 0, 0, 0),
//                                                  child: Center(
//                                                    child: Container(
//                                                      height: 100,
//                                                      width: 100,
//                                                      child: Icon(
//                                                        Icons
//                                                            .play_circle_outline,
//                                                        color: Colors.white,
//                                                        size: 50,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
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
                                            'Would like to ask candidate to respond to any criteria entered below',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
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
                                Container(
                                  height: 1,
                                  color: Color(0xff414767),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/heart.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Like',
                                                    style: TextStyle(
                                                      color: Color(0xff444b69),
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Comment',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Share',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
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
                    delay: 800,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => VideoPlay()),
//                        );
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 0),
                                        child: new Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: new BoxDecoration(
                                            color: const Color(0xff7c94b6),
                                            image: new DecorationImage(
                                              image: new AssetImage(
                                                "assets/images/image_profile.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(50.0)),
                                            border: new Border.all(
                                              color: Color(0xff00adef),
                                              width: 2.0,
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
                                                        0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Abhay',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'May 19 at 12:30 pm',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
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
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(40.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/social_worker_image.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        height: 200.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
//                                  Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Spacer(),
//                                          Align(
//                                            alignment:
//                                                FractionalOffset.topRight,
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.fromLTRB(
//                                                      10, 10, 10, 10),
//                                              child: Card(
//                                                child: Container(
//                                                  decoration: new BoxDecoration(
//                                                    color: Color(0xfff8082d),
//                                                    borderRadius:
//                                                        new BorderRadius
//                                                            .circular(50),
//                                                  ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                  child: Center(
//                                                      child: Row(
//                                                    mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .center,
//                                                    children: <Widget>[
//                                                      Padding(
//                                                        padding:
//                                                            EdgeInsets.fromLTRB(
//                                                                10, 2, 10, 2),
//                                                        child: Text(
//                                                          'LIVE',
//                                                          style: TextStyle(
//                                                              fontFamily:
//                                                                  'Helvetica Neue',
//                                                              fontSize: 12,
//                                                              color:
//                                                                  Colors.white,
//                                                              fontWeight:
//                                                                  FontWeight
//                                                                      .w400),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  )),
//                                                ),
////                                    elevation: 5,
//                                                shape: RoundedRectangleBorder(
//                                                  borderRadius:
//                                                      BorderRadius.circular(
//                                                          40.0),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                      Column(
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                            child: Row(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding: EdgeInsets.fromLTRB(
//                                                      0, 0, 0, 0),
//                                                  child: Center(
//                                                    child: Container(
//                                                      height: 100,
//                                                      width: 100,
//                                                      child: Icon(
//                                                        Icons
//                                                            .play_circle_outline,
//                                                        color: Colors.white,
//                                                        size: 50,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
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
                                            'Would like to ask candidate to respond to any criteria entered below',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
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
                                Container(
                                  height: 1,
                                  color: Color(0xff414767),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/heart.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Like',
                                                    style: TextStyle(
                                                      color: Color(0xff444b69),
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Comment',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Share',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
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
                    delay: 1000,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => VideoPlay()),
//                        );
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 0),
                                        child: new Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: new BoxDecoration(
                                            color: const Color(0xff7c94b6),
                                            image: new DecorationImage(
                                              image: new AssetImage(
                                                "assets/images/image_profile.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(50.0)),
                                            border: new Border.all(
                                              color: Color(0xff00adef),
                                              width: 2.0,
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
                                                        0.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Abhay',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'May 19 at 12:30 pm',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
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
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(40.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/social_worker_image.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        height: 200.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
//                                  Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Spacer(),
//                                          Align(
//                                            alignment:
//                                                FractionalOffset.topRight,
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.fromLTRB(
//                                                      10, 10, 10, 10),
//                                              child: Card(
//                                                child: Container(
//                                                  decoration: new BoxDecoration(
//                                                    color: Color(0xfff8082d),
//                                                    borderRadius:
//                                                        new BorderRadius
//                                                            .circular(50),
//                                                  ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                  child: Center(
//                                                      child: Row(
//                                                    mainAxisAlignment:
//                                                        MainAxisAlignment
//                                                            .center,
//                                                    children: <Widget>[
//                                                      Padding(
//                                                        padding:
//                                                            EdgeInsets.fromLTRB(
//                                                                10, 2, 10, 2),
//                                                        child: Text(
//                                                          'LIVE',
//                                                          style: TextStyle(
//                                                              fontFamily:
//                                                                  'Helvetica Neue',
//                                                              fontSize: 12,
//                                                              color:
//                                                                  Colors.white,
//                                                              fontWeight:
//                                                                  FontWeight
//                                                                      .w400),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  )),
//                                                ),
////                                    elevation: 5,
//                                                shape: RoundedRectangleBorder(
//                                                  borderRadius:
//                                                      BorderRadius.circular(
//                                                          40.0),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                      Column(
//                                        children: <Widget>[
//                                          Padding(
//                                            padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                            child: Row(
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding: EdgeInsets.fromLTRB(
//                                                      0, 0, 0, 0),
//                                                  child: Center(
//                                                    child: Container(
//                                                      height: 100,
//                                                      width: 100,
//                                                      child: Icon(
//                                                        Icons
//                                                            .play_circle_outline,
//                                                        color: Colors.white,
//                                                        size: 50,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
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
                                            'Would like to ask candidate to respond to any criteria entered below',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
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
                                Container(
                                  height: 1,
                                  color: Color(0xff414767),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/heart.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Like',
                                                    style: TextStyle(
                                                      color: Color(0xff444b69),
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Comment',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
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
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
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
                                                            EdgeInsets.all(0),
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
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Share',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
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
                    delay: 1200,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      Builder(
        builder: (context) {
          return Stack(
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
                  ShowUp(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: ClipPath(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: new Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                          "assets/images/image_profile.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(50.0)),
                                      border: new Border.all(
                                        color: Color(0xff00adef),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
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
                                              'Hi! Raj Kaushal',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'Morning 23 April',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
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
                                                  'Good Morning',
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 5.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Dig',
                                                  style: TextStyle(
                                                    color: Color(0xff00adef),
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
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: SvgPicture.asset(
                                        "assets/images/tea.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    delay: delayAmount,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: TextField(
//                        controller: nameController,/
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    labelText: 'Search job tile or keyboard ',
                                  ),
                                  onChanged: (text) {
                                    setState(() {
//                            UserName = text;
                                      //you can access nameController in its scope to get
                                      // the value of text entered as shown below
                                      //UserName = nameController.text;
                                    });
                                  },
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: new Container(
                                width: 55.0,
                                height: 55.0,
                                decoration: new BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                      "assets/images/filter.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(5.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    delay: delayAmount + 200,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
                      child: Expanded(
                        child: Text(
                          'Job category',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color(0xff444b69),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    delay: delayAmount + 400,
                  ),
                  ShowUp(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: SizedBox(
                            height: 100.0,
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 15,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        //borderRadius: BorderRadius.circular(40.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                        color: Colors.white,
                                      ),
                                      width: 200.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                          color: Colors.white,
                                          border: new Border.all(
                                            color: Color(0xff00adef),
                                            width: 2.0,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 20, 0),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        child: SvgPicture.asset(
                                                          "assets/images/tie.svg",
                                                          color:
                                                              Color(0xff00adef),
//                                              semanticsLabel: 'A red up arrow'
                                                          height: 35,
                                                          width: 35,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Full Time',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff00adef),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                    )),
                          ),
                        ),
                      ],
                    ),
                    delay: delayAmount + 600,
                  ),
                  ShowUp(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Recruiters in top companies',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color(0xff0c1c4d),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    delay: delayAmount + 800,
                  ),
                  ShowUp(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: SizedBox(
                            height: 250.0,
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 15,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        //borderRadius: BorderRadius.circular(40.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                        color: Colors.white,
                                      ),
                                      width: 180.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                          color: Color(0xffe4e4e4),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 10, 0),
                                              child: new Container(
                                                width: 75.0,
                                                height: 75.0,
                                                decoration: new BoxDecoration(
                                                  color:
                                                      const Color(0xff7c94b6),
                                                  image: new DecorationImage(
                                                    image: new AssetImage(
                                                      "assets/images/company_logo.png",
                                                    ),
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              50.0)),
                                                  border: new Border.all(
                                                    color: Color(0xff00adef),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 10, 5, 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'McDonalds',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff444b69),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Noida',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff444b69),
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Card(
                                                child: Container(
                                                  decoration: new BoxDecoration(
                                                      color: Color(0xff00adef),
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(40),
                                                      border: Border.all(
                                                          color: Color(
                                                              0xff00adef))),
                                                  height:
                                                      40.0, // height of the button
//                                                width: 120.0, // width of the button
                                                  child: Center(
                                                      child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        '3 Job vacancy',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                    delay: delayAmount + 1000,
                  ),
                  ShowUp(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Recommended for you',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color(0xff0c1c4d),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    delay: delayAmount + 1200,
                  ),
                  ShowUp(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDescription()),
                            );
                          },
                          child: Card(
                            elevation: 3,
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
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 0),
                                          child: new Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              image: new DecorationImage(
                                                image: new AssetImage(
                                                  "assets/images/beats.png",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: new BorderRadius
                                                      .all(
                                                  new Radius.circular(50.0)),
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
                                                          0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Agriculture Group',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Shell Lubricant',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 13,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Card(
                                                  child: Container(
                                                    decoration: new BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(40),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff00adef))),
                                                    height:
                                                        30.0, // height of the button
                                                    width:
                                                        80.0, // width of the button
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'Full Time',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff00adef),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: SvgPicture.asset(
                                              "assets/images/bookmark.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                              height: 25,
                                              width: 25,
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
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Ux Design',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Communication',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Team Work',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
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
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat.',
                                              style: TextStyle(
                                                color: Color(0xff444b69),
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
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
                                            padding: const EdgeInsets.all(10),
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      child: SvgPicture.asset(
                                                        "assets/images/location.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Delhi NCR',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Delhi NCR',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff444b69),
                                                          fontSize: 13,
                                                          letterSpacing: 0,
//                                                        fontWeight:
//                                                        FontWeight.w600,
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
                    delay: delayAmount + 1400,
                  ),
                  ShowUp(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDescription()),
                            );
                          },
                          child: Card(
                            elevation: 3,
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
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 0),
                                          child: new Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              image: new DecorationImage(
                                                image: new AssetImage(
                                                  "assets/images/beats.png",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: new BorderRadius
                                                      .all(
                                                  new Radius.circular(50.0)),
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
                                                          0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Agriculture Group',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Shell Lubricant',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 13,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Card(
                                                  child: Container(
                                                    decoration: new BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(40),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff00adef))),
                                                    height:
                                                        30.0, // height of the button
                                                    width:
                                                        80.0, // width of the button
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'Full Time',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff00adef),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: SvgPicture.asset(
                                              "assets/images/bookmark.svg",
                                              color: Color(0xff00adef),
//                                              semanticsLabel: 'A red up arrow'
                                              height: 25,
                                              width: 25,
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
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Ux Design',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Communication',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Card(
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xff90dbf8),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff90dbf8))),
                                              height:
                                                  30.0, // height of the button
//                                              width: 80.0, // width of the button
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Team Work',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
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
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat.',
                                              style: TextStyle(
                                                color: Color(0xff444b69),
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
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
                                            padding: const EdgeInsets.all(10),
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      child: SvgPicture.asset(
                                                        "assets/images/location.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Delhi NCR',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Delhi NCR',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff444b69),
                                                          fontSize: 13,
                                                          letterSpacing: 0,
//                                                        fontWeight:
//                                                        FontWeight.w600,
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
                    delay: delayAmount + 1600,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      Container(),
      Container(),
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
                child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Card(
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Color(0xff00adef),
                      borderRadius: new BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 1.0),
                    ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
//                  showDialog(
//                      context: context,
//                      builder: (BuildContext context) {
//
//                        return Container(
//                          child: AlertDialog(
//                            backgroundColor: Colors.white,
//                            title: Text('', style: TextStyle(
//
//                              fontSize: 18,
//                              fontWeight: FontWeight.w500,
//                              color: Colors.white,
//                            ),),
//                            content: Container(
//                              padding: EdgeInsets.all(10),
//
//
//                              child: setupAlertDialog(),
//                            ),
//                          ),
//                        );
//                      }
//                  );
                });
              },
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(
                Icons.message,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(
                Icons.person,
              ),
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
                      decoration: BoxDecoration(
                        color: Color(0xffe320e3),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyChannel()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff151eaf),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            "assets/images/my_videos.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "My Videos",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VideoHistory()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xfff40875),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/images/add.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Add Videos",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Upload()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffef7432),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: SvgPicture.asset(
                                "assets/images/refresh.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                "assets/images/watch_later.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      "Watch Later",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WatchThree()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff5f266d),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "My Subscription",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Subscribed()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff151eaf),
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
                      decoration: BoxDecoration(
                        color: Color(0xff31b911),
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
                      decoration: BoxDecoration(
                        color: Color(0xfffa4e02),
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
                      decoration: BoxDecoration(
                        color: Color(0xff2fcee1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            "assets/images/edit_personal.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Edit Personal Informations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffff0504),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            "assets/images/change_password.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff42445d),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Downloads()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xfff40875),
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/social_workers.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/job.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/worker.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff00adef),
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
////          tooltip: 'Live',
//        child: Container(
//          decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              gradient: LinearGradient(
//                  begin: Alignment.topLeft,
//                  end: Alignment.bottomRight,
//                  stops: [0.3, 1],
//                  colors: [Color(0xff08c1f8), Color(0xff3017ed)])),
//          child: Center(
//            child: Container(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text("LIVE"),
//                  Align(
//                    alignment: FractionalOffset.bottomRight,
//                    child: Padding(
//                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                      child: Icon(
//                        Icons.brightness_1,
//                        size: 5,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
    );
  }
}

class Item {
  String text;
  int id;
  String image;

  Item(this.text, this.id, this.image);
}
