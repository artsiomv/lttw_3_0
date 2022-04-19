import 'package:flutter/material.dart';
import 'package:lttw_3_0/MAIN/VIDEO/videos_list.dart';
import 'package:lttw_3_0/MAIN/tile-models/topic_tile.dart';

class VideoTypes extends StatelessWidget {
  VideoTypes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          _sermonTile(context),
          _testimoniesTile(context),
        ]).toList(),
      ),
    );
  }
}

Widget _sermonTile(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VideosList()));
    },
    child: TopicTile(
      text: "SERMONS",
      imageName: "lib/assets/images/pic1.jpg",
    ),
  );
}

Widget _testimoniesTile(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => VideosList()));
    },
    child: TopicTile(
      text: "TESTIMONIES",
      imageName: "lib/assets/images/pic2.jpg",
    ),
  );
}
