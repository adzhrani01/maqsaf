import 'package:json_annotation/json_annotation.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
part 'favorite_model.g.dart';


///FavoriteModel
@JsonSerializable(explicitToJson: true)
class FavoriteModel {
  final int? id;
  @JsonKey(name: "student")
  int? studentId;
  @JsonKey(name: "item")
  int? itemId;


  FavoriteModel({
    this.id,
    this.studentId,
    this.itemId,
  });

  factory FavoriteModel.fromJson( json) {
    return _$FavoriteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);

}






