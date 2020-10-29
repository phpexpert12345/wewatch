import 'dart:convert';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:we_watch_app/conts/config.dart';
import 'package:http/http.dart' as http;
import 'package:we_watch_app/video_play_detail.dart';
class VideoHistory extends StatefulWidget {
  @override
  _VideoHistoryState createState() => new _VideoHistoryState();
}

class _VideoHistoryState extends State<VideoHistory> {
  Size deviceSize;
  var scrollController =ScrollController();
  List<Quotes> videoList = new List<Quotes>();

  bool dataLoaded;
  @override
  void initState() {
    dataLoaded=false;
    getMyVideos();
    count=1;
    super.initState();
  }

  bool noDataAvail=false;
  @override
  Widget build(BuildContext context) {
    deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: COLORS.APP_BAR_COLOR,
        title: Text("History"),
      ),
      body: SafeArea(
        //controller: scrollController,
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child:!noDataAvail?(dataLoaded? ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            controller: scrollController,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            itemCount: videoList.length,
            itemBuilder: (BuildContext context, int index) {
              return QuotesCell(
                videoList[index],
              );
            },
          ):Center(
            child: CircularProgressIndicator(),
          )):Center(
            child: Text("No videos available"),
          ),
        ),
      ),
    );
  }


  static int count;
  void getMyVideos() async {
    //if (!isLoading) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    print("token: "+access_token);
    String userID=prefs.getString("user_id");
    print("user id=="+userID);
    String url =
        "https://wewatch.in/wewatch-up/api/v1/videobyUserProfile";
    var response = await http.post(url, headers: {
      //'Content-Type': 'application/json',
      'Authorization': 'Bearer $access_token',
    },
        body: <String ,dynamic>{
          "userid" :userID
        });

    //print(response.body);

    //Simulate a service call
    print('submitting to backend...');

    //apiCalled=true;
    try {
      if (response.statusCode == 200) {
        //print("Ankit" + body.toString());
        Map<String, dynamic> decodedMap = jsonDecode(response.body);
        if(decodedMap['data']['video-list']['results']!=null && decodedMap['data']['video-list']['results'].length>0) {
          List<dynamic> dynamicList = decodedMap['data']['video-list']['results'];
          List<Quotes> tempList = new List<Quotes>();
          dynamicList.forEach((f) {
            Quotes s = Quotes.fromJson(f);
            tempList.add(s);
          });
          setState(() {
            videoList.addAll(tempList);
            dataLoaded=true;
          });
        }else{
          //if(count==1 && decodedMap['data']['video-list']['results']==null){
          if(count==1) {
            setState(() {
              noDataAvail = true;
            });
          }
          //}
          print("no more data available");
        }
        count=count+1;

      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(e);
    }
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
  int total_likes, total_dislikes, total_comments;
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
  int doLogin;
  _QuotesCellState(this.cellModel);
  @required
  final Quotes cellModel;
  FlickManager flickManager;
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countValue = cellModel.is_like;
    countValue1 = cellModel.is_like;
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            !["", null].contains(cellModel.video_file)
                ? cellModel.video_file
                : '  '),
        autoPlay: false);

    checkFirstSeen();
  }

  @override
  void dispose() {
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
                                          ),
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  alignment:
                                                  Alignment.centerLeft,
                                                ),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 0.0),
                                                  child: Align(
                                                    child: Container(
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
                                                          fontSize: 10.6,
                                                          letterSpacing: 0,
                                                        ),
                                                        textAlign:
                                                        TextAlign.left,
//                                              textDirection:
//                                              TextDirection.ltr,
                                                      ),
                                                    ),
                                                    alignment:
                                                    Alignment.centerLeft,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                    ],
                                  ),
                                ),
                              ),
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
                                    like_count: cellModel.total_likes,
                                    dislike_count: cellModel.total_dislikes,
                                    comments_count:
                                    cellModel.total_comments,
                                    islike: cellModel.is_like,
                                    date: cellModel.posted_date,
                                    time: cellModel.posted_time,
                                    reporter_name: cellModel.reporter_name,
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
                                        if (visibility.visibleFraction == 0 &&
                                            this.mounted) {
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

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (doLogin == 1) {
                                        setState(() {
                                          // if(countValue){
                                          //   countValue=false;
                                          //   countValue1=true;
                                          // }
                                          if (!countValue) {
                                            countValue = true;
                                            countValue1 = false;
                                            saveLike(cellModel.id.toString(), "1");
                                            cellModel.total_likes =
                                                cellModel.total_likes + 1;
                                            if (cellModel.total_dislikes > 0) {
                                              cellModel.total_dislikes =
                                                  cellModel.total_dislikes - 1;
                                            }
                                          }
                                        });
                                      }

                                      if (doLogin == 0) {}
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
                                                cellModel.total_likes != 0
                                                    ? cellModel.total_likes
                                                    .toString() +
                                                    ' Like'
                                                    : '0 Like',
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
                                      if (doLogin == 1) {
                                        setState(() {
                                          // if(countValue1){
                                          //   countValue1=false;
                                          //   countValue=true;
                                          // }
                                          if (!countValue1) {
                                            countValue1 = true;
                                            countValue = false;
                                            saveLike(cellModel.id.toString(), "0");
                                            cellModel.total_dislikes =
                                                cellModel.total_dislikes + 1;
                                            if (cellModel.total_likes > 0) {
                                              cellModel.total_likes =
                                                  cellModel.total_likes - 1;
                                            }
                                          }
                                        });
                                      } else {}
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
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: Image.asset(
                                                        "assets/images/dislike_grey.png",
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
                                                !["", null].contains(cellModel
                                                    .total_dislikes
                                                    .toString())
                                                    ? cellModel.total_dislikes
                                                    .toString() +
                                                    ' Dislike'
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
                                                ' Comment'
                                                : '0 Comment',
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
                                        cellModel.state_id,
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
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoPlay(
                id: cellModel.id.toString(),
                user_id: cellModel.user_id.toString(),
                citi_id: cellModel.citi_id.toString(),
                state_id: cellModel.state_id.toString(),
                video_category: cellModel.video_category.toString(),
                video_description: cellModel.video_description.toString(),
                video_file: cellModel.video_file.toString(),
                video_locality: cellModel.video_locality.toString(),
                video_tag: cellModel.video_tag.toString(),
                video_thumb_image: cellModel.video_thumb_image.toString(),
                video_title: cellModel.video_title.toString(),
                like_count: cellModel.total_likes,
                dislike_count: cellModel.total_dislikes,
                comments_count: cellModel.total_comments,
                islike: cellModel.is_like,
                date: cellModel.posted_date,
                time: cellModel.posted_time,
                reporter_name: cellModel.reporter_name,
                channel_id: cellModel.channel_id,
                is_subscribed: cellModel.is_subscribed,
                channel_name: cellModel.channel_name,
                subscriber_count: cellModel.subscriber_count,
                total_views: cellModel.total_views,
              )),
        );
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

  var body = await json.decode(response.body);
  var message = jsonDecode(response.body);

  print("ffff" + message.toString());

  try {
    if (response.statusCode == 200) {
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