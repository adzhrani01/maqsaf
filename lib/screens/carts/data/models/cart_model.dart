import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';

import 'item_cart_model.dart';
part 'cart_model.g.dart';


///CartModel
@JsonSerializable(explicitToJson: true)
class CartModel {
  final int? id;

  @JsonKey(name: "student")
  int? studentId;
  List<ItemCartModel>? items;


  CartModel({
    this.id,
    this.studentId,
    this.items,

  });

  factory CartModel.fromJson( json) {
    return _$CartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

}






