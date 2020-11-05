import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_places_autocomplete/flutter_places_autocomplete.dart' as pr;
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:we_watch_app/ui/GeoLocation/AddressSearch.dart';
import 'package:we_watch_app/ui/location_access_page.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  pr.PlacesAutocomplete placesAutocomplete;
  List<pr.Prediction> predictions;
  final searchController = TextEditingController();

  @override
  void initState() {
    placesAutocomplete =
        pr.PlacesAutocomplete(apiKey: "AIzaSyAl_DrFzKqFTx54VoG2fAgopn5M2pC2sk4");
    predictions = [];
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sessionToken = Uuid().generateV4();

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Address'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onTap: () async {
              // should show search screen here
              Prediction p=await PlacesAutocomplete.show(context: context, apiKey: "AIzaSyAl_DrFzKqFTx54VoG2fAgopn5M2pC2sk4",
                   language: "en",
              components: [Component(Component.country,"in"),
              ]);
              // showSearch(
              //   context: context,
              //   // we haven't created AddressSearch class
              //   // this should be extending SearchDelegate
              //
              //   delegate: AddressSearch(token: sessionToken,text: _controller.text),
              // );
            },
            decoration: InputDecoration(
              icon: Container(
                margin: EdgeInsets.only(left: 20),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              hintText: "Enter location",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  List<Prediction> pre=new List();
  Future<void> _fetchPredictions() {

    setState(() async {
      predictions = await placesAutocomplete.getPreditcions(input: 'london');
    });
  }

  Widget _listView() {
    return ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Text(predictions[index].description);
        });
  }
}
