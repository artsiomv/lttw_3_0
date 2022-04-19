import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_button_tile.dart';
import 'package:lttw_3_0/MAIN/tile-models/text_tile.dart';

class AdminDelete extends StatefulWidget {
  @override
  _AdminDelete createState() => _AdminDelete();
}

class _AdminDelete extends State<AdminDelete> {
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
          title: Text("Admin Delete"),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            RaisedButton(
              color: Colors.green,
              child: Text("DELETE SERMON"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => AdminPost()
                // ));
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("DELETE TESTIMONY"),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("DELETE EVENT"),
              onPressed: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}
