import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';


///ItemModel
@JsonSerializable(explicitToJson: true)
class ItemModel {
  final int? id;

  String? name;
  String? description;


  ItemModel({
    this.id,
    this.name,
    this.description,
  });

  factory ItemModel.fromJson( json) {
    return _$ItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

}






