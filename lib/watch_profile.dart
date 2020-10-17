import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchProfile extends StatefulWidget {
  @override
  _WatchProfileState createState() => new _WatchProfileState();
}

class _WatchProfileState extends State<WatchProfile> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color:Colors.white,
              width: double.infinity,
//              height: double.infinity,
              child:  Image.asset("assets/images/quarter_bg.png",fit: BoxFit.fill,),

            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.transparent,
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[


                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          color:Colors.transparent,
                                          child: Container(


                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(10, 35, 0, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[

                                                      Padding(
                                                        padding: EdgeInsets
                                                            .fromLTRB(
                                                            0,
                                                            0,
                                                            0,
                                                            0),
                                                        child:
                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.all(
                                                                0),
                                                            child: Image.asset(
                                                              "assets/images/profile_pic.png",
                                                              height: 50.0,
                                                              width: 50.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),






                                                    ],
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
                                                            10.0, 10.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Name',

                                                            style: TextStyle(

                                                              color:
                                                              Color(0xff444b69),
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
                                                            10.0, 0.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Linkin Park',

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
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  0.0, 0.0, 5.0, 0.0),
                                                              child: Align(
                                                                child: new Text(
                                                                  'Add a Description',

                                                                  style: TextStyle(

                                                                    color:
                                                                    Color(0xff444b69),
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
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              child:
                                                              Center(
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsets.all(
                                                                      0),
                                                                  child: Image.asset(
                                                                    "assets/images/edit_blue.png",
                                                                    height: 15.0,
                                                                    width: 15.0,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),






                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                                        child: Container(
                                                          height: 1,
                                                          color: Color(0xffcacdd6),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            10.0, 20.0, 0.0, 0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Privacy',

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


                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                                                                          0.0, 0.0, 0.0, 0.0),
                                                                      child: Align(
                                                                        child: new Text(
                                                                          'Videos Private',

                                                                          style: TextStyle(

                                                                            color:
                                                                            Color(0xff303139),
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
                                                            Center(
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    0),
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
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                                                          0.0, 0.0, 0.0, 0.0),
                                                                      child: Align(
                                                                        child: new Text(
                                                                          'Subscribers Private',

                                                                          style: TextStyle(

                                                                            color:
                                                                            Color(0xff303139),
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
                                                            Center(
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    0),
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
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                                                          0.0, 0.0, 0.0, 0.0),
                                                                      child: Align(
                                                                        child: new Text(
                                                                          'Playlists Private',

                                                                          style: TextStyle(

                                                                            color:
                                                                            Color(0xff303139),
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
                                                            Center(
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    0),
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
            "WatchProfile",
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
  List<int> generateNumbers() => List<int>.generate(30, (i) => i + 1);

}