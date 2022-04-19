import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../my_theme.dart';

class TopicTileFeaturedEvents extends StatelessWidget {
  final String imageName;
  final String text;
  final Function action;

  TopicTileFeaturedEvents(
      {this.imageName, this.text, this.action, Key key, BuildContext context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    // Color accent = Theme.of(context).accentColor;
    // Color hint = Theme.of(context).hintColor;
    // BoxShadow shadow = MyTheme().boxShadow();

    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://app.lttwchurch.org/3/post/uploads/$imageName'),
                    fit: BoxFit.cover,
                  ),
                  // boxShadow: [MyTheme.setBoxShadow()],
                  borderRadius: new BorderRadius.vertical(
                    top: new Radius.circular(7.0),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              height: 60,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    text,
                    // style: body1,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                  color: primary,
                  // boxShadow: [shadow],
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(7.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
