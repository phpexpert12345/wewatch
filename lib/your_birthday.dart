

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:we_watch_app/email_id.dart';

import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';



class Birthday extends StatefulWidget {
  @override
  _BirthdayState createState() => new _BirthdayState();
}
 DateTime _dateTime=DateTime.now();
var newDate = new DateTime(_dateTime.year-18, _dateTime.month, _dateTime.day);
class _BirthdayState extends State<Birthday> {

  int delayAmount = 400;
  void selectDate(String selectedDate) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('dob',selectedDate);

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
            "Your Birthday",
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
                                  child: new Container(
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(0.0, SizeConfig.heightMultiplier * 3.83, 0.0, SizeConfig.heightMultiplier * 3.83),
                                          child: Align(
                                            child: new Text(
                                              'When is your birthday?',
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
//                                      SizedBox(
//                                        height: SizeConfig.heightMultiplier * 2.54,
//                                      ),
//                                      new Container(
//                                        child: Column(
//                                          mainAxisAlignment: MainAxisAlignment.start,
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                          children: <Widget>[
//                                            Padding(
//                                              padding: const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
//                                              child: Text(
//                                                'Date of birth',
//                                                style: TextStyle(
//                                                    color: Color(0xFF5a6381),
//                                                    fontSize: 15,
//                                                    fontWeight: FontWeight.w700),
//                                              ),
//                                            ),
//                                            new TextField(
//                                              decoration: new InputDecoration(
//                                                  hintText: dob,
////                                                  hintStyle: style1,
//                                                  suffixIcon: Icon(
//                                                    Icons.date_range,
//                                                    color: Colors.white,
//                                                    size: 20,
//                                                  )),
//                                              expands: false,
//                                              showCursor: false,
//                                              textInputAction: TextInputAction.done,
//                                              readOnly: true,
//                                              maxLines: 1,
//                                              onTap: () {
//                                                DatePicker.showDatePicker(context,
////                                          minTime: DateTime.now(),
//                                                    showTitleActions: true, onChanged: (date) {
//                                                      dob = date.toString();
//                                                      setState(() {
//                                                        dob = date.year.toString() +
//                                                            '-' +
//                                                            date.month.toString() +
//                                                            '-' +
//                                                            date.day.toString();
//                                                      });
//                                                      print('change $date');
//                                                    }, onConfirm: (date) {
//                                                      print('confirm $date');
//
//                                                      setState(() {
//                                                        dob = date.year.toString() +
//                                                            '-' +
//                                                            date.month.toString() +
//                                                            '-' +
//                                                            date.day.toString();
//                                                      });
//                                                    },
//                                                    currentTime: DateTime.now(),
//                                                    locale: LocaleType.en);
//                                              },
//                                              autofocus: false,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
                                        Container(
                                          height: 500,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: newDate,
                                            maximumDate: newDate,
                                            onDateTimeChanged: (dateTime){
                                              print(dateTime);
                                              setState(() {
                                                _dateTime=dateTime;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  delay: delayAmount,
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
//                                  msg: "Please Select Birthday",
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
//                            var newFormat = DateFormat("yy-MM-dd");
//                            String updatedDt = newFormat.format(dt);
                            String month,day;
                          if(_dateTime.month<10)
                            {month="0"+_dateTime.month.toString();}
                          else{
                            month=_dateTime.month.toString();
                          }
                            if(_dateTime.day<10)
                            {day="0"+_dateTime.day.toString();}
                            else{
                              day=_dateTime.day.toString();
                            }

                          selectDate(day+"-"+month+"-"+_dateTime.year.toString());
                          print(day+"-"+month+"-"+_dateTime.year.toString());
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => EmailID()),
                            );

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
                  delay: delayAmount+200,
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