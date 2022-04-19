import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../my_theme.dart';

class TopicTileSmallEvent extends StatelessWidget {
  final String imageName;
  final String text;
  final String text2;
  final String ribbon;
  final Function action;

  TopicTileSmallEvent(
      {this.imageName,
      this.text,
      this.text2,
      this.ribbon,
      this.action,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    // BoxShadow shadow = MyTheme().boxShadow();

    // RibbonLocation location = RibbonLocation.topStart;

    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
        child: Column(
          children: [
            Container(
              height: 150,
              // child: Ribbon(
              //   nearLength: nearLength,
              //   farLength: farLength,
              //   title: ribbon,
              //   titleStyle: TextStyle(
              //     color: secondary,
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold
              //   ),
              color: primary,
              //   location: location,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          'https://app.lttwchurch.org/3/post/uploads/$imageName'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.vertical(
                      top: new Radius.circular(7.0),
                    )),
              ),
              // ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              height: 50,
              child: FittedBox(
                  fit: BoxFit.contain, child: Center(child: Text(text2))),
              decoration: new BoxDecoration(
                  color: primary,
                  // boxShadow: [shadow], //TODO add shadow
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(7.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // String _getDate(String text) {
  //   var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  //   var myDate = text.split("-");
  //   String myMonth = months[int.parse(myDate[1]) -1];
  //   String myDay = myDate[2];
  //   return myMonth + " " + myDay;
  // }
}
