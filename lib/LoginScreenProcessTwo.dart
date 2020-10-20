import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/ui/forgot_password.dart';
import 'package:we_watch_app/home_page_two.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/forgot_password_select_option.dart';
import 'package:we_watch_app/ui/location_access_page.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/video_screen_two.dart';
import 'package:we_watch_app/who_are_you.dart';
import 'package:http/http.dart' as http;

class LoginScreenProcessTwo extends StatefulWidget {
  @override
  _LoginScreenProcessTwoState createState() => new _LoginScreenProcessTwoState();
}

class _LoginScreenProcessTwoState extends State<LoginScreenProcessTwo> {
  bool visible = false;
  bool passwordVisible=false;
  String _message='';
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firebaseMessaging.getToken().then((token) {
      print(token);
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

  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });


    _register();

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url =
        'https://wewatch.in/wewatch-up/api/v1/login';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "email": _emailFilter.text.toString().trim(),
        "password": _passwordFilter.text.toString().trim(),
        "fcm_token": prefs.getString('fb_token'),

      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "email": _emailFilter.text.toString().trim(),
        "password": _passwordFilter.text.toString().trim(),
        "fcm_token": prefs.getString('fb_token'),
      });
    }




//testing
    try {
      // Starting Web API Call.
      var response = await http.post(url, body: formData);

      // Getting Server response into variable.


      //print("ffff" + formData.toString());

      if (response.statusCode==200) {
        //var message = jsonDecode(response.body);
        var body = await json.decode(response.body);
        prefs.setString('access_token',body['data']['access_token'] );
        prefs.setString('token_type',body['data']['token_type'] );
        prefs.setInt('expires_in',body['data']['expires_in'] );

        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
//        Fluttertoast.showToast(
//            msg: body['data']['access_token'],
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
////            timeInSecForIos: 1
//        );
//        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin',true);
        // Navigate to Profile Screen & Sending Email to Next Screen.
//        Timer.run(() {
//          showDialog(
//            context: context,
//            builder: (_) =>
//                AlertDialog(
//                  shape: OutlineInputBorder(
//                      borderRadius: BorderRadius
//                          .circular(16.0)),
//                  title: Text('Hello!'),
//                  content: Wrap(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Text(
//                            'Welcome to WeWatch',
//                            style: TextStyle(
//                              color: Color(0xff00adef),
//                            ),),
//                          Spacer(),
//                          Icon(Icons.check_circle,
//                            color: Color(0xff00adef),),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//          );
//        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              HomePageTwo()),
        );
      } else if(response.statusCode==422){
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Invalid user name or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      else if(response.statusCode==400){
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Request Fail",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else if(response.statusCode==401){
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });

        Fluttertoast.showToast(
            msg: "Please Check Your Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else if(response.statusCode==500){
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      else
        {
          Fluttertoast.showToast(
              msg: "Login/Password wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }


  GlobalKey<FormState> _key = new GlobalKey();
  bool checkBoxValue2 = false;
  bool _validate = false;
  String _email = "";
  String _password = "";
  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.trim().length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value.trim())){
      return "Invalid Email";
    }else {
      return null;
    }
  }
  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else if(value.length < 6){
      return "Invalid password";
    }else {
      return null;
    }
  }
  int delayAmount = 400;
  final TextEditingController _emailFilter = new TextEditingController(text: '');
  final TextEditingController _passwordFilter = new TextEditingController(text: '');
  Widget _formLogin(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          ShowUp(
            child:new Container(
              child: new TextFormField(
                controller: _emailFilter,
                cursorColor: Color(0xFFb0bbc6),
                decoration: new InputDecoration(
                  labelText: 'Email',
//                focusColor: Color(0xFFb0bbc6),
                  fillColor: Color(0xFFb0bbc6),
                  focusColor: Color(0xFFb0bbc6),
//                suffixIcon: Icon(Icons.email, color: Color(0xFFB6BEC8),),


                  hintStyle: TextStyle(

                    fontSize: 2.8 *  SizeConfig.textMultiplier,
                    color: Color(0xFFb0bbc6),),
                  labelStyle: TextStyle(

                    fontSize: 2.8 *  SizeConfig.textMultiplier,
                    color: Color(0xFFb0bbc6),),
                ),

                style: TextStyle(
                    fontSize: 2.8 *  SizeConfig.textMultiplier,
                    color: Color(0xFFb0bbc6)),
                validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
              ),
            ),
            delay: delayAmount+200,
          ),

          SizedBox(height: 2.8 *  SizeConfig.textMultiplier,),
          ShowUp(
            child:new Container(
              child: new TextFormField(
                controller: _passwordFilter,
                cursorColor: Color(0xFFb0bbc6),
                decoration: new InputDecoration(
                  labelText: 'Password',
                  hoverColor: Color(0xFFb0bbc6),
//                suffixIcon: Icon(Icons.vpn_key,color: Color(0xFFb0bbc6),),
                  suffixIcon: IconButton(
                    icon: Icon(
// Based on passwordVisible state choose the icon
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFFb0bbc6),
                    ),
                    onPressed: () {
// Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });},
                  ),


                  hintStyle: TextStyle(

                      fontSize: 2.8 *  SizeConfig.textMultiplier,
                      color: Color(0xFFb0bbc6)),
                  fillColor: Color(0xFFb0bbc6),
                  focusColor: Color(0xFFb0bbc6),

                  labelStyle: TextStyle(

                    fontSize: 2.8 *  SizeConfig.textMultiplier,
                    color: Color(0xFFb0bbc6),),
                ),
                obscureText: passwordVisible,
                style: TextStyle(

                    fontSize: 2.8 *  SizeConfig.textMultiplier,
                    color: Color(0xFFb0bbc6)),
                validator: validatePassword,
                onSaved: (String val) {
                  _password = val;
                },
              ),
            ),
            delay: delayAmount+400,
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ShowUp(
                child:  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6.32 *  SizeConfig.heightMultiplier, 0, 1.26 *  SizeConfig.heightMultiplier),
                    child: Center(
                      child: Container(

                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(31.28 *  SizeConfig.imageSizeMultiplier,)),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey
                              ),
                            ]
//                                            border: Border.all(width: 2,color: Colors.lightBlue,style: BorderStyle.solid)
                        ),
                        child: Center(child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Image.asset(
                            "assets/images/logo_splash.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),),
                      ),
                    ),

                  ),
                delay: delayAmount,
              ),

              ShowUp(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6.41 *  SizeConfig.widthMultiplier, 1.26 *  SizeConfig.heightMultiplier,6.41 *  SizeConfig.widthMultiplier, 0),
                  child: new Container(
                    child: ListView(

                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[


                        Padding(
                          padding:  EdgeInsets.fromLTRB( 1.26 *  SizeConfig.heightMultiplier, 0,  1.26 *  SizeConfig.heightMultiplier, 0.0),
                          child: Align(child: new Form(
                            key: _key,
                            autovalidate: _validate,
                            child: _formLogin(context),
                          ),),
                        ),
                        SizedBox(height: 1.26 *  SizeConfig.heightMultiplier,),
                        Container(
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue2,
                                  hoverColor: Color(0xff00adef),
                                  checkColor: Colors.white,
                                  focusColor: Colors.white,
                                  activeColor: Color(0xff01bbf4),
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue2 = newValue;
                                    });
                                  }),
                              Expanded(
                                child: Text(
                                  'Remember me',

                                  style: TextStyle(

                                    fontSize: 2.27 *  SizeConfig.textMultiplier,
                                    color: Color(0xFFb0bbc6),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.fromLTRB(2.56 *  SizeConfig.widthMultiplier,  2.5 *  SizeConfig.heightMultiplier, 2.56 *  SizeConfig.widthMultiplier, 0.0),
                          child: Center(
                              child: GestureDetector(

                                onTap: () {
//                                    if(!["", null, false, 0].contains(_emailFilter.text.toString())) {
//                                    if(!["", null, false, 0].contains(_passwordFilter.text.toString())) {
//                                      userLogin();
//                                    }
//                                    else
//                                      {
//                                        Fluttertoast.showToast(
//                                            msg: "Please enter password",
//                                            toastLength: Toast.LENGTH_SHORT,
//                                            gravity: ToastGravity.CENTER,
////                                          timeInSecForIosWeb: 1,
//                                            backgroundColor: Colors.red,
//                                            textColor: Colors.white,
//                                            fontSize: 16.0
//                                        );
//                                      }
//                                    }
//                                    else{
//                                      Fluttertoast.showToast(
//                                          msg: "Please enter an email",
//                                          toastLength: Toast.LENGTH_SHORT,
//                                          gravity: ToastGravity.CENTER,
////                                          timeInSecForIosWeb: 1,
//                                          backgroundColor: Colors.red,
//                                          textColor: Colors.white,
//                                          fontSize: 16.0
//                                      );
//                                    }

                                  FocusScope.of(context).requestFocus(FocusNode());
                                  if (_key.currentState.validate()) {
                                    // No any error in validation
                                    _key.currentState.save();
                                    // print("Name $name");


                                    userLogin();

                                  } else {
                                    // validation error
//                                    setState(() {
//                                      Fluttertoast.showToast(
//                                          msg: "Something went wrong",
//                                          toastLength: Toast.LENGTH_SHORT,
//                                          gravity: ToastGravity.CENTER,
////                                          timeInSecForIosWeb: 1,
//                                          backgroundColor: Colors.red,
//                                          textColor: Colors.white,
//                                          fontSize: 16.0
//                                      );
//                                    });

                                  }

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 1.26 *  SizeConfig.heightMultiplier,),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(0.63 *  SizeConfig.heightMultiplier,)),
//                                  boxShadow: <BoxShadow>[
//                                    BoxShadow(
//                                        color: Colors.grey.shade200,
//                                        offset: Offset(2, 4),
//                                        blurRadius: 5,
//                                        spreadRadius: 2)
//                                  ],
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff01bbf4),
                                            Color(0xff01bbf4)
                                          ])),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(1.26 *  SizeConfig.heightMultiplier,),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) => ForgotPasswordSelectVia()),
                                  );
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(

                                      fontSize: 1.89 *  SizeConfig.textMultiplier,
                                      color: Color(0xff01bbf4),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) => WhoAreYou()),
                                  );
                                },
                                child:Text(
                                    'Create Account',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(

                                        fontSize: 1.89 *  SizeConfig.textMultiplier,
                                        color: Color(0xff01bbf4),
                                        fontWeight: FontWeight.w400),
                                  ),

                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/5.5,),






                      ],
                      shrinkWrap: true,
                    ),



                  ),
                ),
                delay: delayAmount+600,
              ),


            ],
          ),
          visible?Center(
            child: CircularProgressIndicator(

            ),
          ):Container(),
        ],
      ),
//      bottomSheet: Container(
//        color: Colors.white,
//        height: MediaQuery.of(context).size.height/12,
//        child:  new Align(
//          child: Padding(
//              padding:
//              EdgeInsets.fromLTRB(7.69 *  SizeConfig.widthMultiplier, 1 *  SizeConfig.heightMultiplier, 7.69 *  SizeConfig.widthMultiplier, 1 *  SizeConfig.heightMultiplier),
//              child: Row(
//                crossAxisAlignment:CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Expanded(
//                    child: new Text(
//                      "Click next means you accept Terms of Services and Privacy Policy ",
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                        fontWeight: FontWeight.w200,
//                        fontSize: 1.64 *  SizeConfig.textMultiplier,),
//                    ),
//                  ),
//
//
//                ],
//              )
//          ),
//          alignment: FractionalOffset.center,
//        ),
//      ),
    );
  }

}
