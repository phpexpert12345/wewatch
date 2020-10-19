import 'package:flutter/material.dart';
import 'package:we_watch_app/ui/GeoLocation/Suggestion.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  final token;
  final text;
  AddressSearch({this.token,this.text});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // We will put the api call here

      future: new PlaceApiProvider(token).fetchSuggestions(text, "74.636383"),  //pass test lang & lati data
      builder: (context, snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          // we will display the data returned from our future here
          title:
          Text(snapshot.data[index]),
          onTap: () {
            close(context, snapshot.data[index]);
          },
        ),
        itemCount: snapshot.data.length,
      )
          : Container(child: Text('Loading...')),
    );
  }
}