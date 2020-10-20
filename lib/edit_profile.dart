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
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page_two.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => new _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isResponse = false;
  bool visible = false;
  int _radioValue1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  String gender = '', dob = '';
  String regender = '';
  bool isHomeDataLoading = false;

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  String _radioValue; //Initial definition of radio button value
  String choice;
  int val = 0;
  String reportcomment = '';
  String email = "", mobile = "";
  String dayString, monthString, yearString;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (value) {
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

  Future getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.

    String access_token = prefs.getString('access_token');
    setState(() {
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

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());

    try {
      if (response.statusCode == 200) {
        prefs.setString('first_name', body['data']['first_name']);
        prefs.setString('last_name', body['data']['last_name']);
        prefs.setString('email', body['data']['email']);
        prefs.setString('emp_type', body['data']['emp_type']);
        prefs.setString('gender', body['data']['gender']);
        prefs.setString('mobile_number', body['data']['mobile_number']);
        prefs.setString('slug', body['data']['slug']);
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

        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
//        Fluttertoast.showToast(
//            msg: body['data']['access_token'],
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.CENTER,
////            timeInSecForIosWeb: 1
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
//          timeInSecForIosWeb: 1,
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
//          timeInSecForIosWeb: 1,
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
//          timeInSecForIosWeb: 1,
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
//          timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
// //        timeInSecForIosWeb: 1,
//       );
      throw Exception(e);
    }
    // If the Response Message is Matched.
  }

  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _dobController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController _stateController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _zipcodeController = new TextEditingController();

  void getInfoDetails(String type) async {
    isHomeDataLoading = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _firstnameController.text = sharedPreferences.getString('first_name');
      _lastnameController.text = sharedPreferences.getString('last_name');
      _emailController.text = sharedPreferences.getString('email');
      emp_type = sharedPreferences.getString('emp_type');
      response_gender = sharedPreferences.getString('gender');
      mobile_number = sharedPreferences.getString('mobile_number');
      _dobController.text = sharedPreferences.getString('date_of_birth');
      status = sharedPreferences.getString('status');
      user_type = sharedPreferences.getString('user_type');
      _addressController.text = sharedPreferences.getString('address');
      _cityController.text = sharedPreferences.getString('city');
      _stateController.text = sharedPreferences.getString('state');
      country_id = sharedPreferences.getString('country_id');
      _zipcodeController.text = sharedPreferences.getString('zipcode');
      image = sharedPreferences.getString('image');
      _myselection2 = sharedPreferences.getString('state_id');
      _mySelection = sharedPreferences.getString('city_id');

      getCity();

      first_name = sharedPreferences.getString('first_name');
      last_name = sharedPreferences.getString('last_name');
      response_email = sharedPreferences.getString('email');
      emp_type = sharedPreferences.getString('emp_type');
      response_gender = sharedPreferences.getString('gender');
      mobile_number = sharedPreferences.getString('mobile_number');
      date_of_birth = sharedPreferences.getString('date_of_birth');
      dob = sharedPreferences.getString('date_of_birth');
      gender = sharedPreferences.getString('gender');
      status = sharedPreferences.getString('status');
      user_type = sharedPreferences.getString('user_type');
      address = sharedPreferences.getString('address');
      city_id = sharedPreferences.getString('city_id');
      state_id = sharedPreferences.getString('state_id');
      country_id = sharedPreferences.getString('country_id');
      zipcode = sharedPreferences.getString('zipcode');
      image = sharedPreferences.getString('image');
    });

//    prefs.setString('main_token',body['token'] );
//    print(body['token']);
    setState(() {
      if (["male"].contains(response_gender)) {
        // _radioValue1 = 0;
        _radioValue = 'male';
      }
      if (["female"].contains(response_gender)) {
        // _radioValue1 = 1;
        _radioValue = 'female';
      }
      // _radioValue = 'Sexual content';
    });
    print(first_name);
    print(last_name);
    print(response_email);
    print(emp_type);
    print(response_gender);
    print(mobile_number);
    print(date_of_birth);
    print(status);
    print(user_type);
    print(address);
    print(city_id);
    print(state_id);
    print(country_id);
    print(zipcode);
    print(image);
  }

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
  Future removeProfilePic() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    setState(() {
      visible = true;
    });
    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};
    //var stream = new http.ByteStream("");
    // get file length

   // var length = await _imageFile.length();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/profile'));
    request.fields["first_name"] = _firstnameController.text;
    request.fields["last_name"] = _lastnameController.text;
    request.fields["address"] = _addressController.text;
    request.fields["state_id"] = _myselection2;
    request.fields["city_id"] = _mySelection;
    request.fields["zipcode"] = _zipcodeController.text;
    request.fields["gender"] = gender;
    request.fields["dob"] = dob;
    request.fields["image"]="";
    request.headers.addAll(headers);
    var response = await request.send();
    if(response.statusCode==200){
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Your profile update successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightGreen,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => HomePageTwo()),);
    }else{
      setState(() {
        visible = false;
      });
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
    // get file length

    var length = await _imageFile.length();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://wewatch.in/wewatch-up/api/v1/profile'));
    request.fields["first_name"] = _firstnameController.text;
    request.fields["last_name"] = _lastnameController.text;
    request.fields["address"] = _addressController.text;
    request.fields["state_id"] = _myselection2;
    request.fields["city_id"] = _mySelection;
    request.fields["zipcode"] = _zipcodeController.text;
    request.fields["gender"] = gender;
    request.fields["dob"] = dob;
    request.files.add(
        await http.MultipartFile('image', stream, length, filename: fileName));
    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Your profile update successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightGreen,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => HomePageTwo()),
      );
    } else {
      setState(() {
        visible = false;
      });
      Fluttertoast.showToast(
          msg: "Your profile update failed!!",
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

  Future userLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    String access_token = prefs.getString('access_token');
    var url = 'https://wewatch.in/wewatch-up/api/v1/profile';

    // Store all data with Param Name.
    FormData formData;

    if (Platform.isIOS) {
      formData = new FormData.from({
        "first_name": _firstnameController.text,
        "last_name": _lastnameController.text,
        "address": _addressController.text,
        "state_id": _myselection2,
        "city_id": _mySelection,
        "zipcode": _zipcodeController.text,
        "gender": gender,
        "dob": dob,
      });
    }
    if (Platform.isAndroid) {
      formData = new FormData.from({
        "first_name": _firstnameController.text,
        "last_name": _lastnameController.text,
        "address": _addressController.text,
        "state_id": _myselection2,
        "city_id": _mySelection,
        "zipcode": _zipcodeController.text,
        "gender": gender,
        "dob": dob,
      });
    }

    Map<String, String> headers = {'Authorization': 'Bearer $access_token'};

    // Starting Web API Call.
    var response = await http.post(url, body: formData, headers: headers);

    // Getting Server response into variable.

    var body = await json.decode(response.body);
    var message = jsonDecode(response.body);

    print("ffff" + message.toString());
    SharedPreferences prefss = await SharedPreferences.getInstance();
    regender = prefss.getString('gender');
    try {
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
        Fluttertoast.showToast(
            msg: "Your profile update successfully!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => HomePageTwo()),
        );
      } else if (response.statusCode == 400) {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          visible = false;
        });
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
        setState(() {
          visible = false;
        });

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
        setState(() {
          visible = false;
        });
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
            msg: "Login/Password wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
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
  void initState() {
    super.initState();
    getInfoDetails("");
    getState();
    getProfile();

    // setState(() {
    //   if (["male"].contains(regender)) {
    //     // _radioValue1 = 0;
    //     _radioValue = 'Sexual content';
    //   }
    //   if (["female"].contains(response_gender)) {
    //     // _radioValue1 = 1;
    //     _radioValue = 'Sexual content';
    //   }
    //   // _radioValue = 'Sexual content';
    // });
  }

  File _imageFile;

  List<int> byteimage;
  String base64 = '', fileName = 'Browse File';

  bool isExpanded = false;

  Widget _buildImage() {
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else {
      return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
    }
  }

  String _mySelection, _myselection2, _mySelection11 = '', _mySelection22 = '';
  final String url =
      "http://ems.dextrousinfosolutions.com/dev-dexcrm/api/expense/Exp_category";

  // final format = DateFormat("yyyy-MM-dd HH:mm");
  String comments = '', time1 = 'Select Time', date1 = 'Select Date';
  List data = List();
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
    print(regender.toString());
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[],
      ),
    );
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'male':
          choice = value;
          setState(() {
            gender = value;
          });
          break;
        case 'female':
          choice = value;
          setState(() {
            gender = value;
          });
          break;

        default:
          choice = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {
      if (["male"].contains(response_gender)) {
        _radioValue1 = 0;
      }
      if (["female"].contains(response_gender)) {
        _radioValue1 = 1;
      }
    });
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
            "Edit Profile",
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
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
////                    new IconButton(
////                        icon: Icon(
////                          Icons.arrow_back_ios,
////                          color: Color(0xff444b69),
////                          size: 20,
////                        ),
////                        onPressed: () {
////                          if (Navigator.canPop(context)) {
////                            Navigator.pop(context);
////                          } else {
////                            SystemNavigator.pop();
////                          }
////                        }),
//                      Flexible(
//                        child: Center(
//                            child: Padding(
//                              padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
//                              child: Text(
//                                ' Profile',
//                                style: TextStyle(
//
//                                  color: Color(0xff444b69),
//                                  fontSize: 20,
//                                ),
//                              ),
//                            )),
//                        flex: 1,
//                      ),
//                    ],
//                  ),
//                ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                        child: SingleChildScrollView(
                            child: new Container(
//                        color: Color(0xff444b69),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _displayDialog(context);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Center(
                                        child: _imageFile != null
                                            ? CircleAvatar(
                                                radius: 51,
                                                backgroundColor: Colors.grey,
                                                child: CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage:
                                                      FileImage(_imageFile),
                                                ),
                                              )
                                            : Container(
                                                width: 75.0,
                                                height: 75.0,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: (![
                                                        "",
                                                        null,
                                                        false,
                                                        0,
                                                      ].contains(image))
                                                          ? NetworkImage(
                                                              image,
                                                            )
                                                          : AssetImage(
                                                              "assets/images/logo_splash.png",
                                                            ),
                                                    ))),
                                      ),
//                                      Container(
//                                        height: 75.0,
//                                        width: 75.0,
//                                        decoration: new BoxDecoration(
//                                          shape: BoxShape.circle,
//                                        ),
//                                        child: ClipRRect(
//                                          borderRadius: BorderRadius.circular(75.0),
//                                          child: (_imageFile==null)?Image.asset(
//                                            "assets/images/edit_profile_image.png",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//
//
//                                          ):Image.file(_imageFile,width: 75,height: 75,
//                                          ),
//                                        ),),
//                                      Padding(
//                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                        child: Container(
//                                          height: 75,
//                                          width: 75,
//                                          decoration: new BoxDecoration(
//                                            color: const Color(0xff7c94b6),
//                                            borderRadius: BorderRadius.all(const Radius.circular(75.0)),
//                                            border: Border.all(color: const Color(0xFF28324E)),),
//
//                                          child: (_imageFile==null)?Image.asset(
//                                            "assets/images/edit_profile_image.png",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//
//
//                                          ):Image.file(_imageFile,
//                                            ),
//                                        ),
//                                      ),
                                    ],
                                  ),
                                ),

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
                                              controller: _firstnameController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: new InputDecoration(
                                                hintText: (first_name != null)
                                                    ? first_name
                                                    : 'First Name',
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: new TextFormField(
                                              controller: _lastnameController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: new InputDecoration(
                                                hintText: (last_name != null)
                                                    ? last_name
                                                    : 'Last Name',
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
                                  controller: _emailController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: new InputDecoration(
                                    hintText: (response_email != null)
                                        ? response_email
                                        : 'Email ID',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF5a6381),
                                    ),
                                    suffixIcon: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: SvgPicture.asset(
                                        "assets/images/email.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                        height: 15,
                                        width: 15,
                                      ),
                                    ),
                                  ),
                                  maxLines: 1,
                                  autofocus: false,
                                ),
                                SizedBox(
                                  height: 20,
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
                                          'Date of birth',
                                          style: TextStyle(
                                            color: Color(0xff444b69),
                                            fontSize: 15,
//                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ),
                                      new TextFormField(
                                        controller: _dobController,
                                        decoration: new InputDecoration(
                                          hintText: (date_of_birth != null)
                                              ? date_of_birth
                                              : dob,
                                          hintStyle: style1,
                                          suffixIcon: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: SvgPicture.asset(
                                              "assets/images/calendar.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                              height: 15,
                                              width: 15,
                                            ),
                                          ),
                                        ),
                                        expands: false,
                                        showCursor: false,
                                        textInputAction: TextInputAction.done,
                                        readOnly: true,
                                        maxLines: 1,
                                        onTap: () {
                                          DatePicker.showDatePicker(context,
//                                          minTime: DateTime.now(),
                                              showTitleActions: true,
                                              onChanged: (date) {
                                            dob = date.toString();
                                            setState(() {
                                              if (date.day < 10) {
                                                dayString =
                                                    "0" + date.day.toString();
                                              } else {
                                                dayString = date.day.toString();
                                              }
                                              if (date.month < 10) {
                                                monthString =
                                                    "0" + date.month.toString();
                                              } else {
                                                dayString =
                                                    date.month.toString();
                                              }
                                              dob = dayString +
                                                  '-' +
                                                  monthString +
                                                  '-' +
                                                  date.year.toString();
//                                              print(dob);
                                            });
                                            print('change $date');
                                          }, onConfirm: (date) {
                                            print('confirm $date');

                                            setState(() {
                                              if (date.day < 10) {
                                                dayString =
                                                    "0" + date.day.toString();
                                              } else {
                                                dayString = date.day.toString();
                                              }
                                              if (date.month < 10) {
                                                monthString =
                                                    "0" + date.month.toString();
                                              } else {
                                                dayString =
                                                    date.month.toString();
                                              }
                                              dob = dayString +
                                                  '-' +
                                                  monthString +
                                                  '-' +
                                                  date.year.toString();
//                                              print(dob);
                                            });
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                        autofocus: false,
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8, 0, 0),
                                        child: Text(
                                          'Gender',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Radio(
                                                      hoverColor:
                                                          Color(0xFF5a6381),
                                                      focusColor:
                                                          Color(0xFF5a6381),
                                                      activeColor:
                                                          Color(0xFF5a6381),
                                                      value: 'male',
                                                      groupValue: _radioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          radioButtonChanges(
                                                              value);
                                                          print(value);
                                                          gender = value;
                                                        });
                                                      },
                                                    ),
                                                    new Text(
                                                      'Male',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            Color(0xFF5a6381),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          child:
                                                              SvgPicture.asset(
                                                            "assets/images/male.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  color: Color(0xFF5a6381)
                                                      .withOpacity(0.5),
                                                  height: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Radio(
                                                      hoverColor:
                                                          Color(0xFF5a6381),
                                                      focusColor:
                                                          Color(0xFF5a6381),
                                                      activeColor:
                                                          Color(0xFF5a6381),
                                                      value: 'female',
                                                      groupValue: _radioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          radioButtonChanges(
                                                              value);
                                                          gender = value;

                                                          print(value);
                                                        });
                                                      },
                                                    ),
                                                    new Text(
                                                      'Female',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            Color(0xFF5a6381),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          child:
                                                              SvgPicture.asset(
                                                            "assets/images/female.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  color: Color(0xFF5a6381)
                                                      .withOpacity(0.5),
                                                  height: 1,
                                                ),
                                              ],
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
                                new Container(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                DropdownButton<String>(
                                                  icon: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    child: SvgPicture.asset(
                                                      "assets/images/city.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  iconSize: 24,
                                                  hint: Row(
                                                    children: <Widget>[
//                                                      Text(
//                                                        '*',
//                                                        style: TextStyle(color: Colors.red),
//                                                      ),
                                                      Text(
                                                        'State',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff444b69),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  isExpanded: true,
//                                                  underline: null,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  items: data.map((item) {
                                                    return new DropdownMenuItem(
                                                      child: new Text(
                                                        item['name'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      value:
                                                          item['id'].toString(),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newVal) {
                                                    setState(() {
                                                      _myselection2 = newVal;
                                                      _mySelection = null;
//                                          int a=data1.indexOf(_myselection2);
//                                          String s=data1.elementAt(a);
//                                          print(_myselection2);
                                                      data1.clear();
                                                      getCity();
                                                    });
                                                  },
                                                  value: _myselection2,
                                                ),
//                                                new TextFormField(
//                                                  controller: _cityController,
//                                                  textInputAction: TextInputAction.done,
//                                                  keyboardType: TextInputType.emailAddress,
//                                                  decoration: new InputDecoration(
//                                                    hintText: 'City',
//                                                    hintStyle:  TextStyle(
//
//                                                      fontSize: 16.0,
//                                                      color: Color(0xFF5a6381),),
//                                                    suffixIcon: Container(
//                                                      padding: EdgeInsets.symmetric(vertical: 15),
//                                                      child: SvgPicture.asset(
//                                                        "assets/images/city.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                        height: 15,
//                                                        width: 15,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  maxLines: 1,
//                                                  autofocus: false,
//                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                DropdownButton<String>(
                                                  icon: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    child: SvgPicture.asset(
                                                      "assets/images/city.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                  ),
                                                  iconSize: 24,
                                                  hint: Row(
                                                    children: <Widget>[
//                                                      Text(
//                                                        '*',
//                                                        style: TextStyle(color: Colors.red),
//                                                      ),
                                                      Text(
                                                        'City',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff444b69),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  isExpanded: true,
//                                                  underline: null,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  items: data1.map((item) {
                                                    return new DropdownMenuItem(
                                                      child: new Text(
                                                        item['name'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      value:
                                                          item['id'].toString(),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newVal) {
                                                    setState(() {
                                                      _mySelection = newVal;
//                                          int a=data1.indexOf(_myselection2);
//                                          String s=data1.elementAt(a);
//                                          print(_myselection2);
//                                                      getRashiReport("");
                                                    });
                                                  },
                                                  value: _mySelection,
                                                ),
//                                                new TextFormField(
//                                                  controller: _cityController,
//                                                  textInputAction: TextInputAction.done,
//                                                  keyboardType: TextInputType.emailAddress,
//                                                  decoration: new InputDecoration(
//                                                    hintText: 'City',
//                                                    hintStyle:  TextStyle(
//
//                                                      fontSize: 16.0,
//                                                      color: Color(0xFF5a6381),),
//                                                    suffixIcon: Container(
//                                                      padding: EdgeInsets.symmetric(vertical: 15),
//                                                      child: SvgPicture.asset(
//                                                        "assets/images/city.svg",
////                                              color: Colors.red,
////                                              semanticsLabel: 'A red up arrow'
//                                                        height: 15,
//                                                        width: 15,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  maxLines: 1,
//                                                  autofocus: false,
//                                                ),
                                              ],
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
                                          'Address',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      new TextFormField(
                                        controller: _addressController,
                                        textInputAction: TextInputAction.done,
                                        decoration: new InputDecoration(
                                          fillColor: Color(0xff444b69),
                                          hintText: (address != null)
                                              ? address
                                              : 'Address',
                                          hintStyle: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                            color: Color(0xff444b69),
//                                            letterSpacing: 1
                                          ),
                                          suffixIcon: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: SvgPicture.asset(
                                              "assets/images/location.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                              height: 15,
                                              width: 15,
                                            ),
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
                                          'Zipcode',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      new TextFormField(
                                        controller: _zipcodeController,
                                        textInputAction: TextInputAction.done,
                                        decoration: new InputDecoration(
                                            hintText: (zipcode != null)
                                                ? zipcode
                                                : 'Zipcode',
                                            hintStyle: TextStyle(
//                                            fontWeight: FontWeight.w400,
                                              fontSize: 15,
//                                        fontWeight: FontWeight.bold,
                                              color: Color(0xff444b69),
//                                            letterSpacing: 1
                                            ),
                                            suffixIcon: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: SvgPicture.asset(
                                                "assets/images/zipcode.svg",
//                                              color: Colors.red,
//                                              semanticsLabel: 'A red up arrow'
                                                height: 15,
                                                width: 15,
                                              ),
                                            )),
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
//                          updateProfile();
                          if (!["", null, false, 0]
                              .contains(_firstnameController.text.toString())) {
                            if (![
                              "",
                              null,
                              false,
                              0
                            ].contains(_lastnameController.text.toString())) {
                              if (![
                                "",
                                null,
                                false,
                                0,
                              ].contains(_emailController.text.toString())) {
                                if (![
                                  "",
                                  null,
                                  false,
                                  0,
                                ].contains(dob)) {
                                  if (![
                                    "",
                                    null,
                                    false,
                                    0,
                                  ].contains(_myselection2)) {
                                    if (![
                                      "",
                                      null,
                                      false,
                                      0,
                                    ].contains(_mySelection)) {
                                      if (![
                                        "",
                                        null,
                                        false,
                                        0,
                                      ].contains(gender)) {
                                        if (![
                                          "",
                                          null,
                                          false,
                                          0,
                                        ].contains(_addressController.text)) {
                                          if (![
                                            "",
                                            null,
                                            false,
                                            0,
                                          ].contains(_zipcodeController.text)) {
                                            if (![
                                              "",
                                              null,
                                              false,
                                              0,
                                            ].contains(_imageFile)) {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              updateProfile();
                                            } else {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              userLogin();
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Please Enter Address",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 10,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Please Enter Address",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 10,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Please Select Gender",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 10,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Enter City",
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
                                        msg: "Please Enter State",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Enter date of birth",
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
                                    msg: "Enter Email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please Last name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please First Name",
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
            Visibility(
              visible: visible,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
        resizeToAvoidBottomPadding: true);
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        //captureImage(ImageSource.gallery);
                        removeProfilePic();
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(2.0),
                        margin: EdgeInsets.only(bottom: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.shade200

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:3.0,right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text("Remove Profile ",style: new TextStyle(color:Colors.white),),
                                Icon(Icons.delete,color: Colors.white,)
                            ],
                          ),
                        ),
                      )
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
              height: 180,
              width: 100,
            ),
          );
        });
  }
}
