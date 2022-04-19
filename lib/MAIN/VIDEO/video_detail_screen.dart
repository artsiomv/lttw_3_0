import 'package:flutter/material.dart';
import 'package:lttw_3_0/MAIN/POST/post_constructor.dart';
import 'package:lttw_3_0/MAIN/tile-models/image_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/two_action_tile.dart';
import 'package:share/share.dart';

import 'package:line_icons/line_icons.dart';

class VideoDetailsScreen extends StatelessWidget {
  final MyPost video;
  VideoDetailsScreen({Key key, @required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color secondary = Theme.of(context).secondaryHeaderColor;
    Color hint = Theme.of(context).hintColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(video.title),
        ),
      ),
      body: Container(
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ImageTile(
              imageName: video.imageName,
            ),
            Divider(
              color: hint,
              height: 1,
            ),
            TwoActionTile(
              name1: 'Play Video',
              name2: 'Share',
              iconOne: LineIcons.play,
              iconTwo: LineIcons.share_square,
              action: () {
                // Navigator.push(
                // context,
                // MaterialPageRoute(
                //   builder: (context) => PlayVideo(video.videoURL)
                // )
                // );
              },
              action2: () {
                Share.share(
                    'Check out our latest podcast \"${video.title}\" \n${video.videoURL}');
              },
            ),
            Divider(
              color: hint,
              height: 1,
            ),
            TextTile(
                body: '${video.speaker} \n${video.dateSpoken}',
                name: 'Description'),
            Divider(color: hint, height: 1),
          ]).toList(),
        ),
      ),
    );
  }
}
