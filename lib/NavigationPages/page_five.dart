import 'package:flutter/material.dart';
import 'package:we_watch_app/ui/show_up.dart';

import '../size_config.dart';

class PageFive extends StatefulWidget {
  @override
  _PageFiveState createState() => new _PageFiveState();
}


class _PageFiveState extends State<PageFive> {
  int delayAmountThree=400;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      ShowUp(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 9.55,
                                            width: SizeConfig.widthMultiplier * 15.13,
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
                                                  "assets/images/comment_dp.png",
                                                  height: SizeConfig.heightMultiplier * 9.55,
                                                  width: SizeConfig.widthMultiplier * 15.13,
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
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Discovery TRVLR is a white-knuckle ride into the Live',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                    '2 day ago',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 12.73,
                                            width: SizeConfig.widthMultiplier * 38.26,
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
                                                  "assets/images/image_nine.png",
                                                  height: SizeConfig.heightMultiplier * 12.73,
                                                  width: SizeConfig.widthMultiplier * 38.26,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
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
                        delay: delayAmountThree,
                      ),

                      ShowUp(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 9.55,
                                            width: SizeConfig.widthMultiplier * 15.13,
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
                                                  "assets/images/comment_dp.png",
                                                  height: SizeConfig.heightMultiplier * 9.55,
                                                  width: SizeConfig.widthMultiplier * 15.13,
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
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Discovery TRVLR is a white-knuckle ride into the Live',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                    '2 day ago',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 12.73,
                                            width: SizeConfig.widthMultiplier * 38.26,
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
                                                  "assets/images/image_nine.png",
                                                  height: SizeConfig.heightMultiplier * 12.73,
                                                  width: SizeConfig.widthMultiplier * 38.26,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
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
                        delay: delayAmountThree+200,
                      ),

                      ShowUp(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 9.55,
                                            width: SizeConfig.widthMultiplier * 15.13,
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
                                                  "assets/images/comment_dp.png",
                                                  height: SizeConfig.heightMultiplier * 9.55,
                                                  width: SizeConfig.widthMultiplier * 15.13,
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
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Discovery TRVLR is a white-knuckle ride into the Live',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                    '2 day ago',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 12.73,
                                            width: SizeConfig.widthMultiplier * 38.26,
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
                                                  "assets/images/image_nine.png",
                                                  height: SizeConfig.heightMultiplier * 12.73,
                                                  width: SizeConfig.widthMultiplier * 38.26,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
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
                        delay: delayAmountThree+400,
                      ),

                      ShowUp(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 9.55,
                                            width: SizeConfig.widthMultiplier * 15.13,
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
                                                  "assets/images/comment_dp.png",
                                                  height: SizeConfig.heightMultiplier * 9.55,
                                                  width: SizeConfig.widthMultiplier * 15.13,
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
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Discovery TRVLR is a white-knuckle ride into the Live',
                                                    style: TextStyle(

                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                    '2 day ago',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 12.73,
                                            width: SizeConfig.widthMultiplier * 38.26,
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
                                                  "assets/images/image_nine.png",
                                                  height: SizeConfig.heightMultiplier * 12.73,
                                                  width: SizeConfig.widthMultiplier * 38.26,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
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
                        delay: delayAmountThree+600,
                      ),

                      ShowUp(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 9.55,
                                            width: SizeConfig.widthMultiplier * 15.13,
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
                                                  "assets/images/comment_dp.png",
                                                  height: SizeConfig.heightMultiplier * 9.55,
                                                  width: SizeConfig.widthMultiplier * 15.13,
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
                                                padding: const EdgeInsets.fromLTRB(
                                                    0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'Discovery TRVLR is a white-knuckle ride into the Live',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                    '2 day ago',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: SizeConfig.heightMultiplier * 12.73,
                                            width: SizeConfig.widthMultiplier * 38.26,
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
                                                  "assets/images/image_nine.png",
                                                  height: SizeConfig.heightMultiplier * 12.73,
                                                  width: SizeConfig.widthMultiplier * 38.26,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
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
                        delay: delayAmountThree+600,
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 9.55,
                                          width: SizeConfig.widthMultiplier * 15.13,
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
                                                "assets/images/comment_dp.png",
                                                height: SizeConfig.heightMultiplier * 9.55,
                                                width: SizeConfig.widthMultiplier * 15.13,
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                  '2 day ago',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 12.73,
                                          width: SizeConfig.widthMultiplier * 38.26,
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
                                                "assets/images/image_nine.png",
                                                height: SizeConfig.heightMultiplier * 12.73,
                                                width: SizeConfig.widthMultiplier * 38.26,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
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
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 9.55,
                                          width: SizeConfig.widthMultiplier * 15.13,
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
                                                "assets/images/comment_dp.png",
                                                height: SizeConfig.heightMultiplier * 9.55,
                                                width: SizeConfig.widthMultiplier * 15.13,
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                  '2 day ago',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 12.73,
                                          width: SizeConfig.widthMultiplier * 38.26,
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
                                                "assets/images/image_nine.png",
                                                height: SizeConfig.heightMultiplier * 12.73,
                                                width: SizeConfig.widthMultiplier * 38.26,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
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
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 9.55,
                                          width: SizeConfig.widthMultiplier * 15.13,
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
                                                "assets/images/comment_dp.png",
                                                height: SizeConfig.heightMultiplier * 9.55,
                                                width: SizeConfig.widthMultiplier * 15.13,
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                  '2 day ago',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 12.73,
                                          width: SizeConfig.widthMultiplier * 38.26,
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
                                                "assets/images/image_nine.png",
                                                height: SizeConfig.heightMultiplier * 12.73,
                                                width: SizeConfig.widthMultiplier * 38.26,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
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
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 9.55,
                                          width: SizeConfig.widthMultiplier * 15.13,
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
                                                "assets/images/comment_dp.png",
                                                height: SizeConfig.heightMultiplier * 9.55,
                                                width: SizeConfig.widthMultiplier * 15.13,
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  0.0, 10.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  'Discovery TRVLR is a white-knuckle ride into the Live',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 2.00,
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
                                                  '2 day ago',
                                                  style: TextStyle(

                                                    color: Colors.black45,
                                                    fontSize: SizeConfig.heightMultiplier * 1.78,
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Center(
                                        child: Container(
                                          height: SizeConfig.heightMultiplier * 12.73,
                                          width: SizeConfig.widthMultiplier * 38.26,
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
                                                "assets/images/image_nine.png",
                                                height: SizeConfig.heightMultiplier * 12.73,
                                                width: SizeConfig.widthMultiplier * 38.26,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
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
    );
  }

}