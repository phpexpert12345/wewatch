import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/create_an_account.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/your_name.dart';

class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => new _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> with SingleTickerProviderStateMixin{
  void selectProfile(String type) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("typr"+type);
    prefs.setString('type',type);

  }
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  int delayAmount = 400;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool _student=false;
  bool _socialWorker=false;
  bool _jobSeeker=false;
  bool _journalist=true;
  bool _other=false;
  String _email = "";
  String _password = "";
  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
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

  String _dropDownValue;
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  Widget _formLogin(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          ListTile(
            leading: Container(
//              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
//                width: 1.0,
//                color: Color(0xff00adef),
//              ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _student
                    ? Icon(
                  Icons.check_circle_outline,
                  size: 30.0,
                  color: Color(0xff00adef),
                ):Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
                    width: 2.0,
                    color: Color(0xff00adef),
                  ),),
                  child: Icon(
                    Icons.check_circle,
                    size: 20.0,
                    color: Colors.white,
                  ),
                )

              ),
            ),
            title: Text("Student"),
            onTap: ()=> this.setState(() { this._student= !this._student ;
            _jobSeeker=false;
            _journalist=false;
            _socialWorker=false;
            _other=false;
            }),
          ),
          ListTile(
            leading: Container(
//              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
//                width: 1.0,
//                color: Color(0xff00adef),
//              ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _journalist
                    ? Icon(
                  Icons.check_circle_outline,
                  size: 30.0,
                  color: Color(0xff00adef),
                )
                :Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
                    width: 2.0,
                    color: Color(0xff00adef),
                  ),),
                  child: Icon(
                    Icons.check_circle,
                    size: 20.0,
                    color: Colors.white,
                  ),
                )

              ),
            ),
            title: Text("Journalist/Creator"),
            onTap: ()=> this.setState(() { this._journalist= !this._journalist ;
            _jobSeeker=false;
            _other=false;
            _socialWorker=false;
            _student=false;}),
          ),
          ListTile(
            leading: Container(
//              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
//                width: 1.0,
//                color: Color(0xff00adef),
//              ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _socialWorker
                    ? Icon(
                  Icons.check_circle_outline,
                  size: 30.0,
                  color: Color(0xff00adef),
                ):Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
                    width: 2.0,
                    color: Color(0xff00adef),
                  ),),
                  child: Icon(
                    Icons.check_circle,
                    size: 20.0,
                    color: Colors.white,
                  ),
                )

              ),
            ),
            title: Text("Social Worker"),
            onTap: ()=> this.setState(()
            { this._socialWorker= !this._socialWorker ;
            _jobSeeker=false;
            _journalist=false;
            _other=false;
            _student=false;}),
          ),
          ListTile(
            leading: Container(
//              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
//                width: 1.0,
//                color: Color(0xff00adef),
//              ),),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _jobSeeker
                    ? Icon(
                  Icons.check_circle_outline,
                  size: 30.0,
                  color: Color(0xff00adef),
                )
                :Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
                    width: 2.0,
                    color: Color(0xff00adef),
                  ),),
                  child: Icon(
                    Icons.check_circle,
                    size: 20.0,
                    color: Colors.white,
                  ),
                )

              ),
            ),
            title: Text("Job Seeker"),
            onTap: ()=> this.setState(() { this._jobSeeker= !this._jobSeeker ;
            _other=false;
            _journalist=false;
            _socialWorker=false;
            _student=false;}),
          ),
          ListTile(
            leading: Container(
//              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
//                width: 1.0,
//                color: Color(0xff00adef),
//              ),),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _other
                      ? Icon(
                    Icons.check_circle_outline,
                    size: 30.0,
                    color: Color(0xff00adef),
                  )
                      :Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: new Border.all(
                      width: 2.0,
                      color: Color(0xff00adef),
                    ),),
                    child: Icon(
                      Icons.check_circle,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  )

              ),
            ),
            title: Text("Other"),
            onTap: ()=> this.setState(() { this._other= !this._other ;
            _jobSeeker=false;
            _journalist=false;
            _socialWorker=false;
            _student=false;}),
          ),

//          new Container(
//            child: new DropdownButton<String>(
//                items: <String>[
//                  'Student',
//                  'Job Seeker',
//                  'Journalist/Creator',
//                  'Socail Worker'
//                ].map((String value) {
//                  return new DropdownMenuItem<String>(
//
//                    value: value,
//                    child: new Text(
//                      value,
//                      textAlign: TextAlign.center,
//                    ),
//                  );
//                }).toList(),
//                isExpanded: true,
//                hint: _dropDownValue == null
//                    ? Container(
//                        alignment: Alignment.center,
////                        width: 180,
//                        child: Text("Select", textAlign: TextAlign.center))
//                    : Container(
//                        alignment: Alignment.center,
////                        width: 180,
//                        child: Text(
//                          _dropDownValue,
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: Color(0xff00adef)),
//                        ),
//                      ),
//                onChanged: (newVal) {
//                  this.setState(() {
//                    _dropDownValue = newVal;
//                  });
//                }),
//          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Who are you",
          style: TextStyle(

            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      bottomSheet: Container(
        color:Colors.white,
        height: MediaQuery.of(context).size.height/12,
        child:  new Align(
          child: Padding(
              padding:
              EdgeInsets.fromLTRB(7.69 *  SizeConfig.widthMultiplier, 1 *  SizeConfig.heightMultiplier, 7.69 *  SizeConfig.widthMultiplier, 1 *  SizeConfig.heightMultiplier),
              child: Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "Click next means you accept Terms of Services and Privacy Policy ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 1.64 *  SizeConfig.textMultiplier,),
                    ),
                  ),


                ],
              )
          ),
          alignment: FractionalOffset.center,
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
                      SlideTransition(
                      position: _offsetAnimation,
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                          child: Align(
                            child: new Text(
                              'Who are you?',
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
                      ),
                    ),





                        SizedBox(
                          height: SizeConfig.heightMultiplier *5.19,
                        ),


                        ShowUp(
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                            child: Align(
                              child: new Form(
                                key: _key,
                                autovalidate: _validate,
                                child: _formLogin(context),
                              ),
                            ),
                          ),
                          delay: delayAmount+200,
                        ),



                        ShowUp(
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(10.0, 20, 10.0, 0.0),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if(_jobSeeker||_socialWorker||_journalist||_student || _other)
                                    {
                                      if(_jobSeeker)
                                        {
                                          selectProfile("employer");
                                        }
                                      if(_student)
                                        {
                                          selectProfile("student");
                                        }
                                      if(_journalist)
                                        {
                                          selectProfile("reporter");
                                        }
                                      if(_other)
                                      {
                                        selectProfile("other");
                                      }
                                      if(_socialWorker)
                                        {
                                          selectProfile("group_channel");
                                        }

                                      Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => YourName()),
                                    );}
                                    else{
                                      Fluttertoast.showToast(
                                          msg: "Please select one profile",
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
                                )),
                          ),
                          delay: delayAmount+400,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                      shrinkWrap: true,
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
