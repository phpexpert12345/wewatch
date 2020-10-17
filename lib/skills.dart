import 'package:flutter/material.dart';
import 'package:we_watch_app/certification_details.dart';

import 'model/item.dart';



class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 500) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }

  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addDynamic();
    addDynamic();
    addDynamic();
    addDynamic();
    addDynamic();
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton = new Container(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Certifications()),
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
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                  child: GestureDetector(
                    onTap: () {


                    },
                    child: Padding( padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Card(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            new BorderRadius.circular(50),
                          ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                          child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xee08c1f8),
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
          title: Text(
            "Experience Details",
            style: TextStyle(

              fontSize: 16.0,
              color: Colors.white,),
          ),

        ),
        body: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              dynamicTextField,
              submitButton,
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new TextField(
              controller: controller,
              decoration: new InputDecoration(hintText: 'Enter Skill'),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: new TextField(
              controller: controller,
              decoration: new InputDecoration(hintText: 'Experience'),
            ),
          ),
          Icon(Icons.close),
        ],
      ),
    );
  }
}