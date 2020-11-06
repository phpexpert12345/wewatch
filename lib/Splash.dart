import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
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
    count=1;
    Timer( Duration(seconds: 5),checkFirstSeen);
      changeColor();

  }

  static int count;
  bool blue=false;
  bool yello=false;
  bool skyBlue=false;

  void changeColor() async{
    Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
      if(count > 0 && count <8){
          count++;
          print(count);
          if(count > 1){
            setState(() {
              blue=true;
            });
          }
          if(count > 4){
            setState(() {
              blue=true;
              yello=true;
            });
            //print("yellow");
          }
          if(count > 6 ){
            setState(() {
              blue=true;
              yello=true;
              skyBlue=true;
            });
          }
          changeColor();
      } else {
        // setState(() {
        //   count=1;
        //   blue=false;
        //   yello=false;
        //   skyBlue=false;
        // });
        // changeColor();
      }

    });
  }


  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

      bool _isLogin = (prefs.getBool('isLogin') ?? false);

      if (_isLogin) {

        if(![null,"",''].contains(prefs.getString('city'))){
          // await Future.delayed(Duration(seconds: 2));
          //
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
      backgroundColor: Color.fromRGBO(0, 47, 116, 1),//const Color(0xffffffff),
      body:Stack(
        children: <Widget>[

          // Adobe XD layer: 'BNMM' (shape)
          //Image.asset('assets/images/splash.png',width: double.infinity,height: double.infinity,fit: BoxFit.fill,),

          Align(
            alignment: Alignment.center,
            child:Padding(padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset('assets/images/splash_new.webp',
                      fit: BoxFit.fill,),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //CupertinoActivityIndicator(radius: 20,animating: true,),
                  Container(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      blue? CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue.shade900,
                        ):Container(),
                        SizedBox(width: 10,),
                        yello?CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.yellow,
                        ):Container(),
                        SizedBox(width: 10,),

                        skyBlue? CircleAvatar(
                          radius: 10,
                          backgroundColor: Color.fromRGBO(0, 187, 254, 1),
                        ):Container()
                      ],
                    ),
                  )
                ],
              ),
            ),),

        ],
      ),
    );
  }
}

