// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_constructor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPost _$MyPostFromJson(Map<String, dynamic> json) {
  return MyPost(
    id: json['id'] as String,
    title: json['title'] as String,
    videoURL: json['videoURL'] as String,
    speaker: json['speaker'] as String,
    dateSpoken: json['dateSpoken'] as String,
    description: json['description'] as String,
    imageName: json['imageName'] as String,
    startTime: json['startTime'] as String,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    address: json['address'] as String,
    type: json['type'] as String,
    timestamp: json['timestamp'] as String,
    homePage: json['homePage'] as String,
    position: json['position'] as String,
  );
}

Map<String, dynamic> _$MyPostToJson(MyPost instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'videoURL': instance.videoURL,
      'speaker': instance.speaker,
      'dateSpoken': instance.dateSpoken,
      'description': instance.description,
      'imageName': instance.imageName,
      'startTime': instance.startTime,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'address': instance.address,
      'type': instance.type,
      'timestamp': instance.timestamp,
      'homePage': instance.homePage,
      'position': instance.position,
    };
