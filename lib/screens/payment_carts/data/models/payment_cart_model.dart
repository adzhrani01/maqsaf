import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
part 'payment_cart_model.g.dart';


///PaymentCartModel
@JsonSerializable(explicitToJson: true)
class PaymentCartModel {
  final int? id;
  @JsonKey(name: "name")
  String? name;
  String? number;
  String? type;
  String? cvv;
  @JsonKey(name: "expire_date")
  DateTime? expireDate;
  @JsonKey(name: "is_default")
  bool? isDefault;


  PaymentCartModel({
    this.id,
    this.name,
    this.number,
    this.type,
    this.expireDate,
    this.cvv,
    this.isDefault,
  });

  factory PaymentCartModel.fromJson( json) {
    return _$PaymentCartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentCartModelToJson(this);

}






