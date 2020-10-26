import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/home_page_two.dart';
import 'package:we_watch_app/ui/location_access_page.dart';
import 'package:we_watch_app/ui/login.dart';



class SplashScreen1 extends StatefulWidget {
  final VoidCallback logo_shape;
  SplashScreen1({
    Key key,
    this.logo_shape,
  }) : super(key: key);


  @override
  SplashScreenState1 createState() => new SplashScreenState1();
}

class SplashScreenState1 extends  State<SplashScreen1>  {
  SplashScreenState1({
    Key key,
  }) : super();

  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firebaseMessaging.getToken().then((token) {
      print("fbtoken "+token.toString());
      prefs.setString("fb_token", token.toString());
    } );
  }
  void getMessage(){
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["notification"]["title"]);
        }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _register();
    getMessage();
    Timer(
        Duration(seconds: 2),checkFirstSeen);

  }
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

      bool _isLogin = (prefs.getBool('isLogin') ?? false);

      if (_isLogin) {

        if(![null,"",''].contains(prefs.getString('city'))){

          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new HomePageTwo()));


        }else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>
                LocationAccess()),
          );
        }

      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              LocationAccess()),
        );
      }



//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body:Stack(
        children: <Widget>[

          // Adobe XD layer: 'BNMM' (shape)
          Image.asset('assets/images/splash.png',width: double.infinity,height: double.infinity,fit: BoxFit.fill,),

          Align(
            alignment: Alignment.topCenter,
            child:Padding(padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
              child:Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/logo_splash.png',
                  fit: BoxFit.fill,),),
            ),),

        ],
      ),
    );
  }
}

