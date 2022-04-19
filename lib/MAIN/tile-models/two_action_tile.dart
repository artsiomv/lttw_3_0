import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TwoActionTile extends StatefulWidget {
  final String name1;
  final String name2;
  final iconOne;
  final iconTwo;
  final Function action;
  final Function action2;

  TwoActionTile(
      {this.name1,
      this.name2,
      this.iconOne,
      this.iconTwo,
      this.action,
      this.action2,
      Key key})
      : super(key: key);

  @override
  _TwoActionTileState createState() => _TwoActionTileState();
}

class _TwoActionTileState extends State<TwoActionTile> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    Color accent = Theme.of(context).accentColor;
    Color hint = Theme.of(context).hintColor;
    TextStyle body2 = Theme.of(context).textTheme.body2;

    return Container(
      decoration: BoxDecoration(color: primary),
      width: 50,
      child: ListTile(
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 499,
                child: FlatButton(
                  splashColor: hint,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        widget.iconOne,
                        size: 35,
                        color: secondary,
                      ),
                      Text(widget.name1, style: TextStyle(color: secondary))
                    ],
                  ),
                  onPressed: () {
                    widget.action();
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: hint,
                  child: Column(
                    children: <Widget>[Text('\n\n')],
                  ),
                ),
              ),
              Expanded(
                flex: 499,
                child: FlatButton(
                  splashColor: hint,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        widget.iconTwo,
                        size: 35,
                        color: secondary,
                      ),
                      Text(widget.name2, style: TextStyle(color: secondary))
                    ],
                  ),
                  onPressed: () {
                    widget.action2();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
