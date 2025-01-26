// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: (json['id'] as num?)?.toInt(),
      studentId: (json['student'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map(ItemCartModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'student': instance.studentId,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
