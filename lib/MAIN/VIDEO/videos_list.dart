import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lttw_3_0/MAIN/POST/post_constructor.dart';
import 'package:lttw_3_0/MAIN/VIDEO/video_detail_screen.dart';
import 'dart:convert';
import 'dart:io';

// import 'package:lttw_3_0/MAIN/models/video_constructor.dart';
import 'package:lttw_3_0/MAIN/tile-models/video_list_tile.dart';

class VideosList extends StatefulWidget {
  VideosList({Key key}) : super(key: key);

  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text('SERMONS'),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getVideos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  MyPost video = snapshot.data[index];
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                      child: VideoListTile(
                        video: video,
                        action: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VideoDetailsScreen(video: video)));
                        },
                      ));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<MyPost>> _getVideos() async {
    List<MyPost> list = [];
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //call to a remote file
        final response =
            await http.get('https://app.lttwchurch.org/3/get/getSermons.php');
        //decode to json
        final usersResponse = json.decode(response.body);
        //loop throught an array of data
        for (var item in usersResponse) {
          final video = MyPost.fromJson(item);
          list.add(video);
          // if (await _needToAdd(id: video.id) == true) {
          //   await _save(video: video);
          // }
          // else if (await _needToUpdate(video: video) == true) {
          //   await _update(video: video);
          // }
        }
      }
    } on SocketException catch (_) {
      print('not connected');
    }
    // VideoDatabaseHelper helper = VideoDatabaseHelper.instance;

    // list = await helper.queryAllVideos();

    return list;
  }

  // Future<List<MyVideo>> getLocalVideos() async {
  //   VideoDatabaseHelper helper = VideoDatabaseHelper.instance;
  //   List<MyVideo> list = await helper.queryAllVideos();
  //   return list;
  // }

  // _needToAdd({id: int}) async {
  //   VideoDatabaseHelper helper = VideoDatabaseHelper.instance;
  //   MyVideo video = await helper.queryVideo(id);
  //   if (video == null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // _needToUpdate({video: MyVideo}) async {
  //   VideoDatabaseHelper helper = VideoDatabaseHelper.instance;
  //   MyVideo myVideo = await helper.queryVideo(video.id);
  //   if (myVideo.isDuplicate(video)) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  // _save({video: MyVideo}) async {
  //   // MyVideo myVideo = MyVideo();
  //   // myVideo.id = video.id;
  //   // myVideo.title = video.title;
  //   // myVideo.videoURL = video.videoURL;
  //   // myVideo.imageName = video.imageName;
  //   // myVideo.speaker = video.speaker;
  //   // myVideo.dateSpoken = video.dateSpoken;
  //   VideoDatabaseHelper helper = VideoDatabaseHelper.instance;
  //   await helper.insert(video);
  // }

  // _update({video: MyVideo}) async {
  //   // MyVideo myVideo = MyVideo();
  //   // myVideo.id = video.id;
  //   // myVideo.title = video.title;
  //   // myVideo.videoURL = video.videoURL;
  //   // myVideo.imageName = video.imageName;
  //   // myVideo.speaker = video.speaker;
  //   // myVideo.dateSpoken = video.dateSpoken;
  //   VideoDatabaseHelper helper = VideoDatabaseHelper.instance;
  //   await helper.update(video);
  // }
}
