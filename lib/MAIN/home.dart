import 'package:flutter/material.dart';
import 'package:lttw_3_0/MAIN/SETTINGS/settings.dart';

import 'EVENT/events_list.dart';
import 'GET-INVOLVED/get_involved.dart';
import 'PRAYER/prayer_main.dart';
import 'VIDEO/video_types.dart';
import 'home_content.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  // TextEditingController taskTitleInputController;
  // TextEditingController taskDescripInputController;
  // FirebaseUser currentUser;

  void initState() {
    // taskTitleInputController = new TextEditingController();
    // taskDescripInputController = new TextEditingController();
    // this.getCurrentUser();
    super.initState();
  }

  // void getCurrentUser() async {
  //   currentUser = await FirebaseAuth.instance.currentUser();
  // }

  @override
  Widget build(BuildContext context) {
    return _homePageListView(context);
  }

  Widget _homePageListView(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    Color selected = Theme.of(context).selectedRowColor;
    Color background = Theme.of(context).backgroundColor;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    final List<Widget> _children = [
      HomeContent.homeContent(context),
      GetInvolved(),
      VideoTypes(),
      EventsList(),
      Prayer()
    ];

    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: background,
      appBar: AppBar(
        // backgroundColor: background,
        centerTitle: true,
        title: Text("LTTW",
            style: TextStyle(
                fontSize: 35.0, color: secondary, fontWeight: FontWeight.w300)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: secondary,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: secondary,
              size: 25,
            ),
            onPressed: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => NotificationsPage())
              //   );
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: background,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selected,
        unselectedItemColor: secondary,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.supervisor_account),
            label: 'CONNECT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'MEDIA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'EVENTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes),
            label: 'PRAYER',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
