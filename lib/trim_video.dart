import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_trimmer/trim_editor.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:video_trimmer/video_viewer.dart';

class TrimmerView extends StatefulWidget {
  final Trimmer _trimmer;
  TrimmerView(this._trimmer);
  @override
  _TrimmerViewState createState() => _TrimmerViewState();
}

class _TrimmerViewState extends State<TrimmerView> {
  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  Future<String> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String _value;

    await widget._trimmer
        .saveTrimmedVideo(startValue: _startValue, endValue: _endValue)
        .then((value) {
      setState(() {
        _progressVisibility = false;
        _value = value;
      });
    });

    return _value;
  }
  Future<File> moveFile(File sourceFile, String newPath) async {
    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException catch (e) {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trimmer"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.black,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Visibility(
                      visible: _progressVisibility,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                    ),

                    Expanded(
                      child: VideoViewer(),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TrimEditor(
                        viewerHeight: 50.0,
                        viewerWidth: MediaQuery.of(context).size.width,
                        onChangeStart: (value) {
                          _startValue = value;
                        },
                        onChangeEnd: (value) {
                          _endValue = value;
                        },
                        onChangePlaybackState: (value) {
                          setState(() {
                            _isPlaying = value;
                          });
                        },
                      ),
                    ),
                    FlatButton(
                      child: _isPlaying
                          ? Icon(
                        Icons.pause,
                        size: 80.0,
                        color: Colors.white,
                      )
                          : Icon(
                        Icons.play_arrow,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        bool playbackState =
                        await widget._trimmer.videPlaybackControl(
                          startValue: _startValue,
                          endValue: _endValue,
                        );
                        setState(() {
                          _isPlaying = playbackState;
                        });
                      },
                    )
                  ],
                ),
                Positioned(child: Align(

                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _progressVisibility
                        ? null
                        : () async {
                      _saveVideo().then((outputPath) {
                        print('OUTPUT PATH: $outputPath');
                        int dt=DateTime.now().millisecondsSinceEpoch;
                        new File(outputPath).copy("/storage/emulated/0/${dt}.mp4");
                        new File(outputPath).delete();
                        String path="/storage/emulated/0/${dt}.mp4";
                        Navigator.pop(context,path);

                        //moveFile(new File(outputPath), "/storage/emulated/0/skss.mp4");
                        final snackBar = SnackBar(
                          content: Text('Video Saved successfully'),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Icon(Icons.play_circle_fill_sharp,color: Colors.green.shade500,size: 50,),
                    backgroundColor: Colors.white,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}