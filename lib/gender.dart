import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/email_id.dart';
import 'package:we_watch_app/experience_details.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/your_birthday.dart';



class Gender extends StatefulWidget {
  @override
  _GenderState createState() => new _GenderState();
}

class _GenderState extends State<Gender> {
  void selectGender(String gender) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('gender',gender);

  }
  int delayAmount = 400;
  final TextEditingController _name = new TextEditingController();
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

          gender="male";
          selectGender(gender);
          correctScore++;
          break;
        case 1:


          gender="female";
          selectGender(gender);
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
            "Your Gender",
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
                                              'What\'s your gender?',
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
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: SvgPicture.asset(
                                                    "assets/images/male.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            new Text(
                                              'Male',
                                              style: TextStyle(

                                                fontSize: 16.0,
                                                color: Color(0xFF5a6381),),
                                            ),
                                            Spacer(),
                                            new Radio(
                                              value: 0,
                                              hoverColor: Color(0xFF5a6381),
                                              focusColor: Color(0xFF5a6381),
                                              activeColor: Color(0xFF5a6381),

                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                          ],
                                        ),
                                        delay: delayAmount+200,
                                      ),
                                      ShowUp(
                                        child: Container(
                                          color:  Color(0xFF5a6381).withOpacity(0.5),
                                          height: 1,
                                        ),
                                        delay: delayAmount+400,
                                      ),



                                      ShowUp(
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: SvgPicture.asset(
                                                    "assets/images/female.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            new Text(
                                              'Female',
                                              style: TextStyle(

                                                fontSize: 16.0,
                                                color: Color(0xFF5a6381),),
                                            ),
                                            Spacer(),
                                            new Radio(
                                              value: 1,
                                              hoverColor: Color(0xFF5a6381),
                                              focusColor: Color(0xFF5a6381),
                                              activeColor: Color(0xFF5a6381),

                                              groupValue: _radioValue1,
                                              onChanged: _handleRadioValueChange1,
                                            ),
                                          ],
                                        ),
                                        delay: delayAmount+600,
                                      ),





                                    ],
                                  ),
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
                ShowUp(child: Padding(
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
                        if(_radioValue1==0||_radioValue1==1) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Birthday()),
                          );
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Please select your gender",
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
                delay: delayAmount+800,),

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