import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/API/WatchAPI.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:http/http.dart' as http;
import '../community.dart';
import '../size_config.dart';

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

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => new _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  static List<Item> itemList;
  static List<Item> itemListTwo;
  static List<ItemTwo> itemListSecond;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    category_list();
  }

  bool isLoading = false;
  List<Quotes> students = new List<Quotes>();
  Future category_list() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
   // var url = 'https://wewatch.in/wewatch-up/api/v1/categories';

    // Store all data with Param Name.

    // Starting Web API Call.

    var response = await http.get(WatchAPI.CATEGORIES, headers: {     // API is not working
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    Map<String, dynamic> decodedMap = jsonDecode(response.body);
    Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        print("Ankit" + body.toString());
        List<dynamic> dynamicList = decodedMap['data']['results'];
        List<Quotes> tempList = new List<Quotes>();
        dynamicList.forEach((f) {
          Quotes s = Quotes.fromJson(f);
          tempList.add(s);
        });
        setState(() {
          isLoading = false;
          students.addAll(tempList);
        });
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
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
//            Container(
//              width: double.infinity,
//              height: double.infinity,
//              child:  Image.asset("assets/images/on_bg_one.png",fit: BoxFit.fill,),
//
//            ),
          ListView(
            shrinkWrap: false,
            children: <Widget>[
              ShowUp(
                child: Padding(
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
                delay: 200,
              ),
              ShowUp(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: students.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: SizeConfig.heightMultiplier * 0.12,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Community(
                                    students[index].name.toString())));
                      },
                      child: Card(
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
                                    image: NetworkImage(students[index].image),
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
                                                    students[index]
                                                        .name
                                                        .toString(),
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
                      ),
                    );
                  },
                ),
                delay: 400,
              ),
            ],
          ),
        ],
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

class ItemTwo {
  String text;
  int id;
  String image;
  String imageTwo;

  ItemTwo(this.text, this.id, this.image, this.imageTwo);
}
