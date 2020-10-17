import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_watch_app/auto_play.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
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

}