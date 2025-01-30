import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
part 'food_model.g.dart';


///FoodModel
@JsonSerializable(explicitToJson: true)
class FoodModel {
  final int? id;

  String? name;
  String? description;
  String? price;
  String? image;
  int? calories;
  List<int>? categories;
  List<int>? ingredients;


  FoodModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.calories,
    this.description,
    this.categories,
    this.ingredients,
  });

  factory FoodModel.fromJson( json) {
    return _$FoodModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

}






