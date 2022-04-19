import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lttw_3_0/MAIN/ADMIN/admin_delete.dart';
import 'package:lttw_3_0/MAIN/ADMIN/admin_edit.dart';
import 'package:lttw_3_0/MAIN/ADMIN/admin_post.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_button_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_tile.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHome createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
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
          title: Text("Admin"),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            RaisedButton(
              color: secondary,
              child: Text(
                "ADD",
                style: TextStyle(color: primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPost()));
              },
            ),
            RaisedButton(
              color: secondary,
              child: Text(
                "EDIT",
                style: TextStyle(color: primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminEdit()));
              },
            ),
            RaisedButton(
              color: secondary,
              child: Text(
                "DELETE",
                style: TextStyle(color: primary),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminDelete()));
              },
            ),
            RaisedButton(
              color: secondary,
              child: Text(
                "MANAGE HOME SCREEN",
                style: TextStyle(color: primary),
              ),
              onPressed: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}
