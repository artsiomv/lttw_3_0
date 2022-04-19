import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lttw_3_0/MAIN/ADMIN/post_event.dart';
import 'package:lttw_3_0/MAIN/ADMIN/post_sermon.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_button_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_tile.dart';

class AdminPost extends StatefulWidget {
  @override
  _AdminPost createState() => _AdminPost();
}

class _AdminPost extends State<AdminPost> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    // Color background = Theme.of(context).backgroundColor;
    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text("Admin Create"),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            RaisedButton(
              color: secondary,
              child: Text(
                "ADD SERMON",
                style: TextStyle(color: primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostSermon()));
              },
            ),
            RaisedButton(
              color: secondary,
              child: Text(
                "ADD TESTIMONY",
                style: TextStyle(color: primary),
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: secondary,
              child: Text(
                "ADD EVENT",
                style: TextStyle(color: primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostEvent()));
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
