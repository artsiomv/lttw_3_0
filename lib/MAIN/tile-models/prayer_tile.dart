import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PrayerTile extends StatelessWidget {
  final String title;
  final String body;

  PrayerTile({this.title, this.body, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: secondary,
        ),
        child: ListTile(
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '$title\n',
                  style: TextStyle(color: primary, fontSize: 15),
                ),
                TextSpan(
                  text: '$body',
                  style: TextStyle(color: primary, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
