import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageTile extends StatelessWidget {

  final String imageName;
  final Function action;

  ImageTile({this.imageName,this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Color primary = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: action,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(color: primary),
          color: primary,
        ),
        child: ListTile (
          contentPadding: EdgeInsets.only(left: 0.0),
          title: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider('https://app.lttwchurch.org/3/post/uploads/$imageName'),
                  fit: BoxFit.cover,
              ),
            )
          ),
        ),
      ),
    );
  }
}