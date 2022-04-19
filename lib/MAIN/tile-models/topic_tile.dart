import 'package:flutter/material.dart';

import '../my_theme.dart';

class TopicTile extends StatelessWidget {
  final String imageName;
  final String text;
  final Function action;

  TopicTile({this.imageName, this.text, this.action, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    // BoxShadow shadow = MyTheme().boxShadow();

    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageName),
                    fit: BoxFit.cover,
                  ),
                  // boxShadow: [MyTheme.setBoxShadow()],
                  borderRadius: new BorderRadius.vertical(
                    top: new Radius.circular(7.0),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              height: 60,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                    child: Text(
                  text,
                )),
              ),
              decoration: new BoxDecoration(
                  color: primary,
                  // boxShadow: [shadow],
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(7.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
