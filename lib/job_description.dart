import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobDescription extends StatefulWidget {
  @override
  _JobDescriptionState createState() => new _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
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
                        Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  color:Color(0xff00adef),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[


                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[


                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[

                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20.0, 30.0, 20.0, 10.0),
                                                      child: Align(
                                                        child: new Text(
                                                          'User Designer',

                                                          style: TextStyle(

                                                            color:
                                                            Colors.white,
                                                            fontSize: 30,
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
                                                        Alignment.centerLeft,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                      child: Align(
                                                        child: new Text(
                                                          'Starbucks',

                                                          style: TextStyle(

                                                            color:
                                                            Colors.white,
                                                            fontSize: 21,
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
                                                      padding: EdgeInsets.fromLTRB(
                                                          15, 20, 20, 20),
                                                      child: Card(
                                                        child: Container(
                                                          decoration: new BoxDecoration(
                                                            color: Color(0xff90dbf8),
                                                            borderRadius:
                                                            new BorderRadius.circular(40),
//                                                      border: Border.all(
//                                                          color: Color(0xff00adef)Accent)
                                                          ),
                                                          height: 40.0, // height of the button
                                                          width: MediaQuery.of(context).size.width/3, // width of the button
                                                          child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Text(
                                                                    'About Company',
                                                                    style: TextStyle(

                                                                        color: Color(0xff444b69),
                                                                        fontWeight: FontWeight.w600),
                                                                  ),

                                                                ],
                                                              )),
                                                        ),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(40.0),
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
                                      Container(
                                        color:Colors.white,
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[


                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(0),
                                                        child: SvgPicture.asset(
                                                          "assets/images/location.svg",
                                                          color: Color(0xff00adef),
//                                              semanticsLabel: 'A red up arrow'
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(10),
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
                                                                'Sector 18, Noida',

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







                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(0),
                                                        child: SvgPicture.asset(
                                                          "assets/images/calendar.svg",
                                                          color: Color(0xff00adef),
//                                              semanticsLabel: 'A red up arrow'
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(10),
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
                                                                'Posted 1 weeks ago',

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







                                                ],
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(20, 20, 20, 10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 0),
                                                        child: Text(
                                                          'Skill Required',
                                                          textAlign:TextAlign.left,
                                                          style: TextStyle(
                                                              color:
                                                              Color(0xff444b69),
                                                              fontSize: 18,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),

                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[


                                                  Expanded(
                                                    child:Card(
                                                      child: Container(
                                                        padding:EdgeInsets.all(5),
                                                        decoration: new BoxDecoration(
                                                            color: Color(0xff90dbf8),
                                                            borderRadius:
                                                            new BorderRadius.circular(10),
                                                            border: Border.all(
                                                                color: Color(0xff90dbf8))),
                                                        height: 30.0, // height of the button
//                                              width: 80.0, // width of the button
                                                        child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Expanded(
                                                                    child:Text(
                                                                      'UX Design',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(

                                                                          color: Color(0xff444b69),
                                                                          fontWeight: FontWeight.w600),
                                                                    ),
                                                                ),


                                                              ],
                                                            )),
                                                      ),
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child:Card(
                                                      child: Container(
                                                        padding:EdgeInsets.all(5),
                                                        decoration: new BoxDecoration(
                                                            color: Color(0xff90dbf8),
                                                            borderRadius:
                                                            new BorderRadius.circular(10),
                                                            border: Border.all(
                                                                color: Color(0xff90dbf8))),
                                                        height: 30.0, // height of the button
//                                              width: 80.0, // width of the button
                                                        child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Expanded(
                                                                    child:Text(
                                                                      'Designing',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(

                                                                          color: Color(0xff444b69),
                                                                          fontWeight: FontWeight.w600),
                                                                    ),
                                                                ),


                                                              ],
                                                            )),
                                                      ),
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child:Card(
                                                      child: Container(
                                                        padding:EdgeInsets.all(5),
                                                        decoration: new BoxDecoration(
                                                            color: Color(0xff90dbf8),
                                                            borderRadius:
                                                            new BorderRadius.circular(10),
                                                            border: Border.all(
                                                                color: Color(0xff90dbf8))),
                                                        height: 30.0, // height of the button
//                                              width: 80.0, // width of the button
                                                        child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Expanded(
                                                                    child:Text(
                                                                      'Designing',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(

                                                                          color: Color(0xff444b69),
                                                                          fontWeight: FontWeight.w600),
                                                                    ),
                                                                ),


                                                              ],
                                                            )),
                                                      ),
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(width: 20,),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ],
                                  ),

                                ),
                                Positioned(
                                  top: 125,
                                  right: 16,
                                  child: new Container(
                                    height: 120.0,
                                    width: 120.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                        ),],
                                      image: new DecorationImage(
                                        image: new ExactAssetImage("assets/images/startbucks.png"),
                                        fit: BoxFit.fill,
                                      ),

//                                        border:
//                                        Border.all(color: Colors.white, width: 2.0),

                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                        Container(
                          color:Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Experience',


                                                      style: TextStyle(

                                                        color:
                                                        Color(0xff00adef),
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
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      '3 Years',
                                                      style: TextStyle(

                                                        color:
                                                        Color(0xFF444b69),
                                                        fontSize: 13,
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
                                                      'Employment',


                                                      style: TextStyle(

                                                        color:
                                                        Color(0xff00adef),
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
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Full Time',
                                                      style: TextStyle(

                                                        color:
                                                        Color(0xFF444b69),
                                                        fontSize: 13,
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
                                                      'Salary',


                                                      style: TextStyle(

                                                        color:
                                                        Color(0xff00adef),
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
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'INR 18Lac /Annum',
                                                      style: TextStyle(

                                                        color:
                                                        Color(0xFF444b69),
                                                        fontSize: 13,
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
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),

                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child:Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        textAlign:TextAlign.left,
                                        style: TextStyle(
                                            color:
                                            Color(0xff444b69),
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Row(
                              children: <Widget>[
                                Align(
                                  alignment:
                                  Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(
                                        0, 0, 0, 0),
                                    child: Text(
                                      'Job Description',
                                      textAlign:TextAlign.left,
                                      style: TextStyle(
                                          color:
                                          Color(0xff00adef),
                                          fontSize: 18,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(20, 5, 20, 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child:Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Text(
                                        '-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        textAlign:TextAlign.left,
                                        style: TextStyle(
                                            color:
                                            Color(0xff444b69),
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(20, 5, 20, 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child:Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Text(
                                        '-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        textAlign:TextAlign.left,
                                        style: TextStyle(
                                            color:
                                            Color(0xff444b69),
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                            EdgeInsets.fromLTRB(20, 5, 20, 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child:Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Text(
                                        '-Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        textAlign:TextAlign.left,
                                        style: TextStyle(
                                            color:
                                            Color(0xff444b69),
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0.0),
                          child: Center(
                              child: GestureDetector(
                                onTap: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(builder: (context) => HomePageTwo()),
//                                  );

                                },
                                child: Padding( padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Card(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        color: Color(0xee08c1f8),
                                        borderRadius:
                                        new BorderRadius.circular(10),
                                      ),
                                      height: 50.0, // height of the button
//                                      width: 120.0, // width of the button
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Apply This Job',
                                                  style: TextStyle(
                                                      fontSize: 25,
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
                        SizedBox(height: 30,),











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
            "Job Description",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: SvgPicture.asset(
                    "assets/images/share.svg",
                                              color: Colors.white,
//                                              semanticsLabel: 'A red up arrow'
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: SvgPicture.asset(
                    "assets/images/bookmark_filled.svg",
                                              color: Colors.white,
//                                              semanticsLabel: 'A red up arrow'
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ),
          ],

        ),

      ),
    );
  }

}