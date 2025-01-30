import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationModel {


  int? id;
  @JsonKey(name: "receiver")
  String? receiver;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "topic")
  String? topic;

  NotificationModel({
    this.receiver,
    this.body,
    this.topic,
    this.id,
  });

  factory NotificationModel.fromJson( json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}