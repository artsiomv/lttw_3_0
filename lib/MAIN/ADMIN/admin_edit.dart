import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_button_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_tile.dart';

class AdminEdit extends StatefulWidget {
  @override
  _AdminEdit createState() => _AdminEdit();
}

class _AdminEdit extends State<AdminEdit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Color background = Theme.of(context).backgroundColor;
    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text("Admin Edit"),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            RaisedButton(
              color: Colors.green,
              child: Text("EDIT SERMON"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => AdminPost()
                // ));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("EDIT TESTIMONY"),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("EDIT EVENT"),
              onPressed: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}
