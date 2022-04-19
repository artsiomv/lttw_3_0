import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lttw_3_0/MAIN/POST/post_constructor.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:lttw_3_0/MAIN/tile-models/prayer_tile.dart';

class Prayer extends StatefulWidget {
  @override
  _Prayer createState() => _Prayer();
}

class _Prayer extends State<Prayer> {
  final TextEditingController _titleFieldController = TextEditingController();
  final TextEditingController _bodyFieldController = TextEditingController();
  final String uri = 'https://app.lttwchurch.org/3/get/getPrayers.php';

  Future<List<MyPost>> users;

  @override
  void initState() {
    super.initState();
    users = _getPrayers();
  }

  Future<List<MyPost>> _getPrayers() async {
    List<MyPost> list = [];
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<MyPost> listOfPrayers = items.map<MyPost>((json) {
        return MyPost.fromJson(json);
      }).toList();
      for (var item in listOfPrayers) {
        list.add(item);
      }
    } else {
      print('not connected');
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[800],
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 3 -
                      50,
                  height: 50,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Have prayer request?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: FlatButton(
                    color: Colors.yellow[700],
                    onPressed: () => _displayDialog(context),
                    child: Text(
                      "REQUEST",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: prayerPage(context)),
        ],
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextField(
              controller: _titleFieldController,
              decoration: InputDecoration(
                  hintText: "Your name",
                  hintStyle: TextStyle(color: Colors.grey[400])),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    minLines: 1,
                    maxLines: 10,
                    controller: _bodyFieldController,
                    decoration: InputDecoration(
                        hintText: "Prayer request",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  _titleFieldController.clear();
                  _bodyFieldController.clear();
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text(
                    'SUBMIT'), //TODO add a popup for the user that Prayer is submitted
                onPressed: () {
                  _postPrayerToServer(
                      _titleFieldController.text, _bodyFieldController.text);
                  _titleFieldController.clear();
                  _bodyFieldController.clear();
                  Navigator.of(context).pop();
                  setState(() {
                    users = _getPrayers();
                  });
                },
              ),
            ],
          );
        });
  }

  _postPrayerToServer(String title, String description) async {
    if (title != "" && description != "") {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //call to a remote file
          await http.post(
              'https://app.lttwchurch.org/3/post/postPrayer.php?title=$title&description=$description');
        }
      } on SocketException catch (_) {
        print('not connected');
      }
    }
  }

  Widget prayerPage(BuildContext context) {
    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              MyPost prayer = snapshot.data[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child:
                    PrayerTile(body: prayer.description, title: prayer.title),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
