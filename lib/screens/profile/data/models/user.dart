import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/item_model.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
// @JsonSerializable(explicitToJson: true)
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'userName') String? userName,
    @JsonKey(name: 'emailAddress') String? email,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'daily_limit') String? dailyLimit,
    @JsonKey(name: 'balance') String? balance,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'weight') int? weight,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'prohibited_ingredients') List<ItemModel>? prohibitedIngredients,
    @JsonKey(name: 'prohibited_categories') List<ItemModel>?  prohibitedCategories,
  }) = _UserModel;

  factory UserModel.fromJson( json) => _$UserModelFromJson(json);

  String get completeName => "${firstName ?? ''} ${lastName ?? ''}".trim();
}

//
//
// ///UserModel
// @JsonSerializable()
// class UserModel {
//   int? id;
//   @JsonKey(name: "name")
//   String? firstName;
//   @JsonKey(name: "surname")
//   String? lastName;
//   @JsonKey(name: "userName")
//   String? userName;
//   @JsonKey(name: "emailAddress")
//   String? email;
//   @JsonKey(name: "phoneNumber")
//   String? phoneNumber;
//   @JsonKey(name: "isPhoneNumberConfirmed")
//   bool? isPhoneNumberConfirmed;
//   @JsonKey(name: "timezone")
//   String? timezone;
//   @JsonKey(name: "qrCodeSetupImageUrl")
//   String? qrCodeSetupImageUrl;
//   @JsonKey(name: "isGoogleAuthenticatorEnabled")
//   bool? isGoogleAuthenticatorEnabled;
//   @JsonKey(name: "profilePictureId")
//   String? profilePictureId;
//
//   UserModel({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.userName,
//     this.email,
//     this.phoneNumber,
//     this.isPhoneNumberConfirmed,
//     this.timezone,
//     this.qrCodeSetupImageUrl,
//     this.isGoogleAuthenticatorEnabled,
//     this.profilePictureId,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return _$UserModelFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() => _$UserModelToJson(this);
//
//   String get completeName => "$firstName $lastName";
// }
