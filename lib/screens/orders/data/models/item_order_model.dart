import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
part 'item_order_model.g.dart';


///ItemOrderModel
@JsonSerializable(explicitToJson: true)
class ItemOrderModel {
  final int? id;

  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "item")
  int? itemId;
  String? notes;



  ItemOrderModel({
    this.id,
    this.quantity,
    this.notes,
    this.itemId,

  });

  factory ItemOrderModel.fromJson( json) {
    return _$ItemOrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemOrderModelToJson(this);

}






