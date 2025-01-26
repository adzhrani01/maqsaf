import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
part 'item_cart_model.g.dart';


///ItemCartModel
@JsonSerializable(explicitToJson: true)
class ItemCartModel {
  final int? id;

  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "item")
  int? itemId;



  ItemCartModel({
    this.id,
    this.quantity,
    this.itemId,

  });

  factory ItemCartModel.fromJson( json) {
    return _$ItemCartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemCartModelToJson(this);

}






