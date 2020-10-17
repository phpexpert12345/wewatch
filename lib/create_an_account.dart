import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:we_watch_app/experience_details.dart';



class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => new _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
            "Create an account",
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
                                        controller: _name,
                                        textInputAction: TextInputAction.done,
                                        decoration: new InputDecoration(
                                            hintText: 'Enter your Name',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                            suffixIcon: Icon(
                                              Icons.person,
                                              color: Color(0xFF5a6381),
                                              size: 20,
                                            )),
                                        maxLines: 1,
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                                      new TextField(
                                        controller: _email,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                            hintText: 'Email ID',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                            suffixIcon: Icon(
                                              Icons.email,
                                              color: Color(0xFF5a6381),
                                              size: 20,
                                            )),
                                        maxLines: 1,
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
//                                          'Mobile',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                      new TextField(
                                        controller: _mobile,
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.number,
                                        decoration: new InputDecoration(
                                            hintText: 'Mobile',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                            suffixIcon: Icon(
                                              Icons.phone_android,
                                              color: Color(0xFF5a6381),
                                              size: 20,
                                            )),
                                        maxLines: 1,
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
//                                          'Current location',
//                                          style:  TextStyle(
//
//                                            fontSize: 16.0,
//                                            color: Color(0xFF5a6381),),
//                                        ),
//                                      ),
                                      new TextField(
                                        controller: _pob,
                                        textInputAction: TextInputAction.done,

                                        decoration: new InputDecoration(
                                            fillColor: Color(0xFF5a6381),
                                            hintText: 'Current location',
                                            hintStyle:  TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                            suffixIcon: Icon(
                                              Icons.place,
                                              color: Color(0xFF5a6381),
                                              size: 20,
                                            )),
                                        style: TextStyle(

                                          fontSize: 16.0,
                                          color: Color(0xFF5a6381),),
                                        maxLines: 1,
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
                                        child: Text(
                                          'Date of birth',
                                          style: TextStyle(

                                            fontSize: 16.0,
                                            color: Color(0xFF5a6381),),
                                        ),
                                      ),
                                      new TextField(
                                        decoration: new InputDecoration(
                                            hintText: dob,
                                            hintStyle: TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                            suffixIcon: Icon(
                                              Icons.date_range,
                                              color: Color(0xFF5a6381),
                                              size: 20,
                                            )),
                                        expands: false,
                                        showCursor: false,
                                        textInputAction: TextInputAction.done,
                                        readOnly: true,
                                        maxLines: 1,
                                        onTap: () {
                                          DatePicker.showDatePicker(context,
//                                          minTime: DateTime.now(),
                                              showTitleActions: true, onChanged: (date) {
                                                dob = date.toString();
                                                setState(() {
                                                  dob = date.year.toString() +
                                                      '-' +
                                                      date.month.toString() +
                                                      '-' +
                                                      date.day.toString();
                                                });
                                                print('change $date');
                                              }, onConfirm: (date) {
                                                print('confirm $date');

                                                setState(() {
                                                  dob = date.year.toString() +
                                                      '-' +
                                                      date.month.toString() +
                                                      '-' +
                                                      date.day.toString();
                                                });
                                              },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
                                        child: Text(
                                          'Gender',
                                          style:  TextStyle(

                                            fontSize: 16.0,
                                            color: Color(0xFF5a6381),),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          new Radio(
                                            value: 0,
                                            hoverColor: Color(0xFF5a6381),
                                            focusColor: Color(0xFF5a6381),
                                            activeColor: Color(0xFF5a6381),

                                            groupValue: _radioValue1,
                                            onChanged: _handleRadioValueChange1,
                                          ),
                                          new Text(
                                            'Male',
                                            style: TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          new Radio(
                                            value: 1,
                                            hoverColor: Color(0xFF5a6381),
                                            focusColor: Color(0xFF5a6381),
                                            activeColor: Color(0xFF5a6381),

                                            groupValue: _radioValue1,
                                            onChanged: _handleRadioValueChange1,
                                          ),
                                          new Text(
                                            'Female',
                                            style: TextStyle(

                                              fontSize: 16.0,
                                              color: Color(0xFF5a6381),),
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),
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
                Padding(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExperienceDetails()),
                          );

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
                                          'Save',
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