import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:we_watch_app/video_play_detail.dart';

import 'conts/config.dart';

class Category {
  int id;
  String name;
  int category_id;

  Category({this.id, this.name, this.category_id});

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      id: parsedJson["id"],
      name: parsedJson["name"] as String,
      category_id: parsedJson["category_id"],
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isHomeDataLoading = false;
  SharedPreferences prefs;
  bool countValue = false, countValue1 = false;
  List<FlickManager> flickManagerSearch;//=new List();
  int doLogin;
  ScrollController scrollController = new ScrollController();
  bool searchApiCalled=true;
  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  final TextEditingController _emailFilter = new TextEditingController();
  String _search = "";
  static int pageCount;
  bool moreDataLoading;

  List<Quotes> students = new List<Quotes>();
  void  getQuotes( String text, String city, String state, String category) async {
    //students.clear();

    prefs = await SharedPreferences.getInstance();
    print("here");
    String access_token = prefs.getString('access_token');
    String login_url =
        "https://wewatch.in/wewatch-up/api/v1/video-search?search=" +
            _emailFilter.text.toString()+"&page="+pageCount.toString()+"&filter_by_video_category="+category;
    // "+&page=1&filter_by_state=" +
    // state +
    // "&filter_by_city=" +
    // city;

    var response = await http.get(login_url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    });
    try {
      if (response.statusCode == 200) {
        //print("Ankit" + body.toString());
        print('submitting to backend...');
        Map<String, dynamic> decodedMap = jsonDecode(response.body);
        //Map<String, dynamic> decodedMapAttachment = jsonDecode(response.body);
        //var body = await json.decode(response.body);
        pageCount++;
        searchApiCalled=true;
        List<dynamic> dynamicList = decodedMap['data']['results'];
        List<Quotes> quotes=List();

        dynamicList.forEach((f) {
          Quotes s = Quotes.fromJson(f);
          quotes.add(s);
          flickManagerSearch.add(new FlickManager(
              videoPlayerController:
              VideoPlayerController.network(![
                "",
                null
              ].contains(s.video_file)
                  ? s.video_file
                  : s.video_file,),
              autoInitialize: true,
              autoPlay: false));
        });

        setState(() {
          students.addAll(quotes);
          moreDataLoading=false;
        });
        //return students;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(e);
    }
//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moreDataLoading=true;
    pageCount=1;
    flickManagerSearch=new List();
    checkFirstSeen();
    getVehical('type');
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(searchApiCalled) {
          setState(() {
            moreDataLoading=true;
          });
          searchApiCalled=false;
          getQuotes("", "", "", "");
        }
      }
    });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await DefaultCacheManager().emptyCache();
    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      doLogin = 1;
    } else {
      doLogin = 0;
    }

//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
  }

  String serachText;
  void getVehical(String type) async {
    prefs = await SharedPreferences.getInstance();
    var response = await http
        .get('https://wewatch.in/wewatch-up/api/v1/categories', headers: {
      'Content-Type': 'application/json',
    });

    //Simulate a service call
    print('submitting to backend...');

    try {
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> decodedMap = jsonDecode(response.body);
        var body =  json.decode(response.body);
        List<dynamic> dynamicList = decodedMap['data']['results'];
        List<Category> students1 = new List<Category>();
        dynamicList.forEach((f) {
          Category s = Category.fromJson(f);
          students1.add(s);
        });
        setState(() {
          categoryList.addAll(students1);
        });
        //return students1;
        getQuotes("", "", "", "");

      } else {
        throw Exception("MESSAGES.INTERNET_ERROR");
      }
    } catch (e) {
      throw Exception(e);
    }
//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
  }

  int _selectedIndex = -1;
  bool isBotttomVisible = false;

  _onSelected(int index) async{
    await DefaultCacheManager().emptyCache();
    setState(() => _selectedIndex = index);
  }
  List<Category> categoryList=new List();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios, color: Colors.white),
         onPressed: () async{
           await DefaultCacheManager().emptyCache();
           Navigator.of(context).pop();
         },
       ),
        backgroundColor: Color(0xff00adef),
        centerTitle: true,


        title: Text('Search'),
        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.notifications),
//              onPressed: () {
////                Navigator.of(context).pop();
//              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xfff4f0e5),
          ),
          ListView(
            controller: scrollController,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child:
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        border: Border.all(
                          color: Color(0xff00adef),
                          width: 1,
                        )),
                    child:categoryList.length>0 ?ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:categoryList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: _selectedIndex != null &&
                                  _selectedIndex == index
                                  ? Color(0xff00adef)
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8, 3, 8, 3),
                                child: Text(
                                  !["", null, false, 0].contains(
                                      categoryList[index].name)
                                      ? categoryList[index].name
                                      : " ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      _selectedIndex != null &&
                                          _selectedIndex ==
                                              index
                                          ? Colors.white
                                          : Color(0xff00adef)),
                                ),
                              ),
                            )),
                        onTap: () {
                          _onSelected(index);
                          print("val==="+categoryList[index].name.toString());

                          pageCount=1;
                          setState(() {
                            students.clear();
                            flickManagerSearch.clear();
                            moreDataLoading=true;
                          });
                          getQuotes(
                              _emailFilter.text,
                              prefs.getString('city'),
                              prefs.getString('state'),
                              categoryList[index].name.toString());
                        });
                  },
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                ):Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ), )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Color(0xff00adef),
                    accentColor: Color(0xff00adef),
                    hintColor: Color(0xff00adef),
                  ),
                  child: new TextField(
                    controller: _emailFilter,
                    decoration: InputDecoration(
                      focusColor: Color(0xff00adef),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter video name',
                      suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                students.clear();
                                moreDataLoading=true;
                              });
                              pageCount=1;
                              getQuotes(_emailFilter.text, prefs.getString('city'),
                                  prefs.getString('state'), "");
                            }
                            ,icon: Icon(Icons.search)),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff00adef)),
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                    onChanged: (text) {
                     // setState(() {
                        serachText=text;
                        //getQuotes(text, prefs.getString('city'),prefs.getString('state'), "");
                     // });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //controller: scrollController,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      countValue = students[index].is_like;
                      countValue1 = students[index].is_like;
                      //await _controllers[initIndex].setLooping(true);

                      return GestureDetector(
                        child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(0, 5, 5, 5),
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0, 0, 0),
                                      child: Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),

//                                    decoration: BoxDecoration(
//                                      image:
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
                                            color: Colors.transparent,
                                          ),

                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    2, 2, 2, 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 10, 10),
                                                      child: Center(
                                                        child: Container(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    5.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                image:
                                                                DecorationImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: (![
                                                                    "",
                                                                    null,
                                                                    false,
                                                                    0,
                                                                  ].contains(students[index].video_thumb_image))
                                                                      ? NetworkImage(
                                                                    students[index].video_thumb_image,
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
                                                        const EdgeInsets
                                                            .all(4.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                              child: Align(
                                                                child:
                                                                new Text(
                                                                  (![
                                                                    "",
                                                                    null,
                                                                    false,
                                                                    0,
                                                                  ].contains(students[
                                                                  index]
                                                                      .video_title))
                                                                      ? students[index]
                                                                      .video_title
                                                                      : "Video title",
                                                                  style:
                                                                  TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                    13,
                                                                    letterSpacing:
                                                                    0,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                  ),
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                                ),
                                                                alignment:
                                                                Alignment
                                                                    .centerLeft,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  4.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child:
                                                                    Align(
                                                                      child:
                                                                      new Text(
                                                                        (![
                                                                          "",
                                                                          null,
                                                                          false,
                                                                          0,
                                                                        ].contains(students[index].reporter_name))
                                                                            ? students[index].reporter_name + " | "
                                                                            : "Video title | ",
                                                                        style:
                                                                        TextStyle(
                                                                          color:
                                                                          Colors.black,
                                                                          fontSize:
                                                                          11,
                                                                          letterSpacing:
                                                                          0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                                      ),
                                                                      alignment:
                                                                      Alignment.centerLeft,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child:
                                                                    Align(
                                                                      child:
                                                                      new Text(
                                                                        (![
                                                                          "",
                                                                          null,
                                                                          false,
                                                                          0,
                                                                        ].contains(students[index].video_locality))
                                                                            ? students[index].video_locality + ", "
                                                                            : "Video title, ",
                                                                        style:
                                                                        TextStyle(
                                                                          color:
                                                                          Colors.black,
                                                                          fontSize:
                                                                          10.6,
                                                                          letterSpacing:
                                                                          0,
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                                      ),
                                                                      alignment:
                                                                      Alignment.centerLeft,
                                                                    ),
                                                                  ),

//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                              child: Align(
                                                                child:
                                                                new Text(
                                                                  (![
                                                                    "",
                                                                    null,
                                                                    false,
                                                                    0,
                                                                  ].contains(students[
                                                                  index]
                                                                      .posted_time))
                                                                      ? students[index].posted_date +
                                                                      " | " +
                                                                      "Posted at " +
                                                                      students[index].posted_time
                                                                      : "NA",
                                                                  style:
                                                                  TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                    11,
                                                                    letterSpacing:
                                                                    0,
                                                                  ),
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                                ),
                                                                alignment:
                                                                Alignment
                                                                    .centerLeft,
                                                              ),
                                                            ),
//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
//                                Center(
//                                  child: Padding(
//                                    padding: EdgeInsets.all(20),
//                                    child: Image.asset(
//                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                      fit: BoxFit.fill,
//                                    ),
//                                  ),
//                                ),
                                                  ],
                                                ),
                                              ),

                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VideoPlay(
                                                              id: students[index]
                                                                  .id
                                                                  .toString(),
                                                              user_id: students[index]
                                                                  .user_id
                                                                  .toString(),
                                                              citi_id: students[index]
                                                                  .citi_id
                                                                  .toString(),
                                                              state_id: students[index]
                                                                  .state_id
                                                                  .toString(),
                                                              video_category: students[index]
                                                                  .video_category
                                                                  .toString(),
                                                              video_description: students[index]
                                                                  .video_description
                                                                  .toString(),
                                                              video_file: students[index]
                                                                  .video_file
                                                                  .toString(),
                                                              video_locality: students[index]
                                                                  .video_locality
                                                                  .toString(),
                                                              video_tag: students[index]
                                                                  .video_tag
                                                                  .toString(),
                                                              video_thumb_image: students[index]
                                                                  .video_thumb_image
                                                                  .toString(),
                                                              video_title: students[index]
                                                                  .video_title
                                                                  .toString(),
                                                              like_count: students[index]
                                                                  .total_likes,
                                                              dislike_count:
                                                              students[
                                                              index]
                                                                  .total_dislikes,
                                                              comments_count:
                                                              students[
                                                              index]
                                                                  .total_comments,
                                                              islike: students[index]
                                                                  .is_like,
                                                              date: students[index]
                                                                  .posted_date,
                                                              time: students[index]
                                                                  .posted_time,
                                                              reporter_name:
                                                              students[
                                                              index]
                                                                  .reporter_name,
                                                            )),
                                                  );
                                                },
                                                child: Stack(
                                                  alignment:
                                                  AlignmentDirectional
                                                      .center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.fromLTRB(
                                                          2, 0, 2, 0),
                                                      child: Container(
                                                          height: 300,
//                width: 100,
                                                          child:
                                                          VisibilityDetector(
                                                            key: ObjectKey(flickManagerSearch),
                                                            onVisibilityChanged: (visibility) {
                                                              if (visibility.visibleFraction == 0 && this.mounted) {
                                                                flickManagerSearch[index].flickControlManager
                                                                    .pause();
                                                              } else if (visibility.visibleFraction ==1) {
                                                                flickManagerSearch[index].flickControlManager
                                                                    .pause();
                                                              }
                                                            },
                                                            child: Container(
                                                              child: FlickVideoPlayer(
                                                                flickManager: flickManagerSearch[index],
                                                                flickVideoWithControls:
                                                                FlickVideoWithControls(
                                                                  controls: FlickPortraitControls(),
                                                                ),
                                                                flickVideoWithControlsFullscreen:
                                                                FlickVideoWithControls(
                                                                  controls: FlickLandscapeControls(),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),

//                          ChewieListItem(
//                            videoPlayerController: VideoPlayerController.network(
//                              cellModel.video_file,
//                            ),
//                          ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    0, 5, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Expanded(
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (doLogin == 1) {
                                                              setState(() {
                                                                // if(countValue){
                                                                //   countValue=false;
                                                                //   countValue1=true;
                                                                // }
                                                                if (!countValue) {
                                                                  countValue =true;
                                                                  countValue1 =false;
                                                                  saveLike( students[ index].id.toString(),"1");
                                                                  students[index]
                                                                      .total_likes = students[
                                                                  index]
                                                                      .total_likes +
                                                                      1;
                                                                  if (students[
                                                                  index]
                                                                      .total_dislikes >
                                                                      0) {
                                                                    students[
                                                                    index]
                                                                        .total_dislikes = students[
                                                                    index]
                                                                        .total_dislikes -
                                                                        1;
                                                                  }
                                                                }
                                                              });
                                                            }

                                                            if (doLogin == 0) {}
                                                          },
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      height: 15,
                                                                      width: 15,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                                      ),
                                                                      child:
                                                                      Center(
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.all(0),
                                                                          child: Image
                                                                              .asset(
                                                                            "assets/images/like_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                            color: countValue
                                                                                ? Color(0xff00adef)
                                                                                : Colors.grey,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                                  child: Align(
                                                                    child:
                                                                    new Text(
                                                                      !["",null
                                                                      ].contains(students[index]
                                                                          .total_likes
                                                                          .toString())
                                                                          ? students[index].total_likes.toString() +
                                                                          ' Likes'
                                                                          : '0 Likes',
                                                                      style:
                                                                      TextStyle(
                                                                        color: Color(
                                                                            0xff444b69),
                                                                        fontSize:
                                                                        13,
                                                                        letterSpacing:
                                                                        0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (doLogin == 1) {
                                                              setState(() {
                                                                // if(countValue1){
                                                                //   countValue1=false;
                                                                //   countValue=true;
                                                                // }
                                                                if (!countValue1) {
                                                                  countValue1 =
                                                                  true;
                                                                  countValue =
                                                                  false;

                                                                  saveLike(
                                                                      students[
                                                                      index]
                                                                          .id
                                                                          .toString(),
                                                                      "0");
                                                                  students[index]
                                                                      .total_dislikes = students[
                                                                  index]
                                                                      .total_dislikes +
                                                                      1;
                                                                  if (students[
                                                                  index]
                                                                      .total_likes >
                                                                      0) {
                                                                    students[
                                                                    index]
                                                                        .total_likes = students[
                                                                    index]
                                                                        .total_likes -
                                                                        1;
                                                                  }
                                                                }
                                                              });
                                                            } else {}
                                                          },
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                  child: Center(
                                                                    child:
                                                                    Container(
                                                                      height: 15,
                                                                      width: 15,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                                      ),
                                                                      child:
                                                                      Center(
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.all(0),
                                                                          child: Image.asset(
                                                                              "assets/images/dislike_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                                              fit: BoxFit
                                                                                  .fill,
                                                                              color: countValue1
                                                                                  ? Color(0xff00adef)
                                                                                  : Colors.grey),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                                  child: Align(
                                                                    child:
                                                                    new Text(
                                                                      ![
                                                                        "",
                                                                        null
                                                                      ].contains(students[
                                                                      index]
                                                                          .total_dislikes
                                                                          .toString())
                                                                          ? students[index].total_dislikes.toString() +
                                                                          ' Dislikes'
                                                                          : '0 Dislike',
                                                                      style:
                                                                      TextStyle(
                                                                        color: Color(
                                                                            0xff444b69),
                                                                        fontSize:
                                                                        13,
                                                                        letterSpacing:
                                                                        0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            5, 10, 5, 10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              child: Center(
                                                                child:
                                                                Container(
                                                                  height: 15,
                                                                  width: 15,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                                  ),
                                                                  child:
                                                                  Center(
                                                                    child:
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets.all(0),
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/images/comments.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                              child: Align(
                                                                child:
                                                                new Text(
                                                                  [
                                                                    "",
                                                                    null
                                                                  ].contains(students[
                                                                  index]
                                                                      .total_comments
                                                                      .toString())
                                                                      ?students[index].total_comments.toString() +
                                                                      'Comments'
                                                                      : '0 Comments',
                                                                  style:
                                                                  TextStyle(
                                                                    color: Color(
                                                                        0xff444b69),
                                                                    fontSize:
                                                                    13,
                                                                    letterSpacing:
                                                                    0,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                  ),
                                                                  textAlign:
                                                                  TextAlign
                                                                      .center,
                                                                ),
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(10),
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            Share.share(
                                                              students[index]
                                                                  .state_id,
                                                              subject: students[index]
                                                                  .video_title,
                                                            );
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: <
                                                                Widget>[
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                child: Center(
                                                                  child:
                                                                  Container(
                                                                    height:
                                                                    15,
                                                                    width: 15,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                      BorderRadius.all(Radius.circular(30)),
//                                            border: Border.all(
//                                                                   width: 0,
//                                                                   color: Colors
//                                                                       .lightBlue,
//                                                                   style:
//                                                                   BorderStyle
//                                                                       .solid)
                                                                    ),
                                                                    child:
                                                                    Center(
                                                                      child:
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.all(0),
                                                                        child:
                                                                        Image.asset(
                                                                          "assets/images/share_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                                          fit:
                                                                          BoxFit.fill,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                                child: Align(
                                                                  child:
                                                                  new Text(
                                                                    'Share',
                                                                    style:
                                                                    TextStyle(
                                                                      color: Color(
                                                                          0xff444b69),
                                                                      fontSize:
                                                                      13,
                                                                      letterSpacing:
                                                                      0,
                                                                      fontWeight:
                                                                      FontWeight.w400,
                                                                    ),
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                  ),
                                                                  alignment:
                                                                  Alignment
                                                                      .center,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if(students.length==1)
                                      SizedBox(
                                        height: 10,
                                      )
                                  ],
                                ),
//              Center(
////                                        heightFactor: 5,
//                child: InkWell(
//                  onTap: () {
//
//
//                  },
//                  child: Container(
//
//                    margin: EdgeInsets.all(10.0),
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        child: Stack(
//                          alignment: Alignment.center,
//                          children: <Widget>[
//                            Center(
//                              child: Align(
//                                alignment: FractionalOffset.center,
//                                child: Container(
//                                  height: MediaQuery.of(context).size.height/3,
//                                  width: MediaQuery.of(context).size.width,
////                                  width: SizeConfig.heightMultiplier * 30,
////                                  height: SizeConfig.heightMultiplier * 50,
//                                  decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                      image: NetworkImage(
//                                        cellModel.video_thumb_image,
//                                      ),
//                                      fit: BoxFit.fill,
//                                    ),
//                                    borderRadius: BorderRadius.circular(20.0),
//                                  ),
//
//                                ),
//                              ),
//                            ),
//
//
//                          ],
//                        )),
//                  ),
//                ),
//              ),
                              ],
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlay(
                                  id: students[index].id
                                      .toString(),
                                  user_id: students[index].user_id
                                      .toString(),
                                  citi_id: students[index].citi_id
                                      .toString(),
                                  state_id: students[index].state_id
                                      .toString(),
                                  video_category: students[index].video_category
                                      .toString(),
                                  video_description: students[index].video_description
                                      .toString(),
                                  video_file: students[index].video_file
                                      .toString(),
                                  video_locality: students[index].video_locality
                                      .toString(),
                                  video_tag: students[index].video_tag
                                      .toString(),
                                  video_thumb_image: students[index].video_thumb_image
                                      .toString(),
                                  video_title: students[index].video_title
                                      .toString(),
                                  like_count: students[index].total_likes,
                                  dislike_count: students[index].total_dislikes,
                                  comments_count: students[index].total_comments,
                                  islike:
                                  students[index].is_like,
                                  date: students[index].posted_date,
                                  time: students[index].posted_time,
                                  reporter_name: students[index].reporter_name,
                                  channel_id:
                                  students[index].channel_id,
                                  channel_name: students[index].channel_name,
                                  is_subscribed: students[index].is_subscribed,
                                  subscriber_count: students[index].subscriber_count,
                                  total_views: students[index].total_views,
                                )),
                          );
                          // setState(() => countValue == 0 ? countValue = 1 : countValue = 0);
                          // Grid Click
                        },
                      );
                    },
                  ),
                ),
              ),
              moreDataLoading? Center(
                  child: CupertinoActivityIndicator(radius: 16.0,)
              ):Container()
            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() async{
    // TODO: implement dispose
    await DefaultCacheManager().emptyCache();
    super.dispose();
  }
}

class Quotes {
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
  var posted_date;
  var posted_time;
  var is_like;
  var reporter_name;
  var total_likes, total_dislikes, total_comments;
  var channel_id;
  var is_subscribed;
  int subscriber_count;
  var channel_name;
  int total_views;
  Quotes({
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
    this.posted_date,
    this.posted_time,
    this.is_like,
    this.reporter_name,
    this.total_likes,
    this.total_dislikes,
    this.total_comments,
    this.channel_id,
    this.is_subscribed,
    this.channel_name,
    this.subscriber_count,
    this.total_views,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id'],
      user_id: json['user_id'],
      video_thumb_image: json['video_thumb_image'],
      video_file: json['video_file'],
      video_title: json['video_title'],
      video_description: json['video_description'],
      state_id: json['sharing_content'],
      citi_id: json['citi_id'],
      video_locality: json['location'],
      video_tag: json['video_tag'],
      video_category: json['video_category'],
      posted_date: json['posted_date'],
      posted_time: json['posted_time'],
      is_like: json['is_like'],
      reporter_name: json['reporter_name'],
      total_likes: json['total_likes'],
      total_dislikes: json['total_dislikes'],
      total_comments: json['total_comments'],
      channel_id: json['channel_id'],
      is_subscribed: json['is_subscribed'],
      subscriber_count: json['subscriber_count'],
      channel_name: json['channel_name'],
      total_views: json['total_views'],
    );
  }
}

class QuotesCell extends StatefulWidget {
  int countValue = 0;
  QuotesCell(this.cellModel);
  @required
  final Quotes cellModel;

  @override
  _QuotesCellState createState() => _QuotesCellState(this.cellModel);
}

class _QuotesCellState extends State<QuotesCell> {
  bool countValue = false, countValue1 = false;
  FlickManager flickManager;

  _QuotesCellState(this.cellModel);
  @required
  final Quotes cellModel;

  VideoPlayerController _controller;

  @override
  void initState() {

    super.initState();
    countValue = cellModel.is_like;
    countValue1 = cellModel.is_like;
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.network(
    //         !["", null].contains(cellModel.video_file)
    //             ? cellModel.video_file
    //             : '  '),
    //     autoPlay: false);
  }


  @override
  void dispose() {
    flickManager.flickControlManager.dispose();
    flickManager.dispose();
    super.dispose();
  }

  static Container homeGrid(AsyncSnapshot<List<Quotes>> snapshot, context) {
    Size size = MediaQuery.of(context).size;

    return Container(
//      height: double.infinity,
//      width: double.infinity,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return QuotesCell(
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
          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),

//                                    decoration: BoxDecoration(
//                                      image:
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
                      color: Colors.transparent,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Center(
                                  child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(cellModel
                                                    .video_thumb_image))
                                                ? NetworkImage(
                                                    cellModel.video_thumb_image,
                                                  )
                                                : AssetImage(
                                                    "assets/images/logo_splash.png",
                                                  ),
                                          ))),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(cellModel.video_title))
                                                ? cellModel.video_title
                                                : "Video title",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  (![
                                                    "",
                                                    null,
                                                    false,
                                                    0,
                                                  ].contains(cellModel
                                                          .reporter_name))
                                                      ? cellModel
                                                              .reporter_name +
                                                          " | "
                                                      : "Video title | ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                              child: Align(
                                                child: new Text(
                                                  (![
                                                    "",
                                                    null,
                                                    false,
                                                    0,
                                                  ].contains(cellModel
                                                          .video_locality))
                                                      ? cellModel
                                                              .video_locality +
                                                          ", "
                                                      : "Video title, ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    letterSpacing: 0,
                                                  ),
                                                  textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                ),
                                                alignment: Alignment.centerLeft,
                                              ),
                                            ),

//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(cellModel.posted_time))
                                                ? cellModel.posted_date +
                                                    " | " +
                                                    "Posted at " +
                                                    cellModel.posted_time
                                                : "NA",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              letterSpacing: 0,
                                            ),
                                            textAlign: TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 5.0, 0.0, 0.0),
//                                         child: Align(
//                                           child: new Text(
//                                             (!["", null, false, 0,].contains(cellModel.video_description)) ? cellModel.video_description +"| New Delhi | 15th Sep 2020 | Posted at 12:05 pm" : "Video title",
//                                             style: TextStyle(
//
//                                               color: Colors.black,
//                                               fontSize: 11,
//                                               letterSpacing: 0,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             textAlign: TextAlign.left,
// //                                              textDirection:
// //                                              TextDirection.ltr,
//                                           ),
//                                           alignment: Alignment.centerLeft,
//                                         ),
//                                       ),
                                    ],
                                  ),
                                ),
                              ),
//                                Center(
//                                  child: Padding(
//                                    padding: EdgeInsets.all(20),
//                                    child: Image.asset(
//                                      "assets/images/three_dots.png",
////                                                           height: 50.0,
////                                                           width: 50.0,
//                                      fit: BoxFit.fill,
//                                    ),
//                                  ),
//                                ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlay(
                                        id: cellModel.id.toString(),
                                        user_id: cellModel.user_id.toString(),
                                        citi_id: cellModel.citi_id.toString(),
                                        state_id: cellModel.state_id.toString(),
                                        video_category:
                                            cellModel.video_category.toString(),
                                        video_description: cellModel
                                            .video_description
                                            .toString(),
                                        video_file:
                                            cellModel.video_file.toString(),
                                        video_locality:
                                            cellModel.video_locality.toString(),
                                        video_tag:
                                            cellModel.video_tag.toString(),
                                        video_thumb_image: cellModel
                                            .video_thumb_image
                                            .toString(),
                                        video_title:
                                            cellModel.video_title.toString(),
                                        channel_id: cellModel.channel_id,
                                        is_subscribed: cellModel.is_subscribed,
                                        channel_name: cellModel.channel_name,
                                        subscriber_count:
                                            cellModel.subscriber_count,
                                        total_views: cellModel.total_views,
                                      )),
                            );
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Container(
                                    height: 300,
//                width: 100,
                                    child: VisibilityDetector(
                                      key: ObjectKey(flickManager),
                                      onVisibilityChanged: (visibility) {
                                        if (visibility.visibleFraction == 0 && this.mounted) {
                                          flickManager.flickControlManager
                                              .pause();
                                        } else if (visibility.visibleFraction ==
                                            1) {
                                          flickManager.flickControlManager
                                              .play();
                                        }
                                      },
                                      child: Container(
                                        child: FlickVideoPlayer(
                                          flickManager: flickManager,
                                          flickVideoWithControls:
                                              FlickVideoWithControls(
                                            controls: null,
                                          ),
                                          flickVideoWithControlsFullscreen:
                                              FlickVideoWithControls(
                                            controls: FlickLandscapeControls(),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),

//                          ChewieListItem(
//                            videoPlayerController: VideoPlayerController.network(
//                              cellModel.video_file,
//                            ),
//                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (countValue) {
                                      countValue = false;
                                      countValue1 = true;
                                    }
                                    if (!countValue) {
                                      countValue = true;
                                      countValue1 = false;
                                    }
                                  });
                                  saveLike(cellModel.id.toString(), "1");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
//                                            border: Border.all(
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
                                                  "assets/images/like_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                  fit: BoxFit.fill,
                                                  color: countValue
                                                      ? Color(0xff00adef)
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            ["", null].contains(cellModel
                                                    .total_likes
                                                    .toString())
                                                ? cellModel.total_likes
                                                        .toString() +
                                                    'Likes'
                                                : '0 Likes',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (countValue1) {
                                      countValue1 = false;
                                      countValue = true;
                                    }
                                    if (!countValue1) {
                                      countValue1 = true;
                                      countValue = false;
                                    }
                                  });
                                  saveLike(cellModel.id.toString(), "0");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
//                                            border: Border.all(
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
                                                    "assets/images/dislike_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                    fit: BoxFit.fill,
                                                    color: countValue1
                                                        ? Color(0xff00adef)
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            ["", null].contains(cellModel
                                                    .total_dislikes
                                                    .toString())
                                                ? cellModel.total_dislikes
                                                        .toString() +
                                                    'Dislikes'
                                                : '0 Dislike',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Center(
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
//                                            border: Border.all(
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
                                                  "assets/images/comments.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Align(
                                          child: new Text(
                                            !["", null].contains(cellModel
                                                    .total_comments
                                                    .toString())
                                                ? cellModel.total_comments
                                                        .toString() +
                                                    'Comments'
                                                : '0 Comments',
                                            style: TextStyle(
                                              color: Color(0xff444b69),
                                              fontSize: 13,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Share.share(
                                        cellModel.video_file,
                                        subject: cellModel.video_title,
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Center(
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
//                                            border: Border.all(
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
                                                    "assets/images/share_grey.png",
//                                              height: 150.0,
//                                              width: 50.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          child: Align(
                                            child: new Text(
                                              'Share',
                                              style: TextStyle(
                                                color: Color(0xff444b69),
                                                fontSize: 13,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
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
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
//              Center(
////                                        heightFactor: 5,
//                child: InkWell(
//                  onTap: () {
//
//
//                  },
//                  child: Container(
//
//                    margin: EdgeInsets.all(10.0),
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        child: Stack(
//                          alignment: Alignment.center,
//                          children: <Widget>[
//                            Center(
//                              child: Align(
//                                alignment: FractionalOffset.center,
//                                child: Container(
//                                  height: MediaQuery.of(context).size.height/3,
//                                  width: MediaQuery.of(context).size.width,
////                                  width: SizeConfig.heightMultiplier * 30,
////                                  height: SizeConfig.heightMultiplier * 50,
//                                  decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                      image: NetworkImage(
//                                        cellModel.video_thumb_image,
//                                      ),
//                                      fit: BoxFit.fill,
//                                    ),
//                                    borderRadius: BorderRadius.circular(20.0),
//                                  ),
//
//                                ),
//                              ),
//                            ),
//
//
//                          ],
//                        )),
//                  ),
//                ),
//              ),
            ],
          )),
      onTap: () {
        // setState(() => countValue == 0 ? countValue = 1 : countValue = 0);
        // Grid Click
      },
    );
  }
}

Future saveLike(String videoId, String status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Showing CircularProgressIndicator.

  String access_token = prefs.getString('access_token');

  // Getting value from Controller
//    String email = _emailFilter.text.toString();
//    String password = _mobileFilter.text.toString();

  // SERVER LOGIN API URL
  var url = 'https://wewatch.in/wewatch-up/api/v1/likes';
  Map data = {
//      'API_KEY':"4762265654DFGDF00546FDG4FD654G6DF",
    'video_id': videoId,
    'status': status,
  };
  String formD = json.encode(data);

  // Store all data with Param Name.

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  // Starting Web API Call.
//  var response = await http.post(url, body: formD,headers: headers);
  var response = await http.post(url, body: formD, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $access_token',
  });

  // Getting Server response into variable.



  try {
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var message = jsonDecode(response.body);
      print("ffff" + message.toString());
//        otp = body["otp"];
      //prefs.setString('user_token',body['user_token'] );
//        prefs.setString('id', body['id']);
//        prefs.setString('std_id', body['std_id']);
//        prefs.setString('name', body['name']);
//        prefs.setString('designation', body['designation']);
//        prefs.setString('phone', body['phone']);
//        prefs.setString('email', body['email']);
//        prefs.setString('doj', body['doj']);
//        prefs.setString('pincode', body['pincode']);
//        prefs.setString('state', body['state']);
//        prefs.setString('address', body['address']);
//        prefs.setString('image', body['image']);
//        prefs.setString('role', body['role']);
      //  prefs.setString('image',body['image'] );
      // prefs.setString('image',body['image'] );
      // Hiding the CircularProgressIndicator.

      Fluttertoast.showToast(
          msg: body['data']['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
//                                          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff00adef),
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 422) {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.

      Fluttertoast.showToast(
          msg: "Validation Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 400) {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.

      Fluttertoast.showToast(
          msg: "Request Fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 401) {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.

      Fluttertoast.showToast(
          msg: "Authorization Failure",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 500) {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.

      Fluttertoast.showToast(
          msg: "Server Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } catch (e) {
//     Fluttertoast.showToast(
//       msg: e.toString(),
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
// //        timeInSecForIos: 1,
//     );
    throw Exception(e);
  }
  // If the Response Message is Matched.
}
