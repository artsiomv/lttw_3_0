import 'package:json_annotation/json_annotation.dart';
part 'post_constructor.g.dart'; //g means generated - flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class MyPost {
  String id;
  String title;
  String videoURL;
  String speaker;
  String dateSpoken;
  String description;
  String imageName;
  String startTime;
  String startDate;
  String endDate;
  String address;
  String type;
  String timestamp;
  String homePage;
  String position;

MyPost({
    this.id,
      this.title,
      this.videoURL,
      this.speaker,
      this.dateSpoken,
      this.description,
      this.imageName,
      this.startTime,
      this.startDate,
      this.endDate,
      this.address,
      this.type,
      this.timestamp,
      this.homePage,
      this.position
    });
     factory MyPost.fromJson(Map<String, dynamic> item) => _$MyPostFromJson(item);
}