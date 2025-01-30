// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrderModel _$ItemOrderModelFromJson(Map<String, dynamic> json) =>
    ItemOrderModel(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      item: json['item'] as String?,
    );

Map<String, dynamic> _$ItemOrderModelToJson(ItemOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'item': instance.item,
      'notes': instance.notes,
    };
