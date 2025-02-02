// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      receiver: json['receiver'] as String?,
      body: json['body'] as String?,
      topic: json['topic'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiver': instance.receiver,
      'body': instance.body,
      'topic': instance.topic,
    };
