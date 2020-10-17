import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => new _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
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
                                            'Question you may have',

                                            style: TextStyle(

                                              color:
                                              Color(0xff303139),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight:
                                              FontWeight.bold,
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
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
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
                                Center(
                                  child:
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Center(
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: new Text(
                                                '?',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                            ),
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
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'What names are allowed on company?',

                                              style: TextStyle(

                                                color:
                                                Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight:
                                                FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child:
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Center(
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: new Text(
                                                '?',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                            ),
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
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'How do I choose what I get notifications about?',

                                              style: TextStyle(

                                                color:
                                                Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight:
                                                FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child:
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Center(
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: new Text(
                                                '?',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                            ),
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
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'Where can I find my settings?',

                                              style: TextStyle(

                                                color:
                                                Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight:
                                                FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child:
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Center(
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: new Text(
                                                '?',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                            ),
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
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'How do I change or reset my password?',

                                              style: TextStyle(

                                                color:
                                                Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight:
                                                FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child:
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Center(
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: new Text(
                                                '?',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 24,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                                textAlign:
                                                TextAlign.left,
                                                textDirection:
                                                TextDirection.ltr,
                                              ),
                                            ),
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
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'Why can’t I reply to a message or conversation on Facebook?',

                                              style: TextStyle(

                                                color:
                                                Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight:
                                                FontWeight.bold,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 5),
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),


                        ],
                      ),


                    ),
                  ),
                ),
                Padding(
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
                                            'Popular topics',

                                            style: TextStyle(

                                              color:
                                              Color(0xff303139),
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight:
                                              FontWeight.bold,
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
                Container(
                  height: 1,
                  color: Colors.grey[300],
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
                                  Center(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        child: Center(
                                          child: Container(
                                            height: 50,
                                            width: 050,
                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/images/profile_pic.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
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
                                                'About',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Your profile and settings',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Learn how news feed works, Control what you see in news feed and react to posts.',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        child: Center(
                                          child: Container(
                                            height: 50,
                                            width: 050,
                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/images/profile_pic.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
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
                                                'About',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Post job',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Learn how news feed works, Control what you see in news feed and react to posts.',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        child: Center(
                                          child: Container(
                                            height: 50,
                                            width: 050,
                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/images/profile_pic.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
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
                                                'About',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Post video',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Learn how news feed works, Control what you see in news feed and react to posts.',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        child: Center(
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Image.asset(
                                                  "assets/images/profile_pic.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
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
                                                'About',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Job',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.bold,
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
                                                'Learn how news feed works, Control what you see in news feed and react to posts.',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),

                          ],
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
            "Help Center",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),

      ),
    );
  }
  
}