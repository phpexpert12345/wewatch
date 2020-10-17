import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:we_watch_app/edit_channel.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/ui/add_channel.dart';
import 'package:we_watch_app/ui/select_city.dart';

import '../home_page_two.dart';




class StateName {
  int id;
  String name;
  int country_id;

  StateName({this.id, this.name, this.country_id});

  factory StateName.fromJson(Map<String, dynamic> parsedJson) {
    return StateName(
      id: parsedJson["id"],
      name: parsedJson["name"] as String,
      country_id: parsedJson["country_id"],
    );
  }
}


class City {
  int id;
  String name;
  int state_id;

  City({this.id, this.name, this.state_id});

  factory City.fromJson(Map<String, dynamic> parsedJson) {
    return City(
      id: parsedJson["id"],
      name: parsedJson["name"] as String,
      state_id: parsedJson["state_id"],
    );
  }
}


class FilterTask extends StatefulWidget {

  final String text;

  FilterTask({ @required this.text}) : super();

  @override
  _FilterTaskState createState() => new _FilterTaskState(text: text);
}

class _FilterTaskState extends State<FilterTask> {
  final String text;

  _FilterTaskState({ @required this.text}) : super();


  AutoCompleteTextField searchTextFieldState,searchTextFieldCity;
  TextEditingController _textController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<StateName>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<City>> keyCity = new GlobalKey();
  static List<StateName> stateName = new List<StateName>();
  static List<City> cityName = new List<City>();
  bool loading = true;
  bool loadingCity = true;
  SharedPreferences prefs;
  bool isHomeDataLoading;
  String state_name="",state_id="";

  void getUsers() async {
    try {
      prefs = await SharedPreferences.getInstance();
      var response = await http.get('https://wewatch.in/wewatch-up/api/v1/get_state_list?country_id=101', headers: {
        'Content-Type': 'application/json',
      });
      var resBody = json.decode(response.body);
      Map<String, dynamic> decodedMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var body = await json.decode(response.body);

        List<dynamic> dynamicList = decodedMap['data']['results'];
        dynamicList.forEach((f) {
          StateName s = StateName.fromJson(f);
          stateName.add(s);
        });


        setState(() {
          loading = false;
         // stateName = resBody1;
        });
        print('Users: ${stateName.length}');

      } else {
        print("Error getting users.");
      }
    } catch (e) {
      print("Error getting users.");
    }
  }

  Future<List<StateName>> getVehical(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get('https://wewatch.in/wewatch-up/api/v1/get_state_list?country_id=101', headers: {
      'Content-Type': 'application/json',
    });
    print(response.body);

    var body = await json.decode(response.body);
    //Simulate a service call
    print('submitting to backend...');
    Map<String, dynamic> decodedMap = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> dynamicList = decodedMap['data']['results'];

        return newDataList;
      } else {
        throw Exception("MESSAGES.INTERNET_ERROR");
      }
    } catch (e) {
      throw Exception(e);
    }
//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }
  
  
  void getCity(String stateid) async {
    try {
      final response =
      await http.get("https://wewatch.in/wewatch-up/api/v1/get_city_list?state_id="+stateid);
      Map<String, dynamic> decodedMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);

        List<dynamic> dynamicList = decodedMap['data']['results'];
        dynamicList.forEach((f) {
          City s = City.fromJson(f);
          cityName.add(s);
        });


        setState(() {
          loading = false;
          // stateName = resBody1;
        });
        print('Users: ${cityName.length}');
      } else {
        print("Error getting users.");
      }
    } catch (e) {
      print("Error getting users.");
    }
  }

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }


  List<StateName> newDataList = List.from(stateName);

  onItemChanged(String value) {
    setState(() {
      newDataList = stateName
          .where((StateName) => StateName.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }


  @override
  void initState() {

    getUsers();
    super.initState();
  }

  Widget row(StateName user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(height: 30,
        child: Text(
          user.name,
          style: TextStyle(fontSize: 16.0),
        ),)

      ],
    );
  }


  Widget rowCity(City user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(height: 30,
          child: Text(
            user.name,
            style: TextStyle(fontSize: 16.0),
          ),)

      ],
    );
  }


  TextStyle style1 = TextStyle(

      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      color: Colors.grey);
  TextStyle style11 = TextStyle(

      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  TextStyle style2 = TextStyle(

    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    color: Color(0xff0D314D),
    decoration: TextDecoration.underline,
  );
  TextStyle style3 = TextStyle(

      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      color: Color(0xff0D314D),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);

  int _selectedIndex = -1;
  bool isBotttomVisible = false;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(child:  Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                Padding(
                padding: const EdgeInsets.fromLTRB(10, 0,0, 0),
                  child:  new IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {

                        }
                        ),),
          Flexible(
            child: Center(
              child:Padding(
                padding: const EdgeInsets.fromLTRB(0, 0,40, 0),
                child:
                  Text("Select State",style: TextStyle(color: Colors.white,
                            fontSize: 18,fontWeight: FontWeight.w700),),))),




//                    new IconButton(
//                        icon: Icon(
//                          Icons.notifications_active,
//                          color: Colors.black,
//                          size: 20,
//                        ),
//                        onPressed: () {
////                            Provider.of<MenuController>(context, listen: true)
////                                .toggle();
//                        }),
                  ],
                ),
                color: Color(0xff00adef),
                height: 100,),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Center(
                        child:Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child:  Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(height: 40,child: TextField(
                              onChanged: onItemChanged,
                              controller: _textController,
                              minLines: 1,
                              maxLines: 1,

                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)),
                                hintText: 'Search...',
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black87,
                                ),
                              ),
                            ),),

                          ),)
                    ),
                    flex: 1,
                  ),
                ],
              ),
              Flexible(
                child: FutureBuilder<List<StateName>>(
                  future: getVehical('type'),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.done
                        ? snapshot.hasData
                        ? Container(
                      child: snapshot.hasData
                          ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int index) {
                          return Stack(
                            children: <Widget>[
                              GestureDetector(
                                child: Padding(
                                    padding:
                                    const EdgeInsets.all(
                                        0.0),
                                    child:Container(
                                      height: 50,

                                      decoration:
                                      BoxDecoration(

                                        border: Border(
                                            bottom: BorderSide(
                                                color:Colors.grey[200],
                                                width: 1
                                            )
                                        ),
                                        color:  _selectedIndex !=
                                            null &&
                                            _selectedIndex ==
                                                index
                                            ?Colors.grey:Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(
                                                8.0),
                                            child:
                                            Image.asset(
                                              _selectedIndex !=
                                                  null &&
                                                  _selectedIndex ==
                                                      index
                                                  ? 'assets/images/location.jpg'
                                                  : 'assets/images/location.jpg',
                                              height: 50,
                                              width: 30,
                                            ),
                                          ),
                                          Expanded(child:  Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(
                                                3.0),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: <
                                                  Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5,
                                                      5.0,
                                                      15,
                                                      5),
                                                  child:
                                                  Text(
                                                    ![
                                                      "",
                                                      null,
                                                      false,
                                                      0
                                                    ].contains(snapshot.data[index].name)
                                                        ? snapshot.data[index].name
                                                        : " ",
                                                    style: TextStyle(

                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        color: Color(0xFF243F5B)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),flex: 1,),

                                          IconButton(
                                              icon: Icon(
                                                Icons.chevron_right,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              onPressed: () {

                                              }),
                                        ],
                                      ),
                                    ),),
                                onTap: () {
                                  state_name=snapshot.data[index].name;
                                  state_id=snapshot.data[index].id.toString();
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => SelectCity(text: state_name,id: state_id,)));

                                  _onSelected(index);


                                }
                              )
                            ],
                          );
                        },
                        padding: const EdgeInsets.fromLTRB(
                            0, 0, 0, 0),
                      )
                          : Center(
                        child: Text(
                          'No Data Available',
                          style: TextStyle(

                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                        : _VehicalCellState.retryButton(fetch)
                        : _VehicalCellState.circularProgress();
                  },
                ),
              ),

              // Padding(
              //   child: _submitButton(state_id),
              //   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              // ),

            ],
          ),
        ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),

          ),
        ),

        resizeToAvoidBottomPadding: false);
  }

  Widget _submitButton(String vehicaltype) {
    return Material(
      child: Container(
        child: InkWell(
          onTap: () {



          },
          child: Container(
            child: Text(
              'Next',
              style: TextStyle(fontSize: 20, color: Color(0xffffffff)),
            ),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 45,
          ),
          splashColor: Color(0xFF043337),
          borderRadius: BorderRadius.circular(25.0),
        ),
        width: MediaQuery.of(context).size.width,
        height: 45,
        alignment: Alignment.center,
      ),
      color: Color(0xFF043337),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
  }

}


class _VehicalCellState {
  static Center circularProgress() {
    return Center(
      child: SizedBox(
        height: 50.0,
        width: 50.0,
        child: Center(
          child: CircularProgressIndicator(
            valueColor:
            new AlwaysStoppedAnimation<Color>(COLORS.APP_THEME_COLOR),
          ),
        ),
      ),
    );
  }

  static FlatButton retryButton(Function fetch) {
    return FlatButton(
      child: Text(
        MESSAGES.INTERNET_ERROR_RETRY,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(  fontWeight: FontWeight.normal),
      ),
      onPressed: () => fetch(),
    );
  }
}

