import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as pr;

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/NavigationPages/page_five.dart';
import 'package:we_watch_app/NavigationPages/page_four.dart';
import 'package:we_watch_app/NavigationPages/page_three.dart';
import 'package:we_watch_app/NavigationPages/video_list.dart';
import 'package:we_watch_app/change_password.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:we_watch_app/downloads.dart';
import 'package:we_watch_app/edit_profile.dart';
import 'package:we_watch_app/help_center.dart';
import 'package:we_watch_app/job_description.dart';
import 'package:we_watch_app/my_channel.dart';
import 'package:we_watch_app/search_screen.dart';
import 'package:we_watch_app/settings.dart';
import 'package:we_watch_app/size_config.dart';
import 'package:we_watch_app/subscribed.dart';
import 'package:we_watch_app/terms_policy.dart';

import 'package:we_watch_app/ui/location_access_page.dart';
import 'package:we_watch_app/ui/login.dart';
import 'package:we_watch_app/ui/show_up.dart';
import 'package:we_watch_app/ui/watch_later.dart';
import 'package:we_watch_app/upload_screen.dart';
import 'package:we_watch_app/video_history.dart';
import 'package:we_watch_app/video_home_page.dart';
import 'package:we_watch_app/video_play_detail.dart';
import 'package:we_watch_app/watch_later_three.dart';
import 'package:http/http.dart' as http;
import 'NavigationPages/dashboard.dart';
import 'community.dart';

import 'package:google_maps_webservice/directions.dart' as dir;
import 'package:google_maps_webservice/src/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class HomePageTwo extends StatefulWidget {
  HomePageTwo({Key key}) : super(key: key);

  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

int delayAmount = 400;

class _HomePageTwoState extends State<HomePageTwo> {
  String profilePic, profilename, cityName = "", stateName = "";
  static int doLogin;

  List pages = [
    MyRoute(
      page: Dashboard(),
    ),
    MyRoute(
      page: VideoList(),
    ),
    MyRoute(
      page: PageThree(),
    ),
    MyRoute(
      page: ChannelList(),
    ),
    MyRoute(
      page: EditProfile(),
    ),
  ];
  bool visible = false;

  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();


  Future<List<Videos>> getVideos(String type, String text) async {
    // Showing CircularProgressIndicator.
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String access_token = prefs.getString('access_token');
    setState(() {
      if (access_token == null)
        access_token =
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd2V3YXRjaC5pblwvd2V3YXRjaC11cFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2MDAyMzk3NTYsImV4cCI6MTYwNTQyMzc1NiwibmJmIjoxNjAwMjM5NzU2LCJqdGkiOiJzSWlOM3pxUllxcHBHNER2Iiwic3ViIjo3NiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WDtxGEIZL2nWMpDcr6o-FvmxZEBlt9gak-BtF_y_0ho";
      visible = true;
    });

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/video';

    // Store all data with Param Name.

    // Starting Web API Call.
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });
    // Getting Server response into variable.

    List<Videos> list;
    var message = jsonDecode(response.body);
    Map<String, dynamic> decodedMap = jsonDecode(response.body);
    Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
    var body = await json.decode(response.body);

    try {
      if (response.statusCode == 200) {
        print("Ankit" + body.toString());
        print("Check" + body['data']['results'].toString());
        List<dynamic> dynamicList = decodedMap['data']['results'];
        var data = json.decode(response.body);
        var rest = data["data"]['results'] as List;
        print(rest);
        list = rest.map<Videos>((json) => Videos.fromJson(json)).toList();

        List<Videos> students = new List<Videos>();
        dynamicList.forEach((f) {
          Videos s = Videos.fromJson(f);
          students.add(s);
        });
        setState(() {
          visible = false;
        });

        return students;
      } else {
        setState(() {
          visible = true;
        });
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      setState(() {
        visible = true;
      });
      throw Exception(e);
    }
//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }

  Widget listViewWidget(List<Videos> article) {
    return Container(
      child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              child: ListTile(
                title: Text(
                  '${article[position].video_file}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: article[position].video_thumb_image == null
                        ? Image(
                            image: AssetImage('images/no_image_available.png'),
                          )
                        : Image.network(
                            '${article[position].video_thumb_image}'),
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
//                onTap: () => _onTapItem(context, article[position]),
              ),
            );
          }),
    );
  }

  Future erase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.commit();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      doLogin = 1;
    } else {
      doLogin = 0;
    }

//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
  }

  Future getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    cityName = prefs.getString('city');
    stateName = prefs.getString('state');

    String access_token = prefs.getString('access_token');
    setState(() {
      if (access_token == null)
        access_token =
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd2V3YXRjaC5pblwvd2V3YXRjaC11cFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2MDAyMzk3NTYsImV4cCI6MTYwNTQyMzc1NiwibmJmIjoxNjAwMjM5NzU2LCJqdGkiOiJzSWlOM3pxUllxcHBHNER2Iiwic3ViIjo3NiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.WDtxGEIZL2nWMpDcr6o-FvmxZEBlt9gak-BtF_y_0ho";

      visible = true;
    });

    // Getting value from Controller

//    String password = _mobileFilter.text.toString();

    // SERVER LOGIN API URL
    var url = 'https://wewatch.in/wewatch-up/api/v1/profile';

    // Store all data with Param Name.

    // Starting Web API Call.
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });

    // Getting Server response into variable.




    try {
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        var message = jsonDecode(response.body);
        debugPrint("profile data" + message.toString());
        //print("iid"+body['data']['id'].toString());
        prefs.setString("user_id", body['data']['id'].toString());
        prefs.setString('first_name', body['data']['first_name']);
        prefs.setString('last_name', body['data']['last_name']);
        prefs.setString('email', body['data']['email']);
        prefs.setString('emp_type', body['data']['emp_type']!=null?body['data']['emp_type']:"");
        prefs.setString('gender', body['data']['gender']);
        prefs.setString('mobile_number', body['data']['mobile_number']);
        prefs.setString('slug', body['data']['slug']!=null?body['data']['slug']:"");
        prefs.setString('date_of_birth', body['data']['date_of_birth']);
        prefs.setString('otp', body['data']['otp']);
        prefs.setString('status', body['data']['status']);
        prefs.setString('user_type', body['data']['user_type']);
        prefs.setString('address', body['data']['address']);
        prefs.setString('city_id', body['data']['city_id']);
        prefs.setString('state_id', body['data']['state_id']);
        prefs.setString('country_id', body['data']['country_id']);
        prefs.setString('zipcode', body['data']['zipcode']);
        prefs.setString('image', body['data']['image']);

        profilename = body['data']['first_name'].toString() +
            " " +
            body['data']['last_name'].toString();
        profilePic = body['data']['image'].toString();
        cityName = prefs.getString('city');
        stateName = prefs.getString('state');
        print('profile' + cityName);
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
//        Fluttertoast.showToast(
//            msg: body['data']['access_token'],
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
////            timeInSecForIos: 1
//        );
//        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Navigate to Profile Screen & Sending Email to Next Screen.

      } else if (response.statusCode == 422) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Validation Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Request Fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 401) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
          msg: 'Authorization Failure',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
        );
      } else if (response.statusCode == 500) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
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

  static List<Item> itemList;
  static List<Item> itemListTwo;
  static List<ItemTwo> itemListSecond;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  loadList() {
    itemList = List();

    itemList.add(Item('Technology', 1, "category_tech"));
    itemList.add(Item('Travel', 1, "category_travel"));
    itemList.add(Item('Fitness', 1, "category_fitness"));
    itemList.add(Item('Education', 1, "category_education"));
    itemList.add(Item('Food & Drinks', 1, "category_food"));
    itemList.add(Item('Sports', 1, "category_sports"));
  }

  loadListSecond() {
    itemListSecond = List();

    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_7", "accessories"));
    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_8", "plant"));
    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_9", "spiritual"));
    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_10", "news_admin"));
    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_11", "cinema"));
    itemListSecond.add(ItemTwo('Technology', 1, "cat_image_12", "music"));
  }

  loadListTwo() {
    itemListTwo = List();

    itemListTwo.add(Item('Employee', 1, "worker"));
    itemListTwo.add(Item('Jobs Feeds', 2, "job"));
    itemListTwo.add(Item('Latest Videos', 3, "group"));
    itemListTwo.add(Item('Social Workers', 4, "social_workers"));
//    itemListTwo.add(Item('Groups', 1, "category_food"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
//    itemListTwo.add(Item('Groups', 1, "category_sports"));
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
    getMessage();
    loadList();
    loadListTwo();
    loadListSecond();
    getProfile();
  }
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String _message;
  void getMessage(){       //it will handle firebase messaging
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["notification"]["title"]);
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
          var androidPlatformChannelSpecifics = AndroidNotificationDetails('watch.we.we_watch_app', 'watch.we.we_watch_app', 'watch.we.we_watch_app',importance: Importance.high, priority: pr.Priority.high, ticker: 'ticker');
          var iOSPlatformChannelSpecifics = IOSNotificationDetails();
          var platformChannelSpecifics = NotificationDetails(android:androidPlatformChannelSpecifics,iOS: iOSPlatformChannelSpecifics);
          await new FlutterLocalNotificationsPlugin().show(0, message['notification']['title'], message['notification']['body'], platformChannelSpecifics, payload: 'msg:');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isHomeDataLoading = false;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  void _getLatLng(Prediction prediction) async {
    try {
      GoogleMapsPlaces _places = new
      GoogleMapsPlaces(
          apiKey: "AIzaSyAfySREHfRw2x8bEFT6b7Nc4z3Te80LiyI"); //Same API_KEY as above
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(prediction.placeId);
      double latitude = detail.result.geometry.location.lat;
      double longitude = detail.result.geometry.location.lng;
      String address = prediction.description;
      print("lati " + latitude.toString() + " langi " + longitude.toString());
      _getAddressFromLatLng(latitude, longitude);
    }catch(e){
      debugPrint(e);
    }
  }
  Geolocator geolocator;
  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      geolocator = Geolocator();
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          latitude,longitude);

      Placemark place = p[0];

      setState(() {
        print("sunny District "+place.locality+" state " +place.administrativeArea+" country "+place.country +"pin code"+place.postalCode);
        // userCity=place.locality;
        // userState=place.administrativeArea;
        // userLocality=place.country;
        // userPostalCode=place.postalCode;
      });
      // UtilityClass.showMsg("District "+place.locality+" state " +place.administrativeArea+" country "+place.country );

    } catch (e) {
      print(e);
      print("locality exception"+e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int delayAmountTwo = 400;
    int delayAmountThree = 400;
    List<Widget> _widgetOptions = <Widget>[
      Builder(
        builder: (context) {
          return Stack(
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
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Center(
                                child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: (![
                                            "",
                                            null,
                                            false,
                                            0,
                                          ].contains(profilePic))
                                              ? NetworkImage(
                                                  profilePic,
                                                )
                                              : AssetImage(
                                                  "assets/images/logo_splash.png",
                                                ),
                                        ))),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 0.0),
                                    child: Align(
                                      child: new Text(
                                        'Hi! Raj Kaushal',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Align(
                                      child: new Text(
                                        'Morning 23 April',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            'Good Morning',
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 5.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            '',
                                            style: TextStyle(
                                              color: Color(0xff00adef),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: SvgPicture.asset(
                                  "assets/images/tea.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    delay: delayAmount,
                  ),
                  ShowUp(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: SizeConfig.heightMultiplier * 0.12,
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDescription()));
                            }
                            if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoHomePage()));
                            }
                            if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDescription()));
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: (Colors.accents[Random()
                                        .nextInt(Colors.accents.length)])[100],
                                  ),
//                            width: 75.0,
                                  height: 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: SvgPicture.asset(
                                                "assets/images/${itemListTwo[index].image}.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: FractionalOffset
                                                    .bottomCenter,
                                                child: Container(
                                                  color: Colors.transparent,
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: Text(
                                                      itemListTwo[index].text,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff444b69),
                                                        fontSize: 12,
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
                    delay: delayAmount + 200,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlay()),
                          );
                        },
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(40.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/banner_one.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        height: 200.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                            color: Colors.transparent,
                                          ),
                                          padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Spacer(),
                                            Align(
                                              alignment:
                                                  FractionalOffset.topRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: Card(
                                                  child: Container(
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Color(0xfff8082d),
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(50),
                                                    ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 2, 10, 2),
                                                          child: Text(
                                                            'LIVE',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  ),
//                                    elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 0, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 0),
                                                    child: Center(
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Icon(
                                                          Icons
                                                              .play_circle_outline,
                                                          color: Colors.white,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 75,
                                            width: 75,
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
                                                  "assets/images/comment_dp.png",
                                                  height: 50.0,
                                                  width: 50.0,
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'India News',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'WeWatch - 3.5k views',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
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
                    delay: delayAmount + 400,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlay()),
                          );
                        },
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.circular(40.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/back_two.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        height: 200.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                            color: Colors.transparent,
                                          ),
                                          padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Spacer(),
                                            Align(
                                              alignment:
                                                  FractionalOffset.topRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                child: Card(
                                                  child: Container(
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(50),
                                                    ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  10, 2, 10, 2),
                                                          child: Text(
                                                            '15:34',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  ),
//                                    elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 0, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 0),
                                                    child: Center(
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Icon(
                                                          Icons
                                                              .play_circle_outline,
                                                          color: Colors.white,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 75,
                                            width: 75,
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
                                                  "assets/images/bbbb.png",
                                                  height: 50.0,
                                                  width: 50.0,
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'India News',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'WeWatch - 3.5k views',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
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
                    delay: delayAmount + 600,
                  ),
                  ShowUp(
                    child: Padding(
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
                                  padding: EdgeInsets.all(0),
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(40.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/banner_three.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    height: 200.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                        color: Colors.transparent,
                                      ),
                                      padding: EdgeInsets.all(20),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 0, 0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 10, 0, 0),
                                                      child: Center(
                                                        child: Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: Icon(
                                                            Icons
                                                                .play_circle_outline,
                                                            color: Colors.white,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 75,
                                            width: 75,
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
                                                  "assets/images/bbbb.png",
                                                  height: 50.0,
                                                  width: 50.0,
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'India News',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Align(
                                                  child: new Text(
                                                    'WeWatch - 3.5k views',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
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
                    delay: delayAmount + 800,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      Builder(
        builder: (context) {
          return Stack(
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
                  FutureBuilder(
                      future: getVideos("", ""),
                      builder: (context, snapshot) {
                        return snapshot.data != null
                            ? listViewWidget(snapshot.data)
                            : Center(child: CircularProgressIndicator());
                      }),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: SizedBox(
//                  height: MediaQuery.of(context).size.height/3,
//                  width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<List<Videos>>(
                        future: getVideos("", ""),
                        builder: (context, snapshot) {
                          return snapshot.connectionState ==
                                  ConnectionState.done
                              ? snapshot.hasData
                                  ? _VideosCellState.homeGrid(snapshot, context)
                                  : _VideosCellState.retryButton(fetch)
                              : _VideosCellState.circularProgress();
                        },
                      ),
                    ),
                  ),
//                  ShowUp(
//                    child: Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => VideoPlay()),
//                          );
//                        },
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: EdgeInsets.all(0),
//                                  child: Container(
//                                    padding: EdgeInsets.all(0),
//                                    decoration: BoxDecoration(
//                                      //borderRadius: BorderRadius.circular(40.0),
//                                      image: DecorationImage(
//                                        image: AssetImage(
//                                            "assets/images/image_four.png"),
//                                        fit: BoxFit.fill,
//                                      ),
//                                      color: Colors.transparent,
//                                    ),
//                                    height: 200.0,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(10.0),
////                        image: DecorationImage(
////                          image: AssetImage("assets/images/card_background.png"),
////                          fit: BoxFit.fill,
////
////                        ),
//                                        color: Colors.transparent,
//                                      ),
//                                      padding: EdgeInsets.all(0),
//                                      child: Stack(
//                                        children: <Widget>[
//                                          Align(
//                                            alignment: FractionalOffset.topRight,
//                                            child: Padding(
//                                              padding: EdgeInsets.all(10),
//                                              child: Padding(
//                                                padding: EdgeInsets.all(0),
//                                                child: Image.asset(
//                                                  "assets/images/live.png",
//                                                  height: 20.0,
//                                                  width: 50.0,
//                                                  fit: BoxFit.fill,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Column(
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                                child: Row(
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding: EdgeInsets.fromLTRB(
//                                                          0, 10, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 100,
//                                                          width: 100,
//                                                          child: Icon(
//                                                            Icons
//                                                                .play_circle_outline,
//                                                            color: Colors.white,
//                                                            size: 50,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Center(
//                                          child: Container(
//                                            height: 75,
//                                            width: 75,
//                                            decoration: BoxDecoration(
//                                              color: Colors.white,
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                            ),
//                                            child: Center(
//                                              child: Padding(
//                                                padding: EdgeInsets.all(0),
//                                                child: Image.asset(
//                                                  "assets/images/bbbb.png",
//                                                  height: 50.0,
//                                                  width: 50.0,
//                                                  fit: BoxFit.fill,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'India News',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 16,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'WeWatch - 3.5k views',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 14,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                      Center(
//                                        child: Padding(
//                                          padding: EdgeInsets.all(20),
//                                          child: Image.asset(
//                                            "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                            fit: BoxFit.fill,
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    delay: delayAmountTwo,
//                  ),
//
//                  ShowUp(
//                    child: Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: EdgeInsets.all(0),
//                                  child: Container(
//                                    padding: EdgeInsets.all(0),
//                                    decoration: BoxDecoration(
//                                      //borderRadius: BorderRadius.circular(40.0),
//                                      image: DecorationImage(
//                                        image: AssetImage(
//                                            "assets/images/image_five.png"),
//                                        fit: BoxFit.fill,
//                                      ),
//                                      color: Colors.transparent,
//                                    ),
//                                    height: 200.0,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(10.0),
////                        image: DecorationImage(
////                          image: AssetImage("assets/images/card_background.png"),
////                          fit: BoxFit.fill,
////
////                        ),
//                                        color: Colors.transparent,
//                                      ),
//                                      padding: EdgeInsets.all(20),
//                                      child: Stack(
//                                        children: <Widget>[
//                                          Align(
//                                            alignment: FractionalOffset.topRight,
//                                            child: Padding(
//                                              padding: EdgeInsets.all(10),
//                                              child: Padding(
//                                                padding: EdgeInsets.all(0),
//                                                child: Image.asset(
//                                                  "assets/images/live.png",
//                                                  height: 20.0,
//                                                  width: 50.0,
//                                                  fit: BoxFit.fill,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Column(
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                                child: Row(
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding: EdgeInsets.fromLTRB(
//                                                          0, 10, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 100,
//                                                          width: 100,
//                                                          child: Icon(
//                                                            Icons
//                                                                .play_circle_outline,
//                                                            color: Colors.white,
//                                                            size: 50,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Center(
//                                          child: Container(
//                                            height: 75,
//                                            width: 75,
//                                            decoration: BoxDecoration(
//                                              color: Colors.white,
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                            ),
//                                            child: Center(
//                                              child: Padding(
//                                                padding: EdgeInsets.all(0),
//                                                child: Image.asset(
//                                                  "assets/images/bbbb.png",
//                                                  height: 50.0,
//                                                  width: 50.0,
//                                                  fit: BoxFit.fill,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'India News',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 16,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'WeWatch - 3.5k views',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 14,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                      Center(
//                                        child: Padding(
//                                          padding: EdgeInsets.all(20),
//                                          child: Image.asset(
//                                            "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                            fit: BoxFit.fill,
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    delay: delayAmountTwo+200,
//                  ),
//
//                  ShowUp(
//                    child: Padding(
//                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
//                      child: GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                          child: Container(
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: EdgeInsets.all(0),
//                                  child: Container(
//                                    padding: EdgeInsets.all(0),
//                                    decoration: BoxDecoration(
//                                      //borderRadius: BorderRadius.circular(40.0),
//                                      image: DecorationImage(
//                                        image: AssetImage(
//                                            "assets/images/image_six.png"),
//                                        fit: BoxFit.fill,
//                                      ),
//                                      color: Colors.transparent,
//                                    ),
//                                    height: 200.0,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(10.0),
////                        image: DecorationImage(
////                          image: AssetImage("assets/images/card_background.png"),
////                          fit: BoxFit.fill,
////
////                        ),
//                                        color: Colors.transparent,
//                                      ),
//                                      padding: EdgeInsets.all(20),
//                                      child: Stack(
//                                        children: <Widget>[
//                                          Column(
//                                            children: <Widget>[
//                                              Padding(
//                                                padding:
//                                                EdgeInsets.fromLTRB(5, 5, 0, 0),
//                                                child: Row(
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Padding(
//                                                      padding: EdgeInsets.fromLTRB(
//                                                          0, 10, 0, 0),
//                                                      child: Center(
//                                                        child: Container(
//                                                          height: 100,
//                                                          width: 100,
//                                                          child: Icon(
//                                                            Icons
//                                                                .play_circle_outline,
//                                                            color: Colors.white,
//                                                            size: 50,
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Center(
//                                          child: Container(
//                                            height: 75,
//                                            width: 75,
//                                            decoration: BoxDecoration(
//                                              color: Colors.white,
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(50)),
////                                                               border: Border.all(
////                                                                   width: 0,
////                                                                   color: Colors
////                                                                       .lightBlue,
////                                                                   style:
////                                                                   BorderStyle
////                                                                       .solid)
//                                            ),
//                                            child: Center(
//                                              child: Padding(
//                                                padding: EdgeInsets.all(0),
//                                                child: Image.asset(
//                                                  "assets/images/bbbb.png",
//                                                  height: 50.0,
//                                                  width: 50.0,
//                                                  fit: BoxFit.fill,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.all(4.0),
//                                          child: Column(
//                                            mainAxisAlignment:
//                                            MainAxisAlignment.start,
//                                            crossAxisAlignment:
//                                            CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'India News',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 16,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                              Padding(
//                                                padding: const EdgeInsets.fromLTRB(
//                                                    0.0, 10.0, 0.0, 0.0),
//                                                child: Align(
//                                                  child: new Text(
//                                                    'WeWatch - 3.5k views',
//                                                    style: TextStyle(
//
//                                                      color: Colors.black45,
//                                                      fontSize: 14,
//                                                      letterSpacing: 0,
//                                                      fontWeight: FontWeight.w400,
//                                                    ),
//                                                    textAlign: TextAlign.left,
//                                                    textDirection:
//                                                    TextDirection.ltr,
//                                                  ),
//                                                  alignment: Alignment.centerLeft,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                      Center(
//                                        child: Padding(
//                                          padding: EdgeInsets.all(20),
//                                          child: Image.asset(
//                                            "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                            fit: BoxFit.fill,
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
////                        decoration: BoxDecoration(
////                          image: DecorationImage(
////                            image: AssetImage(
////                                "assets/images/background.png"),
////                            fit: BoxFit.fill,
////                          ),
////                          borderRadius: BorderRadius.circular(10.0),
////                        ),
//                          ),
//                          elevation: 0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.only(
//                              topRight: Radius.circular(15),
//                              topLeft: Radius.circular(15),
//                              bottomLeft: Radius.circular(15),
//                              bottomRight: Radius.circular(15),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    delay: delayAmountTwo+400,
//                  ),
                ],
              ),
            ],
          );
        },
      ),
      Builder(
        builder: (context) {
          return Stack(
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
                    delay: delayAmountTwo,
                  ),
                  ShowUp(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: SizeConfig.heightMultiplier * 0.12,
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            } else if (index == 1) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            } else if (index == 2) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            }
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                  alignment: FractionalOffset
                                                      .bottomCenter,
                                                  child: Container(
                                                    color: Colors.white,
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 5, 5, 5),
                                                      child: Text(
                                                        itemList[index].text,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff444b69),
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
                    delay: delayAmountTwo + 200,
                  ),
                  ShowUp(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: SizeConfig.heightMultiplier * 0.12,
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            } else if (index == 1) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            } else if (index == 2) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Community()));
                            }
                          },
                          child: Stack(
                            children: <Widget>[
                              Card(
                                elevation: 5,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/${itemListSecond[index].image}.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.transparent,
                                        ),
//                            width: 200.0,
                                        height: 120,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                          FractionalOffset
                                                              .bottomCenter,
                                                      child: Container(
                                                        color: Colors.white,
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  5, 5, 5, 5),
                                                          child: Text(
                                                            itemListSecond[
                                                                    index]
                                                                .text,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff444b69),
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: SvgPicture.asset(
                                      "assets/images/${itemListSecond[index].imageTwo}.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    delay: delayAmountTwo + 200,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                child: Flexible(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              //borderRadius: BorderRadius.circular(40.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/image_seven.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            height: 200.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
//                                                            Align(
//                                                              alignment:FractionalOffset.topRight,
//                                                              child: Padding(
//                                                                padding: EdgeInsets.all(10),
//                                                                child: Padding(
//                                                                  padding:
//                                                                  EdgeInsets.all(
//                                                                      0),
//                                                                  child: Image.asset(
//                                                                    "assets/images/live.png",
//                                                                    height: 20.0,
//                                                                    width: 50.0,
//                                                                    fit: BoxFit.fill,
//                                                                  ),
//                                                                ),
//                                                              ),
//                                                            ),
//
//                                                            Column(
//                                                              children: <
//                                                                  Widget>[
//
//                                                                Padding(
//                                                                  padding: EdgeInsets
//                                                                      .fromLTRB(
//                                                                      5,
//                                                                      5,
//                                                                      0,
//                                                                      0),
//                                                                  child:
//                                                                  Row(
//                                                                    crossAxisAlignment:
//                                                                    CrossAxisAlignment.center,
//                                                                    mainAxisAlignment:
//                                                                    MainAxisAlignment.center,
//                                                                    children: <
//                                                                        Widget>[
//                                                                      Padding(
//                                                                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                                                        child: Center(
//                                                                          child:Container(
//                                                                            height:100,
//                                                                            width:100,
//                                                                            child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ],
//                                                                  ),
//                                                                ),
//
//
//                                                              ],
//                                                            ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
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
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        child: Image.asset(
                                                          "assets/images/comment_dp.png",
                                                          height: 50.0,
                                                          width: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Linkin Park',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            '67k Subscribers',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Image.asset(
                                                    "assets/images/subscribe_button.png",
                                                    height: 35.0,
                                                    width: 120.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 20, 5, 20),
                                                  child: Icon(
                                                    Icons.notifications,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),
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
                            delay: delayAmountTwo,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              //borderRadius: BorderRadius.circular(40.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/image_eight.png"),
                                                fit: BoxFit.fill,
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            height: 200.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                                                color: Colors.transparent,
                                              ),
                                              padding: EdgeInsets.all(20),
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment: FractionalOffset
                                                        .topRight,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        child: Image.asset(
                                                          "assets/images/live.png",
                                                          height: 20.0,
                                                          width: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
//                                                            Column(
//                                                              children: <
//                                                                  Widget>[
//
//                                                                Padding(
//                                                                  padding: EdgeInsets
//                                                                      .fromLTRB(
//                                                                      5,
//                                                                      5,
//                                                                      0,
//                                                                      0),
//                                                                  child:
//                                                                  Row(
//                                                                    crossAxisAlignment:
//                                                                    CrossAxisAlignment.center,
//                                                                    mainAxisAlignment:
//                                                                    MainAxisAlignment.center,
//                                                                    children: <
//                                                                        Widget>[
//                                                                      Padding(
//                                                                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                                                        child: Center(
//                                                                          child:Container(
//                                                                            height:100,
//                                                                            width:100,
//                                                                            child:Icon(Icons.play_circle_outline,color:Colors.white,size: 50,),
//                                                                          ),
//                                                                        ),
//                                                                      ),
//                                                                    ],
//                                                                  ),
//                                                                ),
//
//
//                                                              ],
//                                                            ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
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
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        child: Image.asset(
                                                          "assets/images/bbbb.png",
                                                          height: 50.0,
                                                          width: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'India News',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'WeWatch - 3.5k views',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
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
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),
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
                            delay: delayAmountTwo + 200,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
//                                        height: 100,
//                                        width: 75,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
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
                                                        padding:
                                                            EdgeInsets.all(0),
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
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Discovery TRVLR is a white-knuckle ride into the Live',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 15,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'AajTak News',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'WeWatch - 3.5k views - 1year ago',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
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
                            delay: delayAmountTwo + 600,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
//                                        height: 100,
//                                        width: 75,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
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
                                                        padding:
                                                            EdgeInsets.all(0),
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
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Discovery TRVLR is a white-knuckle ride into the Live',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 15,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'AajTak News',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'WeWatch - 3.5k views - 1year ago',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
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
                            delay: delayAmountTwo + 800,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Center(
                                                  child: Container(
//                                        height: 100,
//                                        width: 75,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
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
                                                        padding:
                                                            EdgeInsets.all(0),
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
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'Discovery TRVLR is a white-knuckle ride into the Live',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 15,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'AajTak News',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            'WeWatch - 3.5k views - 1year ago',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
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
                            delay: delayAmountTwo + 1000,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          );
        },
      ),
      Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                child: Flexible(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    9.55,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        15.13,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/comment_dp.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          9.55,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          15.13,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              2.00,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        '2 day ago',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              1.78,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    12.73,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        38.26,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/image_nine.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          12.73,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          38.26,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
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
                            delay: delayAmountThree,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    9.55,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        15.13,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/comment_dp.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          9.55,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          15.13,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              2.00,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        '2 day ago',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              1.78,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    12.73,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        38.26,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/image_nine.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          12.73,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          38.26,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
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
                            delay: delayAmountThree + 200,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    9.55,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        15.13,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/comment_dp.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          9.55,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          15.13,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              2.00,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        '2 day ago',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              1.78,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    12.73,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        38.26,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/image_nine.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          12.73,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          38.26,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
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
                            delay: delayAmountThree + 400,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    9.55,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        15.13,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/comment_dp.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          9.55,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          15.13,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              2.00,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        '2 day ago',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              1.78,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    12.73,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        38.26,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/image_nine.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          12.73,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          38.26,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
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
                            delay: delayAmountThree + 600,
                          ),
                          ShowUp(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    9.55,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        15.13,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/comment_dp.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          9.55,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          15.13,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        'Discovery TRVLR is a white-knuckle ride into the Live',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              2.00,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Align(
                                                      child: new Text(
                                                        '2 day ago',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: SizeConfig
                                                                  .heightMultiplier *
                                                              1.78,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Center(
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    12.73,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        38.26,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      "assets/images/image_nine.png",
                                                      height: SizeConfig
                                                              .heightMultiplier *
                                                          12.73,
                                                      width: SizeConfig
                                                              .widthMultiplier *
                                                          38.26,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
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
                            delay: delayAmountThree + 600,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      9.55,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      15.13,
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
                                                    "assets/images/comment_dp.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        9.55,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        15.13,
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Discovery TRVLR is a white-knuckle ride into the Live',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            2.00,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      '2 day ago',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            1.78,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      12.73,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      38.26,
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
                                                    "assets/images/image_nine.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        12.73,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        38.26,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
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
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      9.55,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      15.13,
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
                                                    "assets/images/comment_dp.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        9.55,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        15.13,
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Discovery TRVLR is a white-knuckle ride into the Live',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            2.00,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      '2 day ago',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            1.78,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      12.73,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      38.26,
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
                                                    "assets/images/image_nine.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        12.73,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        38.26,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
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
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      9.55,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      15.13,
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
                                                    "assets/images/comment_dp.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        9.55,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        15.13,
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Discovery TRVLR is a white-knuckle ride into the Live',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            2.00,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      '2 day ago',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            1.78,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      12.73,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      38.26,
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
                                                    "assets/images/image_nine.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        12.73,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        38.26,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
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
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      9.55,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      15.13,
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
                                                    "assets/images/comment_dp.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        9.55,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        15.13,
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      'Discovery TRVLR is a white-knuckle ride into the Live',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            2.00,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: new Text(
                                                      '2 day ago',
                                                      style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: SizeConfig
                                                                .heightMultiplier *
                                                            1.78,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      12.73,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      38.26,
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
                                                    "assets/images/image_nine.png",
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        12.73,
                                                    width: SizeConfig
                                                            .widthMultiplier *
                                                        38.26,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
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
                      )),
                ),
              ),
            ],
          );
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLORS.APP_BAR_COLOR,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
                child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Card(
                  child: Container(
                    width: 150,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(50),
                      border: Border.all(color: Colors.black87, width: 1.0),
                    ),
//                          height: 40.0, // height of the button
//                                      width: 120.0, // width of the button
                    child: Center(
                        child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                                        Image.asset(
//                                          'assets/images/avatar.png',
//                                          height: 20.0,
//                                          width: 20.0,
//                                          fit: BoxFit.cover,
//                                        ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                            child: Text(
                              ![null, ""].contains(cityName)
                                  ? cityName
                                  : 'No Location…',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      onTap: () async{
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LocationAccess()),
                        // );
                        try {
                          Prediction pr = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: "AIzaSyAfySREHfRw2x8bEFT6b7Nc4z3Te80LiyI",
                              language: "en",
                              components: [dir.Component(dir.Component.country, "in"),
                              ]);
                          _getLatLng(pr);
                          print("place id=>" + pr.placeId);
                        }catch(ex){

                        }

                      },
                    )),
                  ),
//                                    elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GestureDetector(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onTap: () {
                if (doLogin == 0) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()),
                      (Route<dynamic> route) => false);
                }
                if (doLogin == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                }
              },
            ),
          ),
        ],
        title: Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SizedBox(
        width: size.width,
        child: Drawer(
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height / 4.5,
                width: size.width * 0.9,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/back_two.png'),
                )),
              ),
              doLogin == 1
                  ? ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
//                  UserAccountsDrawerHeader(
//                    decoration: new BoxDecoration(),
//                    accountEmail: Text(
//                      "Ankit.aic193@Gmail.com",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    accountName: Text(
//                      "Ankit Prajapati",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    currentAccountPicture: CircleAvatar(
//                      backgroundColor: Color(0xfff2a064),
//                      child: Text(
//                        "AP",
//                        style: TextStyle(
//                          color: Colors.black,
//                        ),
//                      ),
//                    ),
//
//                  ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                            child: Row(
                              children: <Widget>[

                                Container(
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/logo_splash.png',
                                    height: 75.0,
                                    width: 75.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //Spacer(),
                                Text(
                                  "पहचान भारत की",
                                  style: TextStyle(
                                    color: Color(0xff5c5e6a),
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xffe320e3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/account.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "My Channel",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyChannel()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff151eaf),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  "assets/images/my_videos.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "My Videos",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoHistory()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfff40875),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  "assets/images/add.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Add Videos",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Upload()),
                            );
                          },
                        ),
//                         ListTile(
//                           leading: Container(
//                             height: 35,
//                             width: 35,
//                             decoration: BoxDecoration(
//                               color: Color(0xffef7432),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50)),
// //                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
//                             ),
//                             child: Stack(
//                               children: <Widget>[
//                                 Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(0),
//                                     child: SvgPicture.asset(
//                                       "assets/images/refresh.svg",
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: SvgPicture.asset(
//                                       "assets/images/watch_later.svg",
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           title: Text(
//                             "Watch Later",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.of(context).pop();
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => WatchThree()),
//                             );
//                           },
//                         ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff5f266d),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(
                                  Icons.notifications_none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "My Subscription",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Subscribed()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff151eaf),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/setting.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff31b911),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/privacy_2.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Terms & Privacy policy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsPolicy()),
                            );
                          },
                        ),

                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfffa4e02),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/help.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Help & Feedback",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenter()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff2fcee1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  "assets/images/edit_personal.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Edit Personal Informations",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfffa4e02),
                              borderRadius:
                              BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/share_grey.png",color: Colors.white,
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Share App",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            shareApp();
                          },
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xffff0504),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  "assets/images/change_password.svg",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()),
                            );
                          },
                        ),
//                         ListTile(
//                           leading: Container(
//                             height: 35,
//                             width: 35,
//                             decoration: BoxDecoration(
//                               color: Color(0xff42445d),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50)),
// //                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
//                             ),
//                             child: Center(
//                               child: Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Image.asset(
//                                   "assets/images/outbox.png",
// //                                                                          height: 50.0,
// //                                                                          width: 50.0,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           title: Text(
//                             "Downloads",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                             ),
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Downloads()),
//                             );
//                           },
//                         ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfff40875),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/log_out.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            erase();
                            Navigator.of(context).pop();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreenProcessTwo()),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    )
                  : ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
//                  UserAccountsDrawerHeader(
//                    decoration: new BoxDecoration(),
//                    accountEmail: Text(
//                      "Ankit.aic193@Gmail.com",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    accountName: Text(
//                      "Ankit Prajapati",
//                      style: TextStyle(
//                        color: Colors.black,
//                      ),
//                    ),
//                    currentAccountPicture: CircleAvatar(
//                      backgroundColor: Color(0xfff2a064),
//                      child: Text(
//                        "AP",
//                        style: TextStyle(
//                          color: Colors.black,
//                        ),
//                      ),
//                    ),
//
//                  ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Guest User!",
                                    style: TextStyle(
                                      color: Color(0xff5c5e6a),
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/profile_pic.png',
                                  height: 75.0,
                                  width: 75.0,
                                  fit: BoxFit.cover,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xffe320e3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/account.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),

                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff31b911),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/privacy_2.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Terms & Privacy policy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsPolicy()),
                            );
                          },
                        ),

                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfffa4e02),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/help.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Help & Feedback",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenter()),
                            );
                          },
                        ),


                        ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xfff40875),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
//                                                border: Border.all(width: 1, color: Color(0xffe25705), style: BorderStyle.solid)
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/images/log_out.png",
//                                                                          height: 50.0,
//                                                                          width: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Login/Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            erase();
                            Navigator.of(context).pop();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      body: Center(
        child: pages[_pageIndex].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(0),
              child: Image.asset(
                "assets/images/play_buttombar.png",
                height: 20.0,
                width: 20.0,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/job.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/social_workers.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/worker.svg",
              color: Color(0xff444b69),
              height: 20,
              width: 20,
            ),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff00adef),
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 4 && doLogin == 0) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => Login()),
                (Route<dynamic> route) => false);
          } else {
            if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            } else {
              setState(() {
                _pageIndex = index;
              });
            }
          }
        },
      ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => CameraPage()),
//            );
//          },
//          child: Container(
//            decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                gradient: LinearGradient(
//                    begin: Alignment.topLeft,
//                    end: Alignment.bottomRight,
//                    stops: [0.3, 1],
//                    colors: [Color(0xff08c1f8), Color(0xff3017ed)])),
//            child: Center(
//              child: Container(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text("LIVE"),
//                    Align(
//                      alignment: FractionalOffset.bottomRight,
//                      child: Padding(
//                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                        child: Icon(
//                          Icons.brightness_1,
//                          size: 5,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
    );
  }
  PackageInfo packageInfo;
  shareApp() async{
    packageInfo = await PackageInfo.fromPlatform();
    final RenderBox box = context.findRenderObject();
    String packageName = packageInfo.packageName;
    Share.share("See the latest video download we watch app, click on this link : https://play.google.com/store/apps/details?id="+packageName,
        subject: packageInfo.appName,
        sharePositionOrigin:box.localToGlobal(Offset.zero) & box.size);
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

class Videos {
  var id;
  var user_id;
  var video_thumb_image;
  var video_file;
  var video_title;
  var video_description;
  var state_id;
  var citi_id;
  var video_locality;
  var video_tag;
  var video_category;

  Videos({
    this.id,
    this.user_id,
    this.video_thumb_image,
    this.video_file,
    this.video_title,
    this.video_description,
    this.state_id,
    this.citi_id,
    this.video_locality,
    this.video_tag,
    this.video_category,
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      id: json['id'],
      user_id: json['user_id'],
      video_thumb_image: json['video_thumb_image'],
      video_file: json['video_file'],
      video_title: json['video_title'],
      video_description: json['video_description'],
      state_id: json['state_id'],
      citi_id: json['citi_id'],
      video_locality: json['video_locality'],
      video_tag: json['video_tag'],
      video_category: json['video_category'],
    );
  }
}

class VideosCell extends StatefulWidget {
  int countValue = 0;
  VideosCell(this.cellModel);
  @required
  final Videos cellModel;

  @override
  _VideosCellState createState() => _VideosCellState(this.cellModel);
}

class _VideosCellState extends State<VideosCell> {
  int countValue = 0;

  _VideosCellState(this.cellModel);
  @required
  final Videos cellModel;

  static Container homeGrid(AsyncSnapshot<List<Videos>> snapshot, context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2,
      height: size.height / 2,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return VideosCell(
            snapshot.data[index],
          );
        },
      ),
    );
  }

  static Center circularProgress() {
    return Center(
      child: SizedBox(
        height: 50.0,
        width: 50.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(COLORS.APP_THEME_COLOR),
        ),
      ),
    );
  }

//  _launchURL(String url) async {
//
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//  _displayDialog(BuildContext context,String url) async {
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text('Feedback'),
//
//            content:Center(
//              child:  _launchURL(url),
//            ),
//
//            actions: <Widget>[
//              new RaisedButton(
//                onPressed: (){
//                  Navigator.of(context, rootNavigator: true).pop();
//                },
//                shape: RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.red)
//                ),
//                padding: const EdgeInsets.all(8.0),
//                textColor: Colors.white,
//                color: Colors.redAccent[100],
//                child: new Text("Ok"),
//              )
//            ],
//          );
//        });
//  }
  static Center retryButton(Function fetch) {
    return Center(
      child: FlatButton(
        child: Text(
          MESSAGES.INTERNET_ERROR_RETRY,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        onPressed: () => fetch(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Color color2 = HexColor(cellModel.color);
//    bool _visible = false;
//    if(!["", null].contains(cellModel.doc))
//    {
//      _visible=true;
//    }
//    else
//      _visible=false;
//    colorFlag = !colorFlag;

    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Center(
//                                        heightFactor: 5,
                child: InkWell(
                  onTap: () {
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(builder: (context) => new VideoPage(youtubeLink: cellModel.youtube_link)));
                  },
                  child: Container(
//                    width: 150,
//                    height: MediaQuery.of(context).size.height/3,
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(cellModel
                                                    .video_thumb_image
                                                    .toString()))
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    child: Image.network(
                                                      cellModel
                                                          .video_thumb_image
                                                          .toString(),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      fit: BoxFit.fill,
                                                    ))
                                                : Image.asset(
                                                    "assets/images/logo_splash.png",
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                  ),
                                            Center(
                                              child: Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 10, 0),
                                                child: Center(
                                                  child: Container(
                                                      width: 75.0,
                                                      height: 75.0,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: (![
                                                              "",
                                                              null,
                                                              false,
                                                              0,
                                                            ].contains(cellModel
                                                                    .video_thumb_image
                                                                    .toString()))
                                                                ? NetworkImage(
                                                                    cellModel
                                                                        .video_thumb_image
                                                                        .toString(),
                                                                  )
                                                                : AssetImage(
                                                                    "assets/images/logo_splash.png",
                                                                  ),
                                                          ))),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            (![
                                                              "",
                                                              null,
                                                              false,
                                                              0,
                                                            ].contains(cellModel
                                                                    .video_title
                                                                    .toString()))
                                                                ? cellModel
                                                                    .video_title
                                                                    .toString()
                                                                : "Channel name",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 16,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                0.0,
                                                                0.0),
                                                        child: Align(
                                                          child: new Text(
                                                            (![
                                                              "",
                                                              null,
                                                              false,
                                                              0,
                                                            ].contains(cellModel
                                                                    .video_description
                                                                    .toString()))
                                                                ? cellModel
                                                                    .video_description
                                                                    .toString()
                                                                : "Description",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                          ),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
//                                          Expanded(
//                                            child: Padding(
//                                              padding:
//                                                  const EdgeInsets.fromLTRB(
//                                                      0, 10, 0, 10),
//                                              child: Center(
//                                                  child: GestureDetector(
//                                                onTap: () {},
//                                                child: Padding(
//                                                  padding:
//                                                      const EdgeInsets.fromLTRB(
//                                                          0, 0, 0, 0),
//                                                  child: Card(
//                                                    child: Container(
//                                                      decoration:
//                                                          new BoxDecoration(
//                                                        color: Color(0xff00adef),
//                                                        borderRadius:
//                                                            new BorderRadius
//                                                                .circular(50),
//                                                      ),
////                          height: 40.0, // height of the button
////                                      width: 120.0, // width of the button
//                                                      child: Center(
//                                                          child: Row(
//                                                        mainAxisAlignment:
//                                                            MainAxisAlignment
//                                                                .center,
//                                                        children: <Widget>[
//                                                          Padding(
//                                                            padding: EdgeInsets
//                                                                .fromLTRB(
//                                                                    5, 5, 5, 5),
//                                                            child: Icon(
//                                                              Icons
//                                                                  .play_circle_outline,
//                                                              color:
//                                                                  Colors.white,
//                                                              size: 20,
//                                                            ),
//                                                          ),
//                                                          Expanded(
//                                                            child: Padding(
//                                                              padding:
//                                                                  EdgeInsets
//                                                                      .fromLTRB(
//                                                                          0,
//                                                                          5,
//                                                                          5,
//                                                                          5),
//                                                              child: Text(
//                                                                'Subsrcibed',
//                                                                style: TextStyle(
//                                                                    fontFamily:
//                                                                        'Helvetica Neue',
//                                                                    fontSize:
//                                                                        18,
//                                                                    color: Colors
//                                                                        .white,
//                                                                    fontWeight:
//                                                                        FontWeight
//                                                                            .w400),
//                                                              ),
//                                                            ),
//                                                          )
//                                                        ],
//                                                      )),
//                                                    ),
////                                    elevation: 5,
//                                                    shape:
//                                                        RoundedRectangleBorder(
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              40.0),
//                                                    ),
//                                                  ),
//                                                ),
//                                              )),
//                                            ),
//                                          ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 20, 5, 20),
                                                  child: Icon(
                                                    Icons.notifications,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/background.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             borderRadius: BorderRadius.circular(10.0),
//                                           ),
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
                        )),
                  ),
                ),
              ),
            ],
          )),
      onTap: () {
//        Navigator.of(context).push(
//            new MaterialPageRoute(builder: (context) => new VideoPage(youtubeLink: cellModel.youtube_link)));
      },
    );
  }
}

class MyRoute {
  final Widget page;

  MyRoute({this.page});
}
