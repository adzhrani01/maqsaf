// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      id: (json['id'] as num?)?.toInt(),
      studentId: (json['student'] as num?)?.toInt(),
      itemId: (json['item'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.studentId,
      'item': instance.itemId,
    };
