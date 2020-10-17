import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsPolicy extends StatefulWidget {
  @override
  _TermsPolicyState createState() => new _TermsPolicyState();
}

class _TermsPolicyState extends State<TermsPolicy> {
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
                                            'Agree Terms and Policies\nEverything you need to know, all in one place.',

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
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(color: Color(0xff00adef), borderRadius: BorderRadius.all(Radius.circular(24)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Text(""),
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
                                                'Statement of Rights and Responsibilities',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 12,
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
                                                0.0, 10.0, 0.0, 10.0),
                                            child: Align(
                                              child: new Text(
                                                'Terms you agree to when you use dareage',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(color: Color(0xff00adef), borderRadius: BorderRadius.all(Radius.circular(24)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Text(""),
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
                                                'Data Policy',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 12,
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
                                                0.0, 10.0, 0.0, 10.0),
                                            child: Align(
                                              child: new Text(
                                                'Information we receive and how it’s used',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(color: Color(0xff00adef), borderRadius: BorderRadius.all(Radius.circular(24)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Text(""),
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
                                                'Community Standards.',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 12,
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
                                                0.0, 10.0, 0.0, 10.0),
                                            child: Align(
                                              child: new Text(
                                                'what isn,t allowed and how to report abuse',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(color: Color(0xff00adef), borderRadius: BorderRadius.all(Radius.circular(24)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                                            ),
                                            child: Center(
                                              child: Text(""),
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
                                                'Cookies and pixels',

                                                style: TextStyle(

                                                  color:
                                                  Color(0xff0093ff),
                                                  fontSize: 12,
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
                                                0.0, 10.0, 0.0, 10.0),
                                            child: Align(
                                              child: new Text(
                                                'what isn,t allowed and how to report abuse',

                                                style: TextStyle(

                                                  color:
                                                  Colors.black,
                                                  fontSize: 11,
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
            "Terms & Policies",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),

      ),
    );
  }

}