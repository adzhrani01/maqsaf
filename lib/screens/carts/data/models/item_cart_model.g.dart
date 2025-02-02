// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCartModel _$ItemCartModelFromJson(Map<String, dynamic> json) =>
    ItemCartModel(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      itemId: (json['item'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      extras:
          (json['extras'] as List<dynamic>?)?.map((e) => e as String).toList(),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
    );

Map<String, dynamic> _$ItemCartModelToJson(ItemCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'item': instance.itemId,
      'notes': instance.notes,
      'extras': instance.extras,
      'delivery_date': instance.deliveryDate?.toIso8601String(),
    };
