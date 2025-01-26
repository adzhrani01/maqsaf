import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';

import 'item_order_model.dart';
part 'order_model.g.dart';


///OrderModel
@JsonSerializable(explicitToJson: true)
class OrderModel {
  final int? id;

  @JsonKey(name: "student")
  int? studentId;
  List<ItemOrderModel>? items;
  @JsonKey(name: "total_price")
  String? totalPrice;
  @JsonKey(name: "order_type")
  String? orderType;
  String? status;
  DateTime? date;


  OrderModel({
    this.id,
    this.studentId,
    this.items,
    this.totalPrice,
    this.status,
    this.orderType,
    this.date,

  });

  factory OrderModel.fromJson( json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}






