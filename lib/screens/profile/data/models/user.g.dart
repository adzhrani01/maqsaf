// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
          id: (json['id'] as num?)?.toInt(),
          firstName: json['first_name'] as String?,
          lastName: json['last_name'] as String?,
          userName: json['userName'] as String?,
          email: json['emailAddress'] as String?,
          image: json['image'] as String?,
          dailyLimit: json['daily_limit'] as String?,
          balance: json['balance'] as String?,
          height: json['height'] as String?,
          weight: json['weight'] as String?,
          age: json['age'] as String?,
          gender: json['gender'] as String?,
          prohibitedIngredients: (json['prohibited_ingredients'] as List<dynamic>?)
              ?.map(ItemModel.fromJson)
              .toList(),
          prohibitedCategories: (json['prohibited_categories'] as List<dynamic>?)
              ?.map(ItemModel.fromJson)
              .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
          'id': instance.id,
          'first_name': instance.firstName,
          'last_name': instance.lastName,
          'userName': instance.userName,
          'emailAddress': instance.email,
          'image': instance.image,
          'daily_limit': instance.dailyLimit,
          'balance': instance.balance,
          'height': instance.height,
          'weight': instance.weight,
          'age': instance.age,
          'gender': instance.gender,
          'prohibited_ingredients': instance.prohibitedIngredients,
          'prohibited_categories': instance.prohibitedCategories,
    };
