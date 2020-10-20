import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/create_an_account.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/verify_otp.dart';
import 'package:http/http.dart' as http;

class VerifyPhone extends StatefulWidget {
  @override
  _VerifyPhoneState createState() => new _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  int delayAmount = 400;
  bool visible = false;
  void saveMobile(String mobile) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('mobile',mobile);

  }

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _email = "";
  String _password = "";
  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }
  String validatePassword(String value) {
    if (value.length < 10) {
      return "Invalid mobile";
    } else {
      return null;
    }
  }
  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
//    String email = _emailFilter.text.toString();
//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url =
        'https://wewatch.in/wewatch-up/api/v1/user_login';
    Map data = {
//      'API_KEY':"4762265654DFGDF00546FDG4FD654G6DF",
      'phone':_emailFilter.text.toString(),
    };
    String formD = json.encode(data);

    // Store all data with Param Name.


    Map<String,String> headers = {'Content-type':'application/json','Accept': 'application/json',};


    // Starting Web API Call.
    var response = await http.post(url, body: formD,headers: headers);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());

    try {
      if (response.statusCode == 200) {
//        otp = body["otp"];
        //prefs.setString('user_token',body['user_token'] );
//        prefs.setString('id', body['id']);
//        prefs.setString('std_id', body['std_id']);
//        prefs.setString('name', body['name']);
//        prefs.setString('designation', body['designation']);
//        prefs.setString('phone', body['phone']);
//        prefs.setString('email', body['email']);
//        prefs.setString('doj', body['doj']);
//        prefs.setString('pincode', body['pincode']);
//        prefs.setString('state', body['state']);
//        prefs.setString('address', body['address']);
//        prefs.setString('image', body['image']);
//        prefs.setString('role', body['role']);
        //  prefs.setString('image',body['image'] );
        // prefs.setString('image',body['image'] );
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        if(body['data']['message'].toString()=='Already registered!!') {
          Fluttertoast.showToast(
              msg: body['data']['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
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
//                                          timeInSecForIosWeb: 1,
              backgroundColor: Color(0xff00adef),
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => VerifyOTP()),
          );
        }
        // Navigate to Profile Screen & Sending Email to Next Screen.
//        print("Ankit"+mobile);
//        mobile=_mobileFilter.text.toString();
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => LoginPageMobile(mobile: mobile,otp: otp)));
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
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  Widget _formLogin(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[

          new Container(
            child: Row(
              children: <Widget>[
//                Expanded(
//                  flex:3,
//                  child: new TextFormField(
//
//                    enabled: false,
//                    cursorColor: Color(0xFFb0bbc6),
//                    decoration: new InputDecoration(
//                      labelText: '+91',
////                focusColor: Color(0xFFb0bbc6),
//                      fillColor: Color(0xFFb0bbc6),
//                      focusColor: Color(0xFFb0bbc6),
////                suffixIcon: Container(
////                  padding: EdgeInsets.all(10),
////                  child: Image.asset(
////                    'assets/images/india.png',
////                    width: 20,
////                    height: 20,
////                    fit: BoxFit.contain,
////                  ),
////                ),
//
//
//                      hintStyle: TextStyle(
//
//                        fontSize: 15.0,
//                        color: Color(0xFFb0bbc6),),
//                      labelStyle: TextStyle(
//
//
//                        fontSize: 15.0,
//                        color: Color(0xFFb0bbc6),),
//                    ),
//
//                    style: TextStyle(
//
//                        fontSize: 15.0,
//                        color: Color(0xFFb0bbc6)),
////              validator: validateEmail,
//
//                  ),
//                ),
                SizedBox(width: 10,),
                Expanded(
                  flex:8,
                  child: new TextFormField(
                    controller: _emailFilter,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    cursorColor: Color(0xFFb0bbc6),
                    decoration: new InputDecoration(

                      labelText: 'Mobile',
//                focusColor: Color(0xFFb0bbc6),
                      fillColor: Color(0xFFb0bbc6),
                      focusColor: Color(0xFFb0bbc6),
//                suffixIcon: Icon(Icons.email, color: Color(0xFFB6BEC8),),


                      hintStyle: TextStyle(

                        fontSize: 15.0,
                        color: Color(0xFFb0bbc6),),
                      labelStyle: TextStyle(


                        fontSize: 15.0,
                        color: Color(0xFFb0bbc6),),
                    ),

                    style: TextStyle(

                        fontSize: 15.0,
                        color: Color(0xFFb0bbc6)),
              validator: validatePassword,
                    onSaved: (String val) {
                      _email = val;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(

                fontSize: 13.0,
                color: Color(0xff5a6381),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreenProcessTwo()));
            },
            child: Text(
              'Login here',
              style: TextStyle(

                  fontSize: 13.0,
                  color: Color(0xff00adef),
                  fontWeight: FontWeight.w600),
            ),
          )
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
          "Mobile Number",
          style: TextStyle(

            fontSize: 16.0,
            color: Colors.white,),
        ),
      ),
//      bottomSheet: Container(
//        height: 80,
//        child:new Align(
//          child: GestureDetector(
//            onTap: () {
////                Navigator.push(
////                  context,
////                  MaterialPageRoute(builder: (context) => ForgotPasswordApp()),
////                );
//            },
//            child: Padding(
//                padding:
//                const EdgeInsets.fromLTRB(30, 0, 30, 10),
//                child: Row(
//                  crossAxisAlignment:CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Expanded(
//                      child: new Text(
//                        "Click next means you accept Terms of Services and Privacy Policy ",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                            fontWeight: FontWeight.w200,
//                            fontSize: 13),
//                      ),
//                    ),
//
//
//                  ],
//                )
//            ),
//          ),
//          alignment: Alignment.center,
//        ),
//      ),
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
                                0.0, 20.0, 0.0, 0.0),
                            child: Align(
                              child: new Text(
                                'We`ll send a code to verify your phone number',
                                style: TextStyle(
                                  color: Color(0xFF5a6381),
                                  fontSize: 15,
                                  letterSpacing:0,
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


                        SizedBox(height: 20,),
//                        new DropdownButton<String>(
//                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
//                            return new DropdownMenuItem<String>(
//                              value: value,
//                              child: new Text(value),
//                            );
//                          }).toList(),
//                          onChanged: (_) {},
//                        ),
//                        Container(
//                          width: 300.0,
//                          child: DropdownButtonHideUnderline(
//                            child: ButtonTheme(
//                              alignedDropdown: true,
//                              child: DropdownButton(
//                                value:  <String>['A', 'B', 'C', 'D'].map((String value) {
//                                  return new DropdownMenuItem<String>(
//                                    value: value,
//                                    child: new Text(value),
//                                  );
//                                }).toList(),
////                                onChanged: onChanged,
//                                style: Theme.of(context).textTheme.bodyText1,
//                              ),
//                            ),
//                          ),
//                        ),
                        SizedBox(height:50,),
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                            child: Align(child: new Form(
                              key: _key,
                              autovalidate: _validate,
                              child: _formLogin(context),
                            ),),
                          ),
                          delay: delayAmount+200,
                        ),


                        SizedBox(height:SizeConfig.heightMultiplier * 23.44,),
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if((!["", null, false, 0].contains(_emailFilter.text.toString()))&&(_emailFilter.text.toString().length==10))
                                    {
                                      saveMobile(_emailFilter.text.toString());
                                      userLogin();
//                                      Navigator.push(
//                                        context,
//                                        CupertinoPageRoute(builder: (context) => VerifyOTP()),
//                                      );

                                    }
                                    else{
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid mobile number",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }

//                                  FocusScope.of(context).requestFocus(FocusNode());
//                                  if (_key.currentState.validate()) {
//                                    // No any error in validation
//                                    _key.currentState.save();
//                                    // print("Name $name");
//                                    print("Mobile $_password");
//                                    print("Email $_email");
//
//                                    getToekn();
//
//                                  } else {
//                                    // validation error
//                                    setState(() {
//                                      _validate = true;
//                                      isResponse=false;
//                                    });
//
//                                  }
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
                                                    'Next',
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
                          delay: delayAmount+400,
                        ),


                        SizedBox(height:10,),
                        ShowUp(
                          child: _loginAccountLabel(),
                          delay: delayAmount+600,
                        ),






                      ],
                      shrinkWrap: true,
                    ),



                  ),
                ),

              ],
            ),
            Visibility(
              visible: visible,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}