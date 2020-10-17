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

import 'gender.dart';



class YourName extends StatefulWidget {
  @override
  _YourNameState createState() => new _YourNameState();
}

class _YourNameState extends State<YourName> {
  void selectName(String first_name,String last_name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('first_name',first_name);
    prefs.setString('last_name',last_name);

  }
  int delayAmount = 400;
  GlobalKey<FormState> _key = new GlobalKey();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _lastname = new TextEditingController();
  final TextEditingController _pob = new TextEditingController();
  final TextEditingController _mobile = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
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
            "Your Name?",
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
                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
//                                      Padding(
//                                        padding:
//                                        const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
//                                        child: Text(
//                                          'Name',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                    ShowUp(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            'What is your name?',
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
                                        height: SizeConfig.heightMultiplier *10.19,
                                      ),
                                      ShowUp(
                                        child: new TextField(
                                          controller: _name,
                                          inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                                          maxLength: 255,
                                          textInputAction: TextInputAction.done,
                                          decoration: new InputDecoration(
                                            hintText: 'First Name',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
//                                            suffixIcon: Icon(
//                                              Icons.person,
//                                              color: Color(0xFF5a6381),
//                                              size: 20,
//                                            )
                                          ),
                                          maxLines: 1,
                                          autofocus: false,
                                        ),
                                        delay: delayAmount+200,

                                      ),


                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ShowUp(
                                  child: new Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
//                                      Padding(
//                                        padding:
//                                        const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
//                                        child: Text(
//                                          'Name',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                        new TextField(
                                          controller: _lastname,
                                          inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                                          maxLength: 255,
                                          textInputAction: TextInputAction.done,
                                          decoration: new InputDecoration(
                                            hintText: 'Last Name',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
//                                            suffixIcon: Icon(
//                                              Icons.person,
//                                              color: Color(0xFF5a6381),
//                                              size: 20,
//                                            )
                                          ),
                                          maxLines: 1,
                                          autofocus: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  delay: delayAmount+400,

                                ),

                                SizedBox(
                                  height: 10,
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
//                SizedBox(
//                  height: SizeConfig.heightMultiplier *30.19,
//                ),
                ShowUp(
                  child: new Align(
                    alignment: FractionalOffset.bottomCenter,
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
                              if(!["", null, false, 0].contains(_name.text.toString()))
                              {
                                if(!["", null, false, 0].contains(_lastname.text.toString()))
                                {
                                  selectName(_name.text.toString(), _lastname.text.toString());
                                  Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => Gender()),
                              );}
                                else{
                                  Fluttertoast.showToast(
                                      msg: "Please enter last name",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                              }
                              else{
                                Fluttertoast.showToast(
                                    msg: "Please enter your name",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
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
                            )
                          )),
                    ),
                  ),
                  delay: delayAmount+600,

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