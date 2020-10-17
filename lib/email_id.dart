import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/experience_details.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/verify_phone.dart';



class EmailID extends StatefulWidget {
  @override
  _EmailIDState createState() => new _EmailIDState();
}

class _EmailIDState extends State<EmailID> {
  void saveEmail(String email,String password) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email',email);
    prefs.setString('password',password);

  }
  int delayAmount = 400;
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _pob = new TextEditingController();
  final TextEditingController _mobile = new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
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
  String _email = "";
  String _password= "";
  int _radioValue1 = -1;
  int correctScore = 0;
  String gender='',dob='';
  String comments = '', time1 = 'Select Time', date1 = 'Select Date';
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:

          gender="Male";
          correctScore++;
          break;
        case 1:


          gender="Female";
          break;
//        case 2:
//          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
//          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text(
            "Login Information",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
////                    new IconButton(
////                        icon: Icon(
////                          Icons.arrow_back_ios,
////                          color: Color(0xFF5a6381),
////                          size: 20,
////                        ),
////                        onPressed: () {
////                          if (Navigator.canPop(context)) {
////                            Navigator.pop(context);
////                          } else {
////                            SystemNavigator.pop();
////                          }
////                        }),
//                      Flexible(
//                        child: Center(
//                            child: Padding(
//                              padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
//                              child: Text(
//                                ' Profile',
//                                style: TextStyle(
//
//                                  color: Color(0xFF5a6381),
//                                  fontSize: 20,
//                                ),
//                              ),
//                            )),
//                        flex: 1,
//                      ),
//                    ],
//                  ),
//                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: SingleChildScrollView(
                        child: new Container(
//                        color: Color(0xFF5a6381),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
                                ShowUp(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(0.0, SizeConfig.heightMultiplier * 3.83, 0.0, SizeConfig.heightMultiplier * 3.83,),
                                    child: Align(
                                      child: new Text(
                                        'Enter your Email ID',
                                        style: TextStyle(

                                          color: Color(0xFF5a6381),
                                          fontSize: 23,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.ltr,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  delay: delayAmount,
                                ),


                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 2.54,
                                ),
                                ShowUp(
                                  child:  new Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
//                                      Padding(
//                                        padding:
//                                        const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
//                                        child: Text(
//                                          'Email ID',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                      new Form(
                                        key: _key,
                                        autovalidate: _validate,
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              new TextFormField(
                                                controller: _emailFilter,
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.emailAddress,

                                                decoration: new InputDecoration(
//                                                  hintText: 'Email ID',
                                                  labelText: 'Email ID',
                                                  fillColor: Color(0xFF5a6381),
                                                  focusColor: Color(0xFF5a6381),
                                                  hintStyle:  TextStyle(

                                                    fontSize: 16.0,
                                                    color: Color(0xFF5a6381),),
//                                            suffixIcon: Icon(
//                                              Icons.email,
//                                              color: Color(0xFF5a6381),
//                                              size: 20,
//                                            )
                                                ),
                                                style: TextStyle(
                                                      fontSize: 15.0, color: Color(0xFF5a6381)),
                                                validator: validateEmail,
                                                onSaved: (String val) {
                                                  _email = val;
                                                },
                                                maxLines: 1,
                                                autofocus: false,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              new TextFormField(
                                                controller: _passwordFilter,
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.visiblePassword,
                                                decoration: new InputDecoration(
                                                  labelText: 'Password',
//                                                  hintText: 'Password',
                                                  hintStyle:  TextStyle(

                                                    fontSize: 16.0,
                                                    color: Color(0xFF5a6381),),
//                                            suffixIcon: Icon(
//                                              Icons.email,
//                                              color: Color(0xFF5a6381),
//                                              size: 20,
//                                            )
                                                ),
                                                style: TextStyle(
                                                      fontSize: 15.0, color: Color(0xFF5a6381)),
                                                maxLines: 1,
                                                autofocus: false,
                                                validator: validatePassword,
                                                onSaved: (String val) {
                                                  _password = val;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ],
                                    ),
                                  ),
                                  delay: delayAmount+400,
                                ),


                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.4,
                                ),




                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                              color: Colors.transparent),
                        )),
                  ),
                ),
                ShowUp(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
//                          if(!["", null, false, 0].contains(_name.text.toString())){
//                            if(!["", null, false, 0].contains(gender))
//                            {
//                              if(!["", null, false, 0,"Select Date"].contains(dob))
//                              {
//                                if(!["", null, false, 0,"Select Time"].contains(time1))
//                                {
//                                  if(!["", null, false, 0,].contains(_pob.text.toString()))
//                                  {
//                                    if(!["", null, false, 0,"Select Time"].contains(_city.text.toString()))
//                                    {
//                                      if(!["", null, false, 0,"Select Time"].contains(_state.text.toString()))
//                                      {
//                                        FocusScope.of(context)
//                                            .requestFocus(FocusNode());
//                                        pr.show();
//                                        getToekn();
//                                      }
//                                      else{
//                                        Fluttertoast.showToast(
//                                            msg: "Please Enter State",
//                                            toastLength: Toast.LENGTH_SHORT,
//                                            gravity: ToastGravity.CENTER,
//                                            timeInSecForIos: 10
//                                        );
//                                      }
//                                    }else{
//
//                                      Fluttertoast.showToast(
//                                          msg: "Please Enter City",
//                                          toastLength: Toast.LENGTH_SHORT,
//                                          gravity: ToastGravity.CENTER,
//                                          timeInSecForIos: 1
//                                      );
//
//                                    }
//
//                                    //getToekn();
//
//                                  }else{
//                                    Fluttertoast.showToast(
//                                        msg: "Enter Place of birth",
//                                        toastLength: Toast.LENGTH_SHORT,
//                                        gravity: ToastGravity.CENTER,
//                                        timeInSecForIos: 1
//                                    );
//
//
//                                  }
//
//
//
//                                }else{
//
//                                  Fluttertoast.showToast(
//                                      msg: "Enter time of birth",
//                                      toastLength: Toast.LENGTH_SHORT,
//                                      gravity: ToastGravity.CENTER,
//                                      timeInSecForIos: 1
//                                  );
//
//
//                                }
//
//                                //getToekn();
//
//                              }else{
//
//                                Fluttertoast.showToast(
//                                    msg: "Enter Date of birth",
//                                    toastLength: Toast.LENGTH_SHORT,
//                                    gravity: ToastGravity.CENTER,
//                                    timeInSecForIos: 1
//                                );
//
//                              }
//
//
//                            }else{
//
//                              Fluttertoast.showToast(
//                                  msg: "Please Select Gender",
//                                  toastLength: Toast.LENGTH_SHORT,
//                                  gravity: ToastGravity.CENTER,
//                                  timeInSecForIos: 1
//                              );
//
//                            }
//
//                          }else{
//
//
//                            Fluttertoast.showToast(
//                                msg: "Please Enter Name",
//                                toastLength: Toast.LENGTH_SHORT,
//                                gravity: ToastGravity.CENTER,
//                                timeInSecForIos: 1
//                            );
//
//
//                          }

//                    setPersonalData();
//                            if(!["", null, false, 0].contains(_email.text.toString())) {
//                            if(!["", null, false, 0].contains(_password.text.toString())) {
//                              Navigator.push(
//                                context,
//                                CupertinoPageRoute(
//                                    builder: (context) => VerifyPhone()),
//                              );
//                            }
//                            else{
//                              Fluttertoast.showToast(
//                                  msg: "Please enter password",
//                                  toastLength: Toast.LENGTH_SHORT,
//                                  gravity: ToastGravity.CENTER,
////                                          timeInSecForIosWeb: 1,
//                                  backgroundColor: Colors.red,
//                                  textColor: Colors.white,
//                                  fontSize: 16.0
//                              );
//                            }
//
//                            }
//                            else{
//                              Fluttertoast.showToast(
//                                  msg: "Please enter an email",
//                                  toastLength: Toast.LENGTH_SHORT,
//                                  gravity: ToastGravity.CENTER,
////                                          timeInSecForIosWeb: 1,
//                                  backgroundColor: Colors.red,
//                                  textColor: Colors.white,
//                                  fontSize: 16.0
//                              );
//                            }
                            if (_key.currentState.validate())
                            {
                              saveEmail(_emailFilter.text.toString(), _passwordFilter.text.toString());
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => VerifyPhone()),
                              );
                            }
                            else
                            {
                              Fluttertoast.showToast(
                                  msg: "Please Try Again",
                                  toastLength:
                                  Toast.LENGTH_SHORT,
                                  gravity:
                                  ToastGravity.BOTTOM,
//                                  timeInSecForIos: 1
                              );
                            }


                          },
                          child: Padding(
                            padding: EdgeInsets.all(30),
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
                                'Next',
                                style: TextStyle(
                                    fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        )),
                  ),
                  delay: delayAmount+400,
                ),

              ],
            ),
          ),

//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(0.0),
//            image: DecorationImage(
//              image: AssetImage("assets/images/onboard_three.png"),
//              fit: BoxFit.fill,
//            ),
//          ),
        ),
        resizeToAvoidBottomPadding: true);
  }

}