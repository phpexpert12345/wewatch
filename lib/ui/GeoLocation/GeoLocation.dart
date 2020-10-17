import 'package:flutter/material.dart';
import 'package:flutter_places_autocomplete/flutter_places_autocomplete.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  PlacesAutocomplete placesAutocomplete;
  List<Prediction> predictions;
  final searchController = TextEditingController();

  @override
  void initState() {
    placesAutocomplete =
        PlacesAutocomplete(apiKey: 'AIzaSyC-OHeGgrRHWqf3gkMWAKvd6yvJKpvv6xM');
    predictions = [];
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Places Autocomplete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: searchController,
            ),
            predictions.length>0? Container(
              height: 200,
              child: _listView(),
            ):Container(),
            RaisedButton(
              onPressed: _fetchPredictions,
              child: Text(
                'Search',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
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
