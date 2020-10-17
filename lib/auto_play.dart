import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoPlay extends StatefulWidget {
  @override
  _AutoPlayState createState() => new _AutoPlayState();
}

class _AutoPlayState extends State<AutoPlay> {
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
                                            'Autoplay next video',

                                            style: TextStyle(

                                              color:
                                              Color(0xff303139),
                                              fontSize: 15,
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
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            'When you finish a video, another plays Automatically',

                                            style: TextStyle(

                                              color:
                                              Color(0xff303139),
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
                              Center(
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(
                                      20),
                                  child: Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    },
                                    activeTrackColor: Colors.lightBlueAccent,
                                    activeColor: Colors.lightBlue,
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
            "Auto Play",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),

      ),
    );
  }

}