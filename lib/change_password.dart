import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/experience_details.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/verify_phone.dart';
import 'package:http/http.dart' as http;

import 'home_page_two.dart';



class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => new _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _newPasswordController = new TextEditingController();
  final TextEditingController _confirmPasswordController = new TextEditingController();
  final TextEditingController _mobile = new TextEditingController();
  final TextEditingController _oldPasswordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool checkBoxValue2 = false;
  bool _validate = false;
  bool visible = false;
  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else {
      return null;
    }
  }
  String _oldPassword,_newPassword,_confirmPassword;
  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.'
    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });


    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url =
        'https://wewatch.in/wewatch-up/api/v1/change-password';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "old_password": _oldPasswordController.text.toString(),
        "new_password": _newPasswordController.text.toString(),
        "confirm_new_password": _confirmPasswordController.text.toString(),

      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "old_password": _oldPasswordController.text.toString(),
        "new_password": _newPasswordController.text.toString(),
        "confirm_new_password": _confirmPasswordController.text.toString(),

      });
    }


    // Starting Web API Call.
    var response = await http.post(url, body: formData,headers: headers);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());


    try {

      if (response.statusCode==200) {
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0
        );

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
            msg: "Failed",
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
            "Change Password",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
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
                                  child: Form(
                                    key: _key,
                                    autovalidate: _validate,
                                    child: Column(
                                      children: <Widget>[


                                        SizedBox(
                                          height: SizeConfig.heightMultiplier * 2.54,
                                        ),
                                        new Container(
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
                                              new TextFormField(
                                                controller: _oldPasswordController,
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.visiblePassword,
                                                decoration: new InputDecoration(
                                                  hintText: 'Old Password',
                                                  hintStyle:  TextStyle(

                                                    fontSize: 16.0,
                                                    color: Color(0xFF5a6381),),
                                                  suffixIcon: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 15),
                                                    child: SvgPicture.asset(
                                                      "assets/images/password.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                                maxLines: 1,
                                                autofocus: false,
                                                validator: validatePassword,
                                                onSaved: (String val) {
                                                  _oldPassword = val;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.heightMultiplier * 2.54,
                                        ),
                                        new Container(
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
                                              new TextFormField(
                                                controller: _newPasswordController,
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.visiblePassword,
                                                decoration: new InputDecoration(
                                                  hintText: 'New Password',
                                                  hintStyle:  TextStyle(

                                                    fontSize: 16.0,
                                                    color: Color(0xFF5a6381),),
                                                  suffixIcon: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 15),
                                                    child: SvgPicture.asset(
                                                      "assets/images/password.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                                maxLines: 1,
                                                autofocus: false,
                                                validator: validatePassword,
                                                onSaved: (String val) {
                                                  _newPassword = val;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.heightMultiplier * 2.54,
                                        ),
                                        new Container(
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
                                              new TextFormField(
                                                controller: _confirmPasswordController,
                                                textInputAction: TextInputAction.done,
                                                keyboardType: TextInputType.visiblePassword,
                                                decoration: new InputDecoration(
                                                  hintText: 'Confirm Password',
                                                  hintStyle:  TextStyle(

                                                    fontSize: 16.0,
                                                    color: Color(0xFF5a6381),),
                                                  suffixIcon: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 15),
                                                    child: SvgPicture.asset(
                                                      "assets/images/password.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                ),
                                                maxLines: 1,
                                                autofocus: false,
                                                validator: validatePassword,
                                                onSaved: (String val) {
                                                  _confirmPassword = val;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),


                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.4,
                                        ),




                                      ],
                                    ),
                                  )
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if(!["", null, false, 0].contains(_newPasswordController.text.toString())){
                                if(!["", null, false, 0].contains(_oldPasswordController.text.toString()))
                                {
                                  if(!["", null, false, 0].contains(_confirmPasswordController.text.toString()))
                                  {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    userLogin();

                                  }else{

                                    Fluttertoast.showToast(
                                        msg: "Confirm Password",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.redAccent,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }

                                }else{

                                  Fluttertoast.showToast(
                                      msg: "Enter New Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );

                                }

                              }else{


                                Fluttertoast.showToast(
                                    msg: "Enter Old Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );


                              }

                            },
                            child: Padding( padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/onboard_three.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
        resizeToAvoidBottomPadding: true);
  }

}