import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TextTile extends StatelessWidget {

  final String body;
  final String name;
  final Function action;

  TextTile({this.body, this.name, this.action, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;

    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: primary,
        ),
        child: ListTile (
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: '$name', style: TextStyle(color: secondary, fontSize: 14), ),
                TextSpan(text: '\n\n$body', style: TextStyle(color: secondary, fontSize: 16), ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
