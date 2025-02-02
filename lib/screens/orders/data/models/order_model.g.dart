// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: (json['id'] as num?)?.toInt(),
      student: json['student'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map(ItemOrderModel.fromJson)
          .toList(),
      totalPrice: json['total_price'] as String?,
      status: json['status'] as String?,
      orderType: json['order_type'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'total_price': instance.totalPrice,
      'order_type': instance.orderType,
      'status': instance.status,
      'date': instance.date?.toIso8601String(),
    };
