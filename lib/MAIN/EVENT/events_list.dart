import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lttw_3_0/MAIN/POST/post_constructor.dart';
import 'package:lttw_3_0/MAIN/tile-models/small_event.dart';
import 'dart:convert';
import 'event_detail_screen.dart';

class EventsList extends StatefulWidget {
  EventsList({Key key}) : super(key: key);

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  Future<List<MyPost>> get;

  @override
  void initState() {
    super.initState();
    get = _fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      body: Container(
        child: FutureBuilder(
          future: get,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  MyPost event = snapshot.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventDetailsScreen(event: event)));
                    },
                    child: TopicTileSmallEvent(
                      text: event.startDate,
                      text2: event.title,
                      ribbon: event.type,
                      imageName: event.imageName,
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Future<List<MyPost>> _fetchEvents() async {
  List<MyPost> list = [];
  final response =
      await http.get('https://app.lttwchurch.org/3/get/getEvents.php');
  final usersResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    for (var item in usersResponse) {
      final event = MyPost.fromJson(item);
      list.add(event);
    }
  } else {
    throw Exception('Failed to load event');
  }
  return list;
}
