import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lttw_3_0/MAIN/ADMIN/admin_home.dart';
import 'login.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    // Color background = Theme.of(context).backgroundColor;
    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text("Settings"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: MaterialButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AdminHome()) //MyLogin()) //TODO change the routes
                  ),
              child: Text(
                'LOGIN',
                style: TextStyle(color: secondary),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
