import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'home_page_two.dart';

class AddVideo extends StatefulWidget {
  @override
  _AddVideoState createState() => new _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  bool isResponse = false;
  bool visible = false;
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  String gender = '', dob = '';

  bool isHomeDataLoading = false;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  String email = "", mobile = "";
  String dayString, monthString, yearString;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          gender = "male";
          correctScore++;
          break;
        case 1:
          gender = "female";
          break;
//        case 2:
//          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
//          break;
      }
    });
  }

  var first_name,
      last_name,
      response_email,
      emp_type,
      response_gender,
      mobile_number,
      date_of_birth,
      status,
      user_type,
      address,
      city_id,
      state_id,
      country_id,
      zipcode,
      image;

  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFile = imageFile;

        byteimage = imageFile.readAsBytesSync();
        base64 = base64Encode(imageFile.readAsBytesSync());
        fileName = imageFile.path.split('/').last;
        print(fileName + '------' + base64);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> captureVideo(ImageSource imageSource) async {
    try {
      var videoFile = await ImagePicker.pickVideo(source: imageSource);
//      videoFile = await videoFile.rename("${_videoFile.path}.mp4");
      setState(() {
        _videoFile = videoFile;

        bytevideo = videoFile.readAsBytesSync();
        base64video = base64Encode(videoFile.readAsBytesSync());
        fileNameVideo = videoFile.path.split('/').last;
        final letter = 'jpg';
        final newLetter = 'mp4';
        fileNameVideo = fileNameVideo.replaceAll(letter, newLetter);

        print(fileNameVideo + '------' + base64video);
      });
    } catch (e) {
      print(e);
    }
  }

  Future updateProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
    var stream = new http.ByteStream(_imageFile.openRead());
    var streamVideo = new http.ByteStream(_videoFile.openRead());
    // get file length
    var length = await _imageFile.length();
    var lengthVideo = await _videoFile.length();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/video'));
    request.fields["video_title"] = _videoTitleController.text;
    request.fields["video_description"] = _descriptionController.text;
    request.fields["video_locality"] = userLocality;
    request.fields["state_name"] = userState;
    request.fields["city_name"] = userCity;
    request.fields["pincode"]=  userPostalCode;// postal_code
    request.fields["video_tag"] = _videoTagController.text;
    request.fields["video_category"] = categoryName;
    request.files.add(await http.MultipartFile(
        'video_thumb_image', stream, length,
        filename: fileName));
    request.files.add(await http.MultipartFile(
        'video_file', streamVideo, lengthVideo,
        filename: fileNameVideo));
    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Your video uploaded successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightGreen,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Failed!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

//  Future userLogin() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String access_token=prefs.getString('access_token');
//    // Showing CircularProgressIndicator.
//    setState(() {
//      visible = true;
//    });
//
//
//
//    // Getting value from Controller
//
////    String password = _mobileFilter.text.toString();
//
//    // SERVER LOGIN API URL
//    var url =
//        'https://wewatch.in/wewatch-up/api/v1/profile';
//
//    // Store all data with Param Name.
//    FormData formData;
//
//    if (Platform.isIOS) {
//      formData = new FormData.from({
//        "first_name": 'upen',
//        "last_name": "singh",
//        "image": byteimage,
//        "address": "noida",
//        "state_id": "1",
//        "city_id": "1",
//        "zipcode": "201301",
//        "gender": "male",
//        "dob": "10-05-1992",
//
//      });
//    }
//    if (Platform.isAndroid) {
//      formData = new FormData.from({
//        "first_name": 'upen',
//        "last_name": "singh",
//        "image": byteimage,
//        "address": "noida",
//        "state_id": "1",
//        "city_id": "1",
//        "zipcode": "201301",
//        "gender": "male",
//        "dob": "10-05-1992",
//      });
//    }
//    var response = await http.post(url, body: formData,headers: {
////      'Content-Type': 'multipart/form-data',
//      'Authorization': 'Bearer $access_token',
//    });
//
//
//    // Starting Web API Call.
////    var response = await http.post(url, );
//
//    // Getting Server response into variable.
//
//    var body = await json.decode(response.body);
//    var message = jsonDecode(response.body);
//
//    print("ffff" + message.toString());
//
//
//    try {
//      // open a byteStream
////      var stream = new http.ByteStream(_imageFile.openRead());
////      // get file length
////      var length = await _imageFile.length();
////
////      // string to uri
////      var uri = Uri.parse("https://wewatch.in/wewatch-up/api/v1/profile");
////
////      // create multipart request
////      var request = new http.MultipartRequest("POST", uri);
////
////      // if you need more parameters to parse, add those like this. i added "user_id". here this "user_id" is a key of the API request
////      request.fields["first_name"] = "upen";
////      request.fields["last_name"] = "singh";
////      request.fields["address"] = "noida";
////      request.fields["state_id"] = "1";
////      request.fields["city_id"] = "1";
////      request.fields["zipcode"] = "201301";
////      request.fields["gender"] = "male";
////      request.fields["dob"] = "10-05-1992";
////
////      // multipart that takes file.. here this "image_file" is a key of the API request
////      var multipartFile = new http.MultipartFile('image', stream, length ,filename: '_imageFile');
////
////      // add file to multipart
////      request.files.add(multipartFile);
////
////      // send request to upload image
////      await request.send().then((response) async {
////        // listen for response
////        response.stream.transform(utf8.decoder).listen((value) {
////          print(value);
////        });
////      });
//
//      if (response.statusCode==200) {
////        prefs.setString('access_token',body['data']['access_token'] );
////        prefs.setString('token_type',body['data']['token_type'] );
////        prefs.setInt('expires_in',body['data']['expires_in'] );
//
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
////        Fluttertoast.showToast(
////            msg: body['data']['access_token'],
////            toastLength: Toast.LENGTH_SHORT,
////            gravity: ToastGravity.CENTER,
//////            timeInSecForIosWeb: 1
////        );
////        SharedPreferences prefs = await SharedPreferences.getInstance();
////        prefs.setBool('isLogin',true);
//        // Navigate to Profile Screen & Sending Email to Next Screen.
//        Fluttertoast.showToast(
//          msg: 'Profile Updated',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) =>
//              HomePageTwo()),
//        );
//      } else if(response.statusCode==422){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Validation Fail',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }
//      else if(response.statusCode==400){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Request Fail',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }else if(response.statusCode==401){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Authorization Failure',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }else if(response.statusCode==500){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Server Error',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }
//      else{
//        Fluttertoast.showToast(
//          msg: 'Something went wrong',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//      }
//    } catch (e) {
//      Fluttertoast.showToast(
//        msg: e.toString(),
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
////        timeInSecForIosWeb: 1,
//      );
//      throw Exception(e);
//    }
//    // If the Response Message is Matched.
//  }

//  Future userLogin() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    // Showing CircularProgressIndicator.
//    setState(() {
//      visible = true;
//    });
//
//
//
//    // Getting value from Controller
//
////    String password = _mobileFilter.text.toString();
//
//    // SERVER LOGIN API URL
//    var url =
//        'https://wewatch.in/wewatch-up/api/v1/login';
//
//    // Store all data with Param Name.
//    FormData formData;
//
//    if (Platform.isIOS) {
//      formData = new FormData.from({
//        "email": 'upen11@gmail.com',
//        "password": "123456",
//
//      });
//    }
//    if (Platform.isAndroid) {
//      formData = new FormData.from({
//        "email": 'upen11@gmail.com',
//        "password": "123456",
//      });
//    }
//
//
//    // Starting Web API Call.
//    var response = await http.post(url, body: formData);
//
//    // Getting Server response into variable.
//
//    var body = await json.decode(response.body);
//    var message = jsonDecode(response.body);
//
//    print("ffff" + message.toString());
//
//
//    try {
//
//      if (response.statusCode==200) {
//        prefs.setString('access_token',body['data']['access_token'] );
//        prefs.setString('token_type',body['data']['token_type'] );
//        prefs.setInt('expires_in',body['data']['expires_in'] );
//
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
////        Fluttertoast.showToast(
////            msg: body['data']['access_token'],
////            toastLength: Toast.LENGTH_SHORT,
////            gravity: ToastGravity.CENTER,
//////            timeInSecForIosWeb: 1
////        );
////        SharedPreferences prefs = await SharedPreferences.getInstance();
//        prefs.setBool('isLogin',true);
//        // Navigate to Profile Screen & Sending Email to Next Screen.
//        Timer.run(() {
//          showDialog(
//            context: context,
//            builder: (_) =>
//                AlertDialog(
//                  shape: OutlineInputBorder(
//                      borderRadius: BorderRadius
//                          .circular(16.0)),
//                  title: Text('Hello!'),
//                  content: Wrap(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Text(
//                            'Welcome to WeWatch',
//                            style: TextStyle(
//                              color: Color(0xff00adef),
//                            ),),
//                          Spacer(),
//                          Icon(Icons.check_circle,
//                            color: Color(0xff00adef),),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//          );
//        });
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) =>
//              HomePageTwo()),
//        );
//      } else if(response.statusCode==422){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Validation Fail',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }
//      else if(response.statusCode==400){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Request Fail',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }else if(response.statusCode==401){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Authorization Failure',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }else if(response.statusCode==500){
//        // If Email or Password did not Matched.
//        // Hiding the CircularProgressIndicator.
//        setState(() {
//          visible = false;
//        });
//        Fluttertoast.showToast(
//          msg: 'Server Error',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
//        );
//
//      }
//    } catch (e) {
//      Fluttertoast.showToast(
//        msg: e.toString(),
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
////        timeInSecForIosWeb: 1,
//      );
//      throw Exception(e);
//    }
//    // If the Response Message is Matched.
//  }

  @override
  void initState() {
    super.initState();
    //getState();
    getCategory();
  }

  File _imageFile;
  File _videoFile;

  List<int> byteimage;
  List<int> bytevideo;
  String base64 = '', fileName = 'Browse File';
  String base64video = '', fileNameVideo = 'Browse File';

  bool isExpanded = false;

  Widget _buildImage() {
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else {
      return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
    }
  }

  String _mySelection, _myselection2, _categorySelection, categoryName;
  final String url =
      "http://ems.dextrousinfosolutions.com/dev-dexcrm/api/expense/Exp_category";

  // final format = DateFormat("yyyy-MM-dd HH:mm");
  String comments = '', time1 = 'Select Time', date1 = 'Select Date';
  List data = List();
  List category = List();
  List data1 = List();

  Future<String> getState() async {
    var res = await http.get(Uri.encodeFull(
        "https://wewatch.in/wewatch-up/api/v1/get_state_list?country_id=101"));
    var resBody = json.decode(res.body);

    var resBody1 = resBody['data']['results'];

    setState(() {
      data = resBody1;
    });

    print(resBody);

    return "Sucess";
  } //edited line

  Future<String> getCity() async {
    var res = await http.get(Uri.encodeFull(
        "https://wewatch.in/wewatch-up/api/v1/get_city_list?state_id=$_myselection2"));
    var resBody = json.decode(res.body);

    var resBody1 = resBody['data']['results'];

    setState(() {
      data1 = resBody1;
    });

    print(resBody);

    return "Sucess";
  } //edited line

  Future<String> getCategory() async {
    var res = await http
        .get(Uri.encodeFull("https://wewatch.in/wewatch-up/api/v1/categories"));
    var resBody = json.decode(res.body);

    var resBody1 = resBody['data']['results'];

    setState(() {
      category = resBody1;
    });

    print(resBody);

    return "Sucess";
  } //edited line

  Future<String> getCategoryByID() async {
    var res = await http.get(Uri.encodeFull(
        "https://wewatch.in/wewatch-up/api/v1/categories/${_categorySelection}"));
    var resBody = json.decode(res.body);

    String name = resBody['data']['name'];

    setState(() {
      categoryName = name;
    });

    print(resBody);

    return "Sucess";
  } //edited line

  final TextEditingController _videoTitleController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _descriptionController =
      new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController _localityController = new TextEditingController();
  final TextEditingController _videoTagController = new TextEditingController();

  String _email = "";
  String _fisrtname = "";
  String _lastname = "";
  String _dob = "";
  String _city = "";
  String _state = "";
  String _address = "";
  String _zipcode = "";

  // our default setting is to login, and we should switch to creating an account when the user chooses to

  TextStyle style1 = TextStyle(
      fontSize: 12.0, fontStyle: FontStyle.normal, color: Color(0xff444b69));
  TextStyle style11 = TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w700, color: Color(0xff444b69));
  TextStyle style2 = TextStyle(
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    color: Color(0xff444b69),
    decoration: TextDecoration.underline,
  );
  TextStyle style3 = TextStyle(
      fontSize: 12.0,
      fontStyle: FontStyle.normal,
      color: Color(0xff444b69),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);

  Widget _formRegistration(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[],
      ),
    );
  }

  Timer _timer;
  int _start = 10;

  double percentage = 0.0;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            percentage = percentage + 10;
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//    pr = new ProgressDialog(context);
//    pr.style(message: 'Please wait...');
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
            "Add Video",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                        child: SingleChildScrollView(
                            child: new Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
//                                    GestureDetector(
//                                      onTap: () {
//                                        _displayDialog(context);
//                                      },
//                                      child: Row(
//                                        children: <Widget>[
//                                          Container(
//                                              width: 75.0,
//                                              height: 75.0,
//                                              decoration: BoxDecoration(
//                                                  shape: BoxShape.circle,
//                                                  image: DecorationImage(
//                                                    fit: BoxFit.fill,
//                                                    image: (_imageFile == null)
//                                                        ? AssetImage(
//                                                      "assets/images/edit_profile_image.png",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                    )
//                                                        : FileImage(
//                                                      _imageFile,
//                                                    ),
//                                                  ))),
////                                      Container(
////                                        height: 75.0,
////                                        width: 75.0,
////                                        decoration: new BoxDecoration(
////                                          shape: BoxShape.circle,
////                                        ),
////                                        child: ClipRRect(
////                                          borderRadius: BorderRadius.circular(75.0),
////                                          child: (_imageFile==null)?Image.asset(
////                                            "assets/images/edit_profile_image.png",
//////                                              color: Colors.red,
//////                                              semanticsLabel: 'A red up arrow'
////
////
////                                          ):Image.file(_imageFile,width: 75,height: 75,
////                                          ),
////                                        ),),
////                                      Padding(
////                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
////                                        child: Container(
////                                          height: 75,
////                                          width: 75,
////                                          decoration: new BoxDecoration(
////                                            color: const Color(0xff7c94b6),
////                                            borderRadius: BorderRadius.all(const Radius.circular(75.0)),
////                                            border: Border.all(color: const Color(0xFF28324E)),),
////
////                                          child: (_imageFile==null)?Image.asset(
////                                            "assets/images/edit_profile_image.png",
//////                                              color: Colors.red,
//////                                              semanticsLabel: 'A red up arrow'
////
////
////                                          ):Image.file(_imageFile,
////                                            ),
////                                        ),
////                                      ),
//                                        ],
//                                      ),
//                                    ),

//                                Row(
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Padding(
//                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Text(
//                                          'Profile',
//                                          textAlign: TextAlign.left,
//                                          style: TextStyle(
//
//                                            color: Color(0xff444b69),
//                                            fontSize: 18,
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: new TextFormField(
                                              controller: _videoTitleController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: new InputDecoration(
                                                hintText: 'Title',
//                                                labelText: (first_name!=null)?first_name:'First Name',
                                                hintStyle: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                                  fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                                  color: Color(0xff444b69),
//                                            letterSpacing: 1
                                                ),
                                              ),
                                              style: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                                fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                                color: Color(0xff444b69),
//                                            letterSpacing: 1
                                              ),
                                              maxLines: 1,
                                              autofocus: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                new TextFormField(
                                  controller: _descriptionController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                    hintText: 'Description',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF5a6381),
                                    ),
//                                        suffixIcon: Container(
//                                          padding:
//                                          EdgeInsets.symmetric(vertical: 15),
//                                          child: SvgPicture.asset(
//                                            "assets/images/email.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                            height: 15,
//                                            width: 15,
//                                          ),
//                                        ),
                                  ),
                                  autofocus: false,
                                ),

                                SizedBox(
                                  height: 20,
                                ),

//                                 new Container(
//                                   child: new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Row(
//                                         children: <Widget>[
//                                           Expanded(
//                                             child: Column(
//                                               children: <Widget>[
//                                                 DropdownButton<String>(
//                                                   icon: Container(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             vertical: 15),
//                                                     child: SvgPicture.asset(
//                                                       "assets/images/city.svg",
// //                                              color: Colors.red,
// //                                              semanticsLabel: 'A red up arrow'
//                                                       height: 15,
//                                                       width: 15,
//                                                     ),
//                                                   ),
//                                                   iconSize: 24,
//                                                   hint: Row(
//                                                     children: <Widget>[
// //                                                      Text(
// //                                                        '*',
// //                                                        style: TextStyle(color: Colors.red),
// //                                                      ),
//                                                       Text(
//                                                         'State',
//                                                         style: TextStyle(
//                                                           color:
//                                                               Color(0xff444b69),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   isExpanded: true,
// //                                                  underline: null,
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                   items: data.map((item) {
//                                                     return new DropdownMenuItem(
//                                                       child: new Text(
//                                                         item['name'],
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.black),
//                                                       ),
//                                                       value:
//                                                           item['id'].toString(),
//                                                     );
//                                                   }).toList(),
//                                                   onChanged: (newVal) {
//                                                     setState(() {
//                                                       _myselection2 = newVal;
// //                                          int a=data1.indexOf(_myselection2);
// //                                          String s=data1.elementAt(a);
// //                                          print(_myselection2);
//                                                       _mySelection = null;
//                                                       data1.clear();
//                                                       getCity();
//                                                     });
//                                                   },
//                                                   value: _myselection2,
//                                                 ),
// //                                                new TextFormField(
// //                                                  controller: _cityController,
// //                                                  textInputAction: TextInputAction.done,
// //                                                  keyboardType: TextInputType.emailAddress,
// //                                                  decoration: new InputDecoration(
// //                                                    hintText: 'City',
// //                                                    hintStyle:  TextStyle(
// //
// //                                                      fontSize: 16.0,
// //                                                      color: Color(0xFF5a6381),),
// //                                                    suffixIcon: Container(
// //                                                      padding: EdgeInsets.symmetric(vertical: 15),
// //                                                      child: SvgPicture.asset(
// //                                                        "assets/images/city.svg",
// ////                                              color: Colors.red,
// ////                                              semanticsLabel: 'A red up arrow'
// //                                                        height: 15,
// //                                                        width: 15,
// //                                                      ),
// //                                                    ),
// //                                                  ),
// //                                                  maxLines: 1,
// //                                                  autofocus: false,
// //                                                ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               children: <Widget>[
//                                                 DropdownButton<String>(
//                                                   icon: Container(
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             vertical: 15),
//                                                     child: SvgPicture.asset(
//                                                       "assets/images/city.svg",
// //                                              color: Colors.red,
// //                                              semanticsLabel: 'A red up arrow'
//                                                       height: 15,
//                                                       width: 15,
//                                                     ),
//                                                   ),
//                                                   iconSize: 24,
//                                                   hint: Row(
//                                                     children: <Widget>[
// //                                                      Text(
// //                                                        '*',
// //                                                        style: TextStyle(color: Colors.red),
// //                                                      ),
//                                                       Text(
//                                                         'City',
//                                                         style: TextStyle(
//                                                           color:
//                                                               Color(0xff444b69),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   isExpanded: true,
// //                                                  underline: null,
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                   items: data1.map((item) {
//                                                     return new DropdownMenuItem(
//                                                       child: new Text(
//                                                         item['name'],
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.black),
//                                                       ),
//                                                       value:
//                                                           item['id'].toString(),
//                                                     );
//                                                   }).toList(),
//                                                   onChanged: (newVal) {
//                                                     setState(() {
//                                                       _mySelection = newVal;
//
// //                                          int a=data1.indexOf(_myselection2);
// //                                          String s=data1.elementAt(a);
// //                                          print(_myselection2);
// //                                                      getRashiReport("");
//                                                     });
//                                                   },
//                                                   value: _mySelection,
//                                                 ),
// //                                                new TextFormField(
// //                                                  controller: _cityController,
// //                                                  textInputAction: TextInputAction.done,
// //                                                  keyboardType: TextInputType.emailAddress,
// //                                                  decoration: new InputDecoration(
// //                                                    hintText: 'City',
// //                                                    hintStyle:  TextStyle(
// //
// //                                                      fontSize: 16.0,
// //                                                      color: Color(0xFF5a6381),),
// //                                                    suffixIcon: Container(
// //                                                      padding: EdgeInsets.symmetric(vertical: 15),
// //                                                      child: SvgPicture.asset(
// //                                                        "assets/images/city.svg",
// ////                                              color: Colors.red,
// ////                                              semanticsLabel: 'A red up arrow'
// //                                                        height: 15,
// //                                                        width: 15,
// //                                                      ),
// //                                                    ),
// //                                                  ),
// //                                                  maxLines: 1,
// //                                                  autofocus: false,
// //                                                ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//
//                                 new Container(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Padding(
//                                         padding: const EdgeInsets.fromLTRB(
//                                             0.0, 8, 0, 0),
//                                         child: Text(
//                                           'Locality',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 15,
// //                                        fontWeight: FontWeight.bold,
//                                               color: Color(0xff444b69),
//                                               letterSpacing: 1),
//                                         ),
//                                       ),
//                                       new TextFormField(
//                                         controller: _localityController,
//                                         textInputAction: TextInputAction.done,
//                                         decoration: new InputDecoration(
//                                           fillColor: Color(0xff444b69),
//                                           hintText: 'Locality',
//                                           hintStyle: TextStyle(
// //                                            fontWeight: FontWeight.w400,
//                                             fontSize: 15,
// //                                        fontWeight: FontWeight.bold,
//                                             color: Color(0xff444b69),
// //                                            letterSpacing: 1
//                                           ),
//                                           suffixIcon: Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 15),
//                                             child: SvgPicture.asset(
//                                               "assets/images/location.svg",
// //                                              color: Colors.red,
// //                                              semanticsLabel: 'A red up arrow'
//                                               height: 15,
//                                               width: 15,
//                                             ),
//                                           ),
//                                         ),
//                                         style: TextStyle(
// //                                            fontWeight: FontWeight.w400,
//                                           fontSize: 15,
// //                                        fontWeight: FontWeight.bold,
//                                           color: Color(0xff444b69),
// //                                            letterSpacing: 1
//                                         ),
//                                         maxLines: 1,
//                                         autofocus: false,
//                                       ),
//                                     ],
//                                   ),
//                                 ),

                                new TextFormField(
                                  controller: locationController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  onTap: () async{
                                    try {
                                      Prediction pr = await PlacesAutocomplete.show(
                                          context: context,
                                          apiKey: "AIzaSyAfySREHfRw2x8bEFT6b7Nc4z3Te80LiyI",
                                          language: "en",
                                          components: [Component(Component.country, "in"),
                                          ],
                                          hint: "Enter your area" ,
                                          logo: Container(
                                              width: MediaQuery.of(context).size.width,
                                              child: Text("Enter your area",style: new TextStyle(fontSize: 16),textAlign: TextAlign.center,)));
                                      _getLatLng(pr);
                                      print("place id=>" + pr.placeId);
                                    }catch(ex){

                                    }
                                  },
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(Icons.add_location),
                                    hintText: 'Add Location',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF5a6381),
                                    ),
//                                        suffixIcon: Container(
//                                          padding:
//                                          EdgeInsets.symmetric(vertical: 15),
//                                          child: SvgPicture.asset(
//                                            "assets/images/email.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                            height: 15,
//                                            width: 15,
//                                          ),
//                                        ),
                                  ),
                                  autofocus: false,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 0),
                                        child: Text(
                                          'Video Tag',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      new TextFormField(
                                        controller: _videoTagController,
                                        textInputAction: TextInputAction.done,
                                        decoration: new InputDecoration(
                                          hintText: 'Tag',
                                          hintStyle: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                            color: Color(0xff444b69),
//                                            letterSpacing: 1
                                          ),
//                                                suffixIcon: Container(
//                                                  padding: EdgeInsets.symmetric(
//                                                      vertical: 15),
//                                                  child: SvgPicture.asset(
//                                                    "assets/images/zipcode.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                    height: 15,
//                                                    width: 15,
//                                                  ),
//                                                )
                                        ),
                                        maxLines: 1,
                                        autofocus: false,
                                        style: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                          fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                          color: Color(0xff444b69),
//                                            letterSpacing: 1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 0),
                                        child: Text(
                                          'Video Category',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        hint: Row(
                                          children: <Widget>[
//                                                      Text(
//                                                        '*',
//                                                        style: TextStyle(color: Colors.red),
//                                                      ),
                                            Text(
                                              'Category',
                                              style: TextStyle(
                                                color: Color(0xff444b69),
                                              ),
                                            ),
                                          ],
                                        ),
                                        isExpanded: true,
//                                                  underline: null,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        items: category.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(
                                              item['name'],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            value: item['id'].toString(),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _categorySelection = newVal;
                                            getCategoryByID();
//                                          int a=data1.indexOf(_categorySelection);
//                                          String s=data1.elementAt(a);
//                                          print(s);
//                                          print(category.elementAt(int.parse(_categorySelection)));
                                          });
                                        },
                                        value: _categorySelection,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 0),
                                        child: Text(
                                          'Select Thumbnail',
                                          style: TextStyle(
                                            color: Color(0xFF5a6381),
                                            fontSize: 16,
//                                                  fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: new TextField(
                                              decoration: new InputDecoration(
                                                labelText: fileName,
                                                hintStyle: style1,
                                                suffixIcon: Icon(
                                                    Icons.file_upload,
                                                    color: Color(0xFF5a6381)),
                                              ),
                                              expands: false,
                                              showCursor: false,
                                              readOnly: true,
                                              maxLines: 1,
                                              autofocus: false,
                                              onTap: () {
                                                _displayDialog(context);
                                              },
                                            ),
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 0),
                                        child: Text(
                                          'Select Video',
                                          style: TextStyle(
                                            color: Color(0xFF5a6381),
                                            fontSize: 16,
//                                                  fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: new TextField(
                                              decoration: new InputDecoration(
                                                labelText: fileNameVideo,
                                                hintStyle: style1,
                                                suffixIcon: Icon(
                                                    Icons.file_upload,
                                                    color: Color(0xFF5a6381)),
                                              ),
                                              expands: false,
                                              showCursor: false,
                                              readOnly: true,
                                              maxLines: 1,
                                              autofocus: false,
                                              onTap: () {
                                                _displayDialogVideo(context);
                                              },
                                            ),
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
//                        image: DecorationImage(
//                          image: AssetImage("assets/images/card_background.png"),
//                          fit: BoxFit.fill,
//
//                        ),
                              color: Colors.transparent),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          // updateProfile();

                          if (!["",null,false,0].contains(_videoTitleController.text.toString())) {
                            if (!["", null, false, 0].contains( _descriptionController.text.toString())) {

                                  if (!["",null,false,0,].contains( locationController.text.toString())) {
                                    if (!["",null,false, 0,].contains(_categorySelection)) {
                                      if (!["",null,false,0,].contains(_videoFile)) {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        ProgressDialog pr;
                                        pr = ProgressDialog(
                                          context,
                                          // customBody: LinearProgressIndicator(
                                          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                                          //   backgroundColor: Colors.white,
                                          // ),
                                        );
                                        pr.show();
                                        updateProfile();
                                        Future.delayed(Duration(seconds: 2))
                                            .then((onvalue) {
                                          percentage = percentage + 10.0;
                                          print(percentage);

                                          pr.update(
                                            progress: percentage,
                                            message:
                                                "Uploading...${percentage}",
                                            progressWidget: Container(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    CircularProgressIndicator()),
                                            maxProgress: 100.0,
                                            progressTextStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            messageTextStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.w600),
                                          );

                                          Future.delayed(Duration(seconds: 2))
                                              .then((value) {
                                            Future.delayed(Duration(seconds: 2))
                                                .then((value) {
                                              percentage = percentage + 10.0;
                                              pr.update(
                                                  progress: percentage,
                                                  message:
                                                      "Uploading...${percentage}");
                                              print(percentage);
                                              Future.delayed(
                                                      Duration(seconds: 2))
                                                  .then((value) {
                                                percentage = percentage + 10.0;
                                                pr.update(
                                                    progress: percentage,
                                                    message:
                                                        "Uploading...${percentage}");
                                                print(percentage);
                                                Future.delayed(
                                                        Duration(seconds: 2))
                                                    .then((value) {
                                                  percentage =
                                                      percentage + 10.0;
                                                  pr.update(
                                                      progress: percentage,
                                                      message:
                                                          "Uploading...${percentage}");
                                                  print(percentage);
                                                  Future.delayed(
                                                          Duration(seconds: 2))
                                                      .then((value) {
                                                    percentage =
                                                        percentage + 10.0;
                                                    pr.update(
                                                        progress: percentage,
                                                        message:
                                                            "Uploading...${percentage}");
                                                    print(percentage);
                                                    Future.delayed(Duration(
                                                            seconds: 2))
                                                        .then((value) {
                                                      percentage =
                                                          percentage + 10.0;
                                                      pr.update(
                                                          progress: percentage,
                                                          message:
                                                              "Uploading...${percentage}");
                                                      print(percentage);
                                                      Future.delayed(Duration(
                                                              seconds: 2))
                                                          .then((value) {
                                                        percentage =
                                                            percentage + 10.0;
                                                        pr.update(
                                                            progress:
                                                                percentage,
                                                            message:
                                                                "Uploading...${percentage}");
                                                        print(percentage);
                                                        Future.delayed(Duration(
                                                                seconds: 3))
                                                            .then((value) {
                                                          percentage =
                                                              percentage + 10.0;
                                                          pr.update(
                                                              progress:
                                                                  percentage,
                                                              message:
                                                                  "Uploading...${percentage}");
                                                          print(percentage);
                                                          Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          3))
                                                              .then((value) {
                                                            percentage =
                                                                percentage +
                                                                    10.0;
                                                            pr.update(
                                                                progress:
                                                                    percentage,
                                                                message:
                                                                    "Uploading...${percentage}");
                                                            print(percentage);
                                                            percentage =
                                                                percentage +
                                                                    10.0;
                                                            pr.update(
                                                                progress:
                                                                    percentage,
                                                                message:
                                                                    "Almost done...");
                                                            print(percentage);
                                                            Future.delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            2))
                                                                .then((value) {
                                                              percentage =
                                                                  percentage +
                                                                      10.0;
                                                              pr
                                                                  .hide()
                                                                  .whenComplete(
                                                                      () {
                                                                print(pr
                                                                    .isShowing());
                                                                Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  CupertinoPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              HomePageTwo()),
                                                                );
                                                              });
                                                            });
                                                          });
                                                        });
                                                      });
                                                    });
                                                  });
                                                });
                                              });
                                            });
                                          });
                                        });
                                        print("Done");
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Please add video file",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 10,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please enter category",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 10,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }

                                    //getToekn();

                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Please select location",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                //getToekn();


                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Description",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Enter Title",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }

//                    setPersonalData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Card(
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Color(0xee08c1f8),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                              height: 50.0, // height of the button
//                                      width: 120.0, // width of the button
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Submit',
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
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(0.0),
//            image: DecorationImage(
//              image: AssetImage("assets/images/dashboardbg.png"),
//              fit: BoxFit.fill,
//            ),
//          ),
            ),
            // Visibility(
            //   visible: visible,
            //   child: Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // )
          ],
        ),
        resizeToAvoidBottomPadding: true);
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
  String userCity,userState,userLocality,userPostalCode;

  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      geolocator = Geolocator();
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          latitude,longitude);

      Placemark place = p[0];

      setState(() {
        print("sunny District "+place.locality+" state " +place.administrativeArea+" country "+place.country +"pin code"+place.postalCode);
        userCity=place.locality;
        userState=place.administrativeArea;
        userLocality=place.country;
        userPostalCode=place.postalCode;
        locationController.text=userCity+","+userState+","+userPostalCode;
      });
      // UtilityClass.showMsg("District "+place.locality+" state " +place.administrativeArea+" country "+place.country );

    } catch (e) {
      print(e);
      print("locality exception"+e.toString());
    }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        captureImage(ImageSource.camera);
                      },
                      child: Image.asset(
                        'assets/images/camera.png',
                        height: 50,
                        width: 150,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        captureImage(ImageSource.gallery);
                      },
                      child: Image.asset(
                        'assets/images/gallery.png',
                        height: 50,
                        width: 150,
                      ),
                    ),
                    Center(
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.redAccent[100],
                        child: new Text("Cancel"),
                      ),
                    )
                  ],
                ),
              ),
              height: 150,
              width: 100,
            ),
          );
        });
  }

  _displayDialogVideo(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context, rootNavigator: true).pop();
                    //     captureVideo(ImageSource.camera);
                    //   },
                    //   child: Image.asset(
                    //     'assets/images/camera.png',
                    //     height: 50,
                    //     width: 150,
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        captureVideo(ImageSource.gallery);
                      },
                      child: Image.asset(
                        'assets/images/gallery.png',
                        height: 50,
                        width: 150,
                      ),
                    ),
                    Center(
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.redAccent[100],
                        child: new Text("Cancel"),
                      ),
                    )
                  ],
                ),
              ),
              height: 120,
              width: 100,
            ),
          );
        });
  }
}
