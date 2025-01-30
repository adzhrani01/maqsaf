import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../items/data/models/food_model.dart';
part 'item_cart_model.g.dart';


///ItemCartModel
@JsonSerializable(explicitToJson: true)
class ItemCartModel {
  final int? id;

  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "item")
  int? itemId;
  @JsonKey(name: "item",includeToJson:false,includeFromJson:false)
  FoodModel? item;
  String? notes;
  List<String>? extras;
  @JsonKey(name: "delivery_date")
  DateTime? deliveryDate;
  @JsonKey(includeToJson:false,includeFromJson:false)
  String? deliveryTime;



  ItemCartModel({
    this.id,
    this.quantity,
    this.itemId,
    this.notes,
    this.extras,
    this.deliveryDate,
    this.deliveryTime,
    this.item,

  });

  factory ItemCartModel.fromJson( json) {
    return _$ItemCartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemCartModelToJson(this);

}






