import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:we_watch_app/LoginScreenProcessTwo.dart';
import 'package:we_watch_app/LoginScreenprocess2.dart';
import 'package:we_watch_app/NavigationPages/dashboard.dart';
import 'package:we_watch_app/home_page_two.dart';
import 'package:we_watch_app/ui/login.dart';

import 'filter_task.dart';

//const kGoogleApiKey = "AIzaSyAl_DrFzKqFTx54VoG2fAgopn5M2pC2sk4";

// to get places detail (lat/lng)
//GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class LocationAccess extends StatefulWidget {
  String pickLat,
      pickLong,
      dropLat,
      dropLong,
      id,
      drop_point,
      pickup_point,
      fare;

  LocationAccess({
    Key key,
    this.pickLat,
    this.pickLong,
    this.dropLat,
    this.dropLong,
    this.id,
    this.drop_point,
    this.pickup_point,
    this.fare,
  }) : super(key: key);

  @override
  _LocationAccessState createState() => new _LocationAccessState(
      pickLat: pickLat,
      pickLong: pickLong,
      dropLat: dropLat,
      dropLong: dropLong,
      id: id,
      drop_point: drop_point,
      pickup_point: pickup_point,
      fare: fare);
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

class _LocationAccessState extends State<LocationAccess> {
  String pickLat,
      pickLong,
      dropLat,
      dropLong,
      id,
      drop_point,
      pickup_point,
      fare;

  _LocationAccessState({
    Key key,
    this.pickLat,
    this.pickLong,
    this.dropLat,
    this.dropLong,
    this.id,
    this.drop_point,
    this.pickup_point,
    this.fare,
  }) : super();

  var icon = null, icon1 = null;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedLocationIndices = Set<int>();
  void _toggleLocation(int index) {
    if (selectedLocationIndices.contains(index))
      selectedLocationIndices.remove(index);
    else
      selectedLocationIndices.add(index);
  }

  // Initial location of the Map view
  CameraPosition _initialLocation;

  GoogleMapController mapController;

  final _pickUp = TextEditingController();
  final _dropUp = TextEditingController();
  bool flag_location = false;

  bool isHomeDataLoading;

  String leads_tab = "assets/images/leads1.png",
      status_tab = "assets/images/status.png";

  double lat, long;
  int countValue = 0;

  String _streetNumber = '';
  String _street = '';
  String _city = '';
  String _zipCode = '';
  String name = '', userName = "";
  String number = '';
  Geolocator _geolocator;

  String finalPickLat, finalPickLong, finalDropLat, finalDropLong;

// For storing the current position
  Position _currentPosition;

  //CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  //GoogleMapController mapController;

  // final Geolocator _geolocator = Geolocator();

  // Position _currentPosition;
  String _currentAddress;
  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance, avtar = "";
  Set<Marker> markers = {};
  //PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  static CameraPosition _kGooglePlex;
  static String distance = "";
  String estimate_fare = '', vehicalType = "", vehical_id = "";

  bool isResponse = false;

  //print(myDouble);

  // Initial location of the Map view

  String curr_lat, curr_long;

  // final Geolocator _geolocator = Geolocator();

  // Position _currentPosition;
  @override
  void dispose() {
    super.dispose();
  }

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getCurrentLocation1() async {
    _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        lat = position.latitude;

        print('CURRENT POS: $_currentPosition');
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress() async {
    _geolocator = Geolocator();
    _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        prefs.setString('city', place.locality);
        prefs.setString('state', place.administrativeArea);
        print(place.locality + "   " + place.administrativeArea);

        checkFirstSeen();
      });
      if (_currentAddress.isNotEmpty) {}
    } catch (e) {
      print(e);
    }
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _isLogin = (prefs.getBool('isLogin') ?? false);

    if (_isLogin) {
      Navigator.pop(context);
      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => new HomePageTwo()));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }

//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
  }

  _getCurrentLocation() async {
    _geolocator = Geolocator();
    _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 12.0,
                bearing: position.accuracy),
          ),
        );
      });
      Marker destinationMarker = Marker(
        markerId: MarkerId('$_currentPosition'),
        position: LatLng(
          _currentPosition.latitude,
          _currentPosition.longitude,
        ),
        infoWindow: InfoWindow(
          title: 'Destination',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      setState(() {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
                zoom: 12.0,
                bearing: _currentPosition.accuracy),
          ),
        );
      });

      markers.add(destinationMarker);
      await _getAddress1();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress1() async {
    try {
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        _pickUp.text = _currentAddress;
        _startAddress = _currentAddress;
      });

      Marker destinationMarker = Marker(
        markerId: MarkerId('$_currentPosition'),
        position: LatLng(
          _currentPosition.latitude,
          _currentPosition.longitude,
        ),
        infoWindow: InfoWindow(
          title: 'Destination',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      setState(() {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
                zoom: 12.0,
                bearing: _currentPosition.accuracy),
          ),
        );
      });

      markers.add(destinationMarker);
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places

  Widget _submitButton() {
    return Material(
      child: Container(
        child: InkWell(
          onTap: () {
            _getCurrentLocation1();
          },
          child: Container(
            child: Text(
              'Allow Access',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff00adef)),
            ),
            width: 220,
            alignment: Alignment.center,
            height: 40,
          ),
          splashColor: Color(0xffffffff),
          borderRadius: BorderRadius.circular(25.0),
        ),
        width: 220,
        height: 40,
        alignment: Alignment.center,
      ),
      color: Color(0xffffffff),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }

  Widget _signUpButton() {
    return Material(
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilterTask(
                          text: "Change Location",
                        )));
          },
          child: Container(
            child: Text(
              'Mannual Entry',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff00adef)),
            ),
            width: 220,
            alignment: Alignment.center,
            height: 40,
          ),
          splashColor: Color(0xffffffff),
          borderRadius: BorderRadius.circular(25.0),
        ),
        width: 220,
        height: 40,
        alignment: Alignment.center,
      ),
      color: Color(0xffffffff),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
  }

  @override
  void initState() {
    //  _getLocation();
    // getRide("");
    super.initState();
    _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
    _geolocator = Geolocator();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height);
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body:  Stack(
        children: <Widget>[
          GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.terrain,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),

          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: new BoxDecoration(
                  color: Color(0xff00adef),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment(0, 2),
                          child: Text(
                            'Location Required',
                            style: TextStyle(

                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          'We need your location',
                          style: TextStyle(
                              color: Colors.white,

                              fontSize: 18),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment(0, -1.8),
                        child: Text(
                          'to curate nearby stories for you.',
                          style: TextStyle(
                              color: Colors.white,

                              fontSize: 18),
                        )),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: _signUpButton(),
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: _submitButton(),
                        ),
                        flex: 3,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        });
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}

