import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lttw_3_0/MAIN/tile-models/featured_event.dart';
import 'package:lttw_3_0/MAIN/tile-models/featured_video.dart';
import 'dart:convert';
import 'dart:io';

import 'EVENT/event_detail_screen.dart';
import 'POST/post_constructor.dart';
import 'VIDEO/video_detail_screen.dart';

class HomeContent {
  static Widget homeContent(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: getHomePagePosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: new CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return new Text("fetch error");
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                MyPost post = snapshot.data[index];
                if (post.type == "Sermon") {
                  return TopicTileFeaturedVideos(
                    action: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              VideoDetailsScreen(video: post)));
                    },
                    text: post.title,
                    imageName: post.imageName,
                  );
                } else if (post.type == "Event") {
                  return TopicTileFeaturedEvents(
                    action: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(event: post)));
                    },
                    text: post.title,
                    imageName: post.imageName,
                  );
                } else {
                  return Container();
                }
              },
            );
        }
        return Container();
      },
    );

    return Container(child: futureBuilder);
  }
}

Future<List<Object>> getHomePagePosts() async {
  List<MyPost> list = new List();
  // List<MyPost> eventList = new List();
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //call to a remote file
      final response =
          await http.get('https://app.lttwchurch.org/3/get/getHomePage.php');
      //decode to json
      final usersResponse = json.decode(response.body);

      //loop throught an array of data
      for (var item in usersResponse) {
        final post = MyPost.fromJson(item);
        list.add(post);
      }
    }
  } on SocketException catch (_) {
    print('not connected');
  }
  return list;
}
