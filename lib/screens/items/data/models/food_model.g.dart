// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      calories: (json['calories'] as num?)?.toInt(),
      description: json['description'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'calories': instance.calories,
      'categories': instance.categories,
      'ingredients': instance.ingredients,
    };
