import 'package:flutter/material.dart';
import 'package:we_watch_app/sliver_fab.dart';


class CollapsingProfile extends StatefulWidget {
  CollapsingProfile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CollapsingProfileState createState() => new _CollapsingProfileState();
}

class _CollapsingProfileState extends State<CollapsingProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (context) => new SliverContainer(

          floatingActionButton: new Container(
            height: 120.0,
            width: 120.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: new DecorationImage(
                image: new ExactAssetImage("assets/images/startbucks.png"),
                fit: BoxFit.fill,
              ),
              border:
              Border.all(color: Colors.white, width: 2.0),

            ),
          ),

          expandedHeight: 256.0,
          slivers: <Widget>[
            new SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: 256.0,
              pinned: true,
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,color: Colors.white,),
              ),
              flexibleSpace: new FlexibleSpaceBar(
//                title: new Text("Developer Libs",
//                  style: TextStyle(color: Colors.white),
//                ),
                background: new Image.asset(
                  "assets/images/startbucks.png",
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  30,
                      (int index) =>
                  new ListTile(title: new Text("Item $index")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
