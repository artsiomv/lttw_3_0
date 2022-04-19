import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lttw_3_0/MAIN/POST/post_constructor.dart';
// import 'package:lttw_3_0/MAIN/models/video_constructor.dart';

class VideoListTile extends StatelessWidget {

  final MyPost video;
  final Function action;

  VideoListTile({this.video, this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;

    return GestureDetector(
      onTap: action,
      child: Container(
        height: 70,
        padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(color: primary),
          color: primary
        ),
        child: Center(
          child: ListTile (
            contentPadding: EdgeInsets.only(left: 5.0),
            leading: Container(
              padding: EdgeInsets.all(0.0),
              width:90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: CachedNetworkImageProvider('https://app.lttwchurch.org/3/post/uploads/${video.imageName}'),
                  fit: BoxFit.cover,
                ),
              )
            ),
            title: Text(video.title, style: TextStyle(color: secondary, fontWeight: FontWeight.bold)),
            // subtitle: Text("video.title eiwfubewi ", style: TextStyle(color: Colors.white70, )),
            trailing: Icon(Icons.chevron_right, color: secondary,),
          ),
        ),
      ),
    );
  }
}
