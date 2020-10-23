import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:http/http.dart' as http;

class UpdateMobileNumber extends StatefulWidget {
  @override
  _UpdateMobileNumberState createState() => _UpdateMobileNumberState();
}

class _UpdateMobileNumberState extends State<UpdateMobileNumber> {

  int delayAmount = 400;
  bool visible = false;

  var newNumberController=TextEditingController(text: '');
  var otpController=TextEditingController(text: '');
  Size size;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text(
            "Change Mobile Number",
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: SingleChildScrollView(
                        child: new Container(
//                        color: Color(0xFF5a6381),
                        height: size.height*.8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Stack(
                              children: [
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ShowUp(
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(0.0, SizeConfig.heightMultiplier * 3.83, 0.0, SizeConfig.heightMultiplier * 3.83),
                                          child: Align(
                                            child: new Text(
                                              'Change Your Mobile Number',
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
                                        height: SizeConfig.heightMultiplier * 1.54,
                                      ),

                                      ShowUp(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: size.width*.4,
                                                child: new TextFormField(
                                                  controller: newNumberController,
                                                  textInputAction: TextInputAction.done,
                                                  keyboardType: TextInputType.number,
                                                  enabled: newNumberDisable,
                                                  decoration: new InputDecoration(
                                                    fillColor: Color(0xff444b69),
                                                    hintText: 'Enter New Number',
                                                    hintStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff444b69),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff444b69),
                                                  ),
                                                  maxLines: 1,
                                                  autofocus: false,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(10),
                                                  ],
                                                ),

                                              ),
                                              InkWell(
                                                onTap: (){
                                                  if(newNumberController.text.length==10) {
                                                    setState(() {
                                                      newNumberDisable=false;
                                                    });
                                                    verifyNumber(
                                                        newNumberController
                                                            .text);
                                                  }else{
                                                    Fluttertoast.showToast(
                                                        msg: "Please enter valid 10 digit number",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.red.shade300,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                },
                                                child: Container(
                                                  child: Text("Click To Verify",style: new TextStyle(decoration: TextDecoration.underline,color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        delay: delayAmount+200,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.heightMultiplier * 3,
                                      ),
                                      ShowUp(
                                        child: Container(
                                          width: size.width*.4,
                                          child: new TextFormField(
                                            controller: otpController,
                                            keyboardType: TextInputType.number,
                                            textInputAction: TextInputAction.done,
                                            decoration: new InputDecoration(
                                              fillColor: Color(0xff444b69),
                                              hintText: 'Enter OTP',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff444b69),
                                              ),
                                            ),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff444b69),
                                            ),
                                            maxLines: 1,
                                            autofocus: false,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(6),
                                            ],
                                          ),
                                        ),
                                        delay: delayAmount+400,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.4,
                                ),
                                Positioned(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Visibility(
                                      visible: visible,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.transparent),
                        )),
                  ),
                ),
                ShowUp(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(

                        child: GestureDetector(
                            onTap: otpSent? ()  {
                             //
                              verifyOtpNumber(newNumberController.text);
                            }:null,
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
                                          otpSent?Color(0xff01bbf4):Colors.grey.shade700,
                                          otpSent?Color(0xff01bbf4):Colors.grey.shade700
                                        ])),
                                child: Text(
                                  'Verify Otp',
                                  style: TextStyle(
                                      fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                        )),
                  ),

                  delay: delayAmount+300,),
              ],
            ),
          ),

        ),
        resizeToAvoidBottomPadding: true);
  }

  bool otpSent=false;
  bool newNumberDisable=true;
  Future verifyNumber(String newNumber) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String oldnumber = prefs.getString('mobile_number');
      String access_token = prefs.getString('access_token');
      setState(() {
        visible = true;
      });
      Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
      var response = await http.post(WatchAPI.UPDATE_NUMBER, headers: headers,
          body: <String, dynamic>{
            "old_number": oldnumber,
            "new_number": newNumber
          });
      var body = jsonDecode(response.body);
      print(body);
      setState(() {
        visible = false;
      });
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
          otpSent = true;
          newNumberDisable=false;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          newNumberDisable=true;
        });
        Fluttertoast.showToast(
          msg: "The new number and old number must be different",
          toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.shade400,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        setState(() {
          visible = false;
          newNumberDisable=true;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.shade300,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }catch(ex){
      setState(() {
        visible = false;
        newNumberDisable=true;
      });
    }
  }


  Future verifyOtpNumber(String newNumber) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String oldnumber = prefs.getString('mobile_number');
      String otp = otpController.text;
      String access_token = prefs.getString('access_token');
      setState(() {
        visible = true;
      });
      Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
      var response = await http.post(WatchAPI.UPDATE_NUMBER_VERIFY, headers: headers,
          body: <String, dynamic>{
            "old_number": oldnumber,
            "new_number": newNumber,
            "otp": otp
          });
      var body = jsonDecode(response.body);
      print(body);
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
        prefs.setString('mobile_number',newNumber);
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context,newNumberController.text);
      }if(response.statusCode==404){
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg:body["error"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);
      }else {
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: body['data']['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.shade300,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }catch(ex){
      setState(() {
        visible = false;
      });
    }
  }
}
