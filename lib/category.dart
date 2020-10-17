import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Quotes {
  var id;
  var category_id;
  var name;
  var slug;
  var image;
  var description;
  var status;
  var created_at;
  var updated_at;

  Quotes({
    this.id,
    this.category_id,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.status,
    this.created_at,
    this.updated_at,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id'],
      category_id: json['category_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      description: json['description'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => new _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Item> itemList;
  loadList() {
    itemList = List();

    itemList.add(Item('Technology', 1, "category_tech"));
    itemList.add(Item('Travel', 1, "category_travel"));
    itemList.add(Item('Fitness', 1, "category_fitness"));
    itemList.add(Item('Education', 1, "category_education"));
    itemList.add(Item('Food & Drinks', 1, "category_food"));
    itemList.add(Item('Sports', 1, "category_sports"));
  }

  @override
  void initState() {
    super.initState();

    loadList();
  }

  Future getWelcomeVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/categories';

    // Store all data with Param Name.

    // Starting Web API Call.

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());

    try {
      if (response.statusCode == 200) {
        // setState(() {
        //   welcome_video_file = body['data']['video_file'];
        //   headline_title = body['data']['headline_title'];
        //   video_locality = body['data']['video_locality'];
        //   reporter_name = body['data']['reporter_name'];
        //   reporter_image = body['data']['reporter_image'];
        //   posted_time = body['data']['posted_time'];
        //   posted_date = body['data']['posted_date'];
        // });
      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
          msg: 'Validation Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
          msg: 'Request Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
          msg: 'Authorization Failure',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.

        Fluttertoast.showToast(
          msg: 'Server Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
      );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
//            Container(
//              width: double.infinity,
//              height: double.infinity,
//              child:  Image.asset("assets/images/on_bg_one.png",fit: BoxFit.fill,),
//
//            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                        child: Align(
                          child: new Text(
                            'See All',
                            style: TextStyle(
                              color: Color(0xff00adef),
                              fontSize: 12,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child: Align(
                          child: new Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xff00adef),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9, crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(40.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/${itemList[index].image}.png"),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.transparent,
                              ),
//                            width: 200.0,
                              height: 120,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                  color: Colors.transparent,
                                ),
                                padding: EdgeInsets.all(0),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.bottomCenter,
                                            child: Container(
                                              color: Colors.white,
                                              width: double.infinity,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: Text(
                                                  itemList[index].text,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xff444b69),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Align(
                                  child: new Text(
                                    'Trending',
                                    style: TextStyle(
                                      color: Color(0xff444b69),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                        child: Align(
                          child: new Text(
                            'See All',
                            style: TextStyle(
                              color: Color(0xff00adef),
                              fontSize: 12,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                        child: Align(
                          child: new Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xff00adef),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
//                                        height: 100,
//                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Image.asset(
                                              "assets/images/adventure.png",
                                              height: 150.0,
//                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Discovery TRVLR is a white-knuckle ride into the Live',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'AajTak News',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'WeWatch - 3.5k views - 1year ago',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
//                                        height: 100,
//                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Image.asset(
                                              "assets/images/desert.png",
                                              height: 150.0,
//                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Discovery TRVLR is a white-knuckle ride into the Live',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'AajTak News',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'WeWatch - 3.5k views - 1year ago',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
//                                        height: 100,
//                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Image.asset(
                                              "assets/images/image_three.png",
                                              height: 150.0,
                                              width: 180.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Discovery TRVLR is a white-knuckle ride into the Live',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'AajTak News',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'WeWatch - 3.5k views - 1year ago',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
//                                        height: 100,
//                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Image.asset(
                                              "assets/images/adventure.png",
                                              height: 150.0,
//                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Discovery TRVLR is a white-knuckle ride into the Live',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'AajTak News',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'WeWatch - 3.5k views - 1year ago',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Center(
                                      child: Container(
//                                        height: 100,
//                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
//                                                               border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Image.asset(
                                              "assets/images/adventure.png",
                                              height: 150.0,
//                                              width: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'Discovery TRVLR is a white-knuckle ride into the Live',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'AajTak News',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: Align(
                                              child: new Text(
                                                'WeWatch - 3.5k views - 1year ago',
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/three_dots.png",
//                                                           height: 50.0,
//                                                           width: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                "assets/images/background.png"),
//                            fit: BoxFit.fill,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
            "Categories",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text(''),
            ),
          ],
          selectedItemColor: Color(0xff00adef),
          unselectedItemColor: Colors.black54,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
//          tooltip: 'Live',
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Color(0xff08c1f8), Color(0xff3017ed)])),
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("LIVE"),
                    Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Icon(
                          Icons.brightness_1,
                          size: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  String text;
  int id;
  String image;

  Item(this.text, this.id, this.image);
}
