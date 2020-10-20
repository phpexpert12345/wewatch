import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_watch_app/forgot_password_using_email.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/forgot_password.dart';
import 'package:we_watch_app/ui/show_up.dart';

class ForgotPasswordSelectVia extends StatefulWidget {
  @override
  _ForgotPasswordSelectViaState createState() => _ForgotPasswordSelectViaState();
}

class _ForgotPasswordSelectViaState extends State<ForgotPasswordSelectVia> {

  int delayAmount = 400;

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
          "Select Option",
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
                                'Select option for set you password',
                                style: TextStyle(
                                  color: Color(0xFF5a6381),
                                  fontSize: 20,
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

                        SizedBox(height:80,),
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => ForgotPassword()),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 1.26 *  SizeConfig.heightMultiplier,),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(0.63 *  SizeConfig.heightMultiplier,)),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff01bbf4),
                                              Color(0xff01bbf4)
                                            ])),
                                    child: Text(
                                      'Via Phone',
                                      style: TextStyle(
                                          fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )),
                          ),
                          delay: delayAmount+400,
                        ),


                        SizedBox(height:80,),
                        ShowUp(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => ForgotPasswordUsinEmail()),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 1.26 *  SizeConfig.heightMultiplier,),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(0.63 *  SizeConfig.heightMultiplier,)),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff01bbf4),
                                              Color(0xff01bbf4)
                                            ])),
                                    child: Text(
                                      'Via email',
                                      style: TextStyle(
                                          fontSize:3.16 *  SizeConfig.textMultiplier, color: Colors.white,fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )),
                          ),
                          delay: delayAmount+400,
                        ),




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
}
