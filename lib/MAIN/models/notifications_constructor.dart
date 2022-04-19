import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableNotifications = 'notification';
final String columnID = 'id';
final String columnTitle = 'title';
final String columnBody = 'body';

// data model class
class MyNotification {
  int id;
  String title;
  String body;

  MyNotification({this.id, this.title, this.body});

  MyNotification.fromMap(Map<String, dynamic> map ) :
    id = map['id'],
    title = map['title'],
    body = map['body'];

  factory MyNotification.fromJson(Map<String, dynamic> json ) {
    return MyNotification(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  factory MyNotification.fromJsonLocal(Map<String, dynamic> json) {
    return MyNotification(
      id: int.parse(json['id']),
      title: json['title'],
      body: json['body'],
    );
  }
  // convenience method to create a Map from this Event object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnBody: body,
    };
    if (id != null) {
      map[columnID] = id;
    }
    return map;
  }
}
