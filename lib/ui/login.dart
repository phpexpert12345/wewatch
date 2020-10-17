import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/home_page_two.dart';
import 'package:we_watch_app/who_are_you.dart';

class Login extends StatefulWidget {
  final VoidCallback logo_shape;

  Login({
    Key key,
    this.logo_shape,
  }) : super(key: key);

  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  LoginState({
    Key key,
  }) : super();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    Timer(
//        Duration(seconds: 2),
//            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//            builder: (BuildContext context) => SplashScreen2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'BNMM' (shape)

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Card(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/logo_splash.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                )),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => LoginScreenProcessTwo()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff08C1F8),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              width: 2,
                              color: Color(0xff08C1F8),
                              style: BorderStyle.solid)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(

                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => WhoAreYou()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              width: 2,
                              color: Color(0xff08C1F8),
                              style: BorderStyle.solid)),
                      child: Center(
                        child: Text(
                          'New to WeWatch? SignUp',
                          style: TextStyle(

                            fontSize: 20,
                            color: const Color(0xff08C1F8),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Timer.run(() {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          title: Text('Hello !'),
                          content: Wrap(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Logged in as Guest',
                                    style: TextStyle(
                                      color: Color(0xff00adef),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xff00adef),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => HomePageTwo()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              width: 2,
                              color: Color(0xff08C1F8),
                              style: BorderStyle.solid)),
                      child: Center(
                        child: Text(
                          'Continue as Guest',
                          style: TextStyle(

                            fontSize: 20,
                            color: const Color(0xff08C1F8),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ),

//            Padding(padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
//              child:
//              Container(
//                height: 50,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/new.png"),
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                child:   null,
//              ),),
//
//            Padding(padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
//              child:
//              Container(
//                height: 50,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/border_blue.png"),
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                child:   Center(child: Text(
//                  'Continue as guest',
//                  style: TextStyle(
//
//                    fontSize: 15,
//
//                    color: const Color(0xff08C1F8),
//                    fontWeight: FontWeight.w500,
//                  ),
//                  textAlign: TextAlign.right,
//                ),),
//              ),),
              ],
            ),
          ),
          Align(
            child: Padding(
              child: SizedBox(
                child: Text(
                  'Click next means you accept Terms of Service and Privacy Policy',
                  style: TextStyle(

                    fontSize: 12,
                    color: const Color(0xffB0BBC6),
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }
}
