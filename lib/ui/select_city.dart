import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:we_watch_app/edit_channel.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/ui/add_channel.dart';
import 'package:we_watch_app/ui/login.dart';

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


class SelectCity extends StatefulWidget {

  final String text,id;

  SelectCity({ @required this.text,this.id}) : super();

  @override
  _SelectCityState createState() => new _SelectCityState(text: text,id: id);
}

class _SelectCityState extends State<SelectCity> {
  final String text,id;

  _SelectCityState({ @required this.text,this.id}) : super();


  //AutoCompleteTextField searchTextFieldState,searchTextFieldCity;
  TextEditingController _textController = TextEditingController();
 // GlobalKey<AutoCompleteTextFieldState<StateName>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<City>> keyCity = new GlobalKey();
 // static List<StateName> stateName = new List<StateName>();

  bool loading = true;
  bool loadingCity = true;
  SharedPreferences prefs;
  bool isHomeDataLoading;
  String city_name="",city_id="";

  static List<City> cityName = new List<City>();
  List<City> newDataList = List.from(cityName);



  Future<List<City>> getVehical(String type) async {
    prefs = await SharedPreferences.getInstance();

    var response = await http.get('https://wewatch.in/wewatch-up/api/v1/get_city_list?state_id='+type, headers: {
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
        List<dynamic> dynamicList =  decodedMap['data']['results'];

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

        newDataList = List.from(cityName);
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



  onItemChanged(String value) {
    setState(() {
      newDataList = cityName
          .where((City) => City.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePageTwo()));



    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>
            Login()),
      );
    }



//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
  }


  @override
  void initState() {

    getCity(id);
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

    if(["",null].contains(text)){
      Toast.show("Select State First", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }else{
      if(["",null].contains(city_name)){
        Toast.show("Select city first", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      }else{
        prefs.setString('city',city_name);
        prefs.setString('state',text);
        checkFirstSeen();

      }
    }
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
                            Navigator.of(context).pop(true);
                          }
                      ),),
                    Flexible(
                        child: Center(
                            child:Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0,40, 0),
                              child:
                                  Text("Select City",style: TextStyle(color: Colors.white,
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
                child: FutureBuilder<List<City>>(
                  future: getVehical('type'),
                  builder: (context, snapshot) {
                    return Container(
                      child: snapshot.hasData
                          ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int index) {
                          return Stack(
                            children: <Widget>[
                              GestureDetector(
                                child:  Padding(
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

                                  city_id=snapshot.data[index].id.toString();
                                  city_name=snapshot.data[index].name;
                                    _onSelected(index);

                        }
                              )
                            ],
                          );
                        },
                        padding: const EdgeInsets.fromLTRB(
                            0, 5, 0, 5),
                      )
                          : Center(
                        child: Container(height: 50,width: 50,child: CircularProgressIndicator(),),
                      ),
                    )
                       ;
                  },
                ),
              ),

              // Padding(
              //   child: _submitButton(''),
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

