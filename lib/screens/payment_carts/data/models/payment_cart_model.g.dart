// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCartModel _$PaymentCartModelFromJson(Map<String, dynamic> json) =>
    PaymentCartModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: json['number'] as String?,
      type: json['type'] as String?,
      expireDate: json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String),
      cvv: json['cvv'] as String?,
      isDefault: json['is_default'] as bool?,
    );

Map<String, dynamic> _$PaymentCartModelToJson(PaymentCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'type': instance.type,
      'cvv': instance.cvv,
      'expire_date': instance.expireDate?.toIso8601String(),
      'is_default': instance.isDefault,
    };
