import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/forgot_password_otp.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordUsinEmail extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => new _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordUsinEmail> {
  int delayAmount = 400;

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _email = "";
  String _password = "";
  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
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
    } else {
      return null;
    }
  }
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  Widget _formLogin(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[

          new Container(
            child: new TextFormField(
              controller: _emailController,
              cursorColor: Color(0xFFb0bbc6),
              decoration: new InputDecoration(
                labelText: 'Email',
//                focusColor: Color(0xFFb0bbc6),
                fillColor: Color(0xFFb0bbc6),
                focusColor: Color(0xFFb0bbc6),
//                suffixIcon: Icon(Icons.email, color: Color(0xFFB6BEC8),),


                hintStyle: TextStyle(

                  fontSize: 22.0,
                  color: Color(0xFFb0bbc6),),
                labelStyle: TextStyle(

                  fontSize: 22.0,
                  color: Color(0xFFb0bbc6),),
              ),

              style: TextStyle(

                  fontSize: 22.0,
                  color: Color(0xFFb0bbc6)),
              validator: validateEmail,
              onSaved: (String val) {
                _email = val;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text(
          "Forgot Password",
          style: TextStyle(

            fontSize: 16.0,
            color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,

            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: new Container(
                    child: ListView(

                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 0.0),
                            child: Align(
                              child: new Text(
                                'Enter your account Email to reset your password',
                                style: TextStyle(
                                  color: Color(0xFF5a6381),
                                  fontSize: 23,
                                  letterSpacing:0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          delay: delayAmount,
                        ),


                        SizedBox(height: 20,),
                        ShowUp(
                          child:  Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                            child: Align(child: new Form(
                              key: _key,
                              autovalidate: _validate,
                              child: _formLogin(context),
                            ),),
                          ),
                          delay: delayAmount+200,
                        ),


                        SizedBox(height:80,),
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (_key.currentState.validate()) {
                                      _key.currentState.save();
                                      userLogin();

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
                                      'Send',
                                      style: TextStyle(
                                          fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )),
                          ),
                          delay: delayAmount+400,
                        ),


                        SizedBox(height:80,),
                      ],
                      shrinkWrap: true,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  bool visible=false;

  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    var url =
        WatchAPI.FORGOT_PASSWORD;
    Map data = {
      'email':_emailController.text.toString(),
    };
    String formD = json.encode(data);

    // Store all data with Param Name.


    Map<String,String> headers = {'Content-type':'application/json','Accept': 'application/json',};


    // Starting Web API Call.
    var response = await http.post(url, body: formD,headers: headers);

    // Getting Server response into variable.




    try {
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);
        var message = jsonDecode(response.body);
        print("ffff" + message.toString());

        setState(() {
          visible = false;
        });
        if(body['data']['message'].toString()=='Already registered!!') {
          Fluttertoast.showToast(
              msg: body['data']['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Color(0xff00adef),
              textColor: Colors.white,
              fontSize: 16.0
          );

        }
        else{
          Fluttertoast.showToast(
              msg: body['data']['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Color(0xff00adef),
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => PasswordOTP(mobileNumber: _emailController.text.toString(),via: "email",)),
          );
        }

      } else if(response.statusCode==422){
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Validation Failed",
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
            msg: "Authorization Failure",
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
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
      );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }
}