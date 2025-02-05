// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'emailAddress')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_limit')
  String? get dailyLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  String? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  int? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'prohibited_ingredients')
  List<ItemModel>? get prohibitedIngredients =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'prohibited_categories')
  List<ItemModel>? get prohibitedCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
  _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
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
        @JsonKey(name: 'prohibited_ingredients')
        List<ItemModel>? prohibitedIngredients,
        @JsonKey(name: 'prohibited_categories')
        List<ItemModel>? prohibitedCategories});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? dailyLimit = freezed,
    Object? balance = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? prohibitedIngredients = freezed,
    Object? prohibitedCategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
      as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
      as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
      as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
      as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
      as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
      as String?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
      as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
      as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
      as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
      as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
      as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
      as String?,
      prohibitedIngredients: freezed == prohibitedIngredients
          ? _value.prohibitedIngredients
          : prohibitedIngredients // ignore: cast_nullable_to_non_nullable
      as List<ItemModel>?,
      prohibitedCategories: freezed == prohibitedCategories
          ? _value.prohibitedCategories
          : prohibitedCategories // ignore: cast_nullable_to_non_nullable
      as List<ItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
      _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
  __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
        @JsonKey(name: 'prohibited_ingredients')
        List<ItemModel>? prohibitedIngredients,
        @JsonKey(name: 'prohibited_categories')
        List<ItemModel>? prohibitedCategories});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? dailyLimit = freezed,
    Object? balance = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? prohibitedIngredients = freezed,
    Object? prohibitedCategories = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
      as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
      as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
      as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
      as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
      as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
      as String?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
      as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
      as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
      as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
      as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
      as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
      as String?,
      prohibitedIngredients: freezed == prohibitedIngredients
          ? _value._prohibitedIngredients
          : prohibitedIngredients // ignore: cast_nullable_to_non_nullable
      as List<ItemModel>?,
      prohibitedCategories: freezed == prohibitedCategories
          ? _value._prohibitedCategories
          : prohibitedCategories // ignore: cast_nullable_to_non_nullable
      as List<ItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {this.id,
        @JsonKey(name: 'first_name') this.firstName,
        @JsonKey(name: 'last_name') this.lastName,
        @JsonKey(name: 'userName') this.userName,
        @JsonKey(name: 'emailAddress') this.email,
        @JsonKey(name: 'image') this.image,
        @JsonKey(name: 'daily_limit') this.dailyLimit,
        @JsonKey(name: 'balance') this.balance,
        @JsonKey(name: 'height') this.height,
        @JsonKey(name: 'weight') this.weight,
        @JsonKey(name: 'age') this.age,
        @JsonKey(name: 'gender') this.gender,
        @JsonKey(name: 'prohibited_ingredients')
        final List<ItemModel>? prohibitedIngredients,
        @JsonKey(name: 'prohibited_categories')
        final List<ItemModel>? prohibitedCategories})
      : _prohibitedIngredients = prohibitedIngredients,
        _prohibitedCategories = prohibitedCategories,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'userName')
  final String? userName;
  @override
  @JsonKey(name: 'emailAddress')
  final String? email;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'daily_limit')
  final String? dailyLimit;
  @override
  @JsonKey(name: 'balance')
  final String? balance;
  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'weight')
  final int? weight;
  @override
  @JsonKey(name: 'age')
  final int? age;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  final List<ItemModel>? _prohibitedIngredients;
  @override
  @JsonKey(name: 'prohibited_ingredients')
  List<ItemModel>? get prohibitedIngredients {
    final value = _prohibitedIngredients;
    if (value == null) return null;
    if (_prohibitedIngredients is EqualUnmodifiableListView)
      return _prohibitedIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ItemModel>? _prohibitedCategories;
  @override
  @JsonKey(name: 'prohibited_categories')
  List<ItemModel>? get prohibitedCategories {
    final value = _prohibitedCategories;
    if (value == null) return null;
    if (_prohibitedCategories is EqualUnmodifiableListView)
      return _prohibitedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, email: $email, image: $image, dailyLimit: $dailyLimit, balance: $balance, height: $height, weight: $weight, age: $age, gender: $gender, prohibitedIngredients: $prohibitedIngredients, prohibitedCategories: $prohibitedCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dailyLimit, dailyLimit) ||
                other.dailyLimit == dailyLimit) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._prohibitedIngredients, _prohibitedIngredients) &&
            const DeepCollectionEquality()
                .equals(other._prohibitedCategories, _prohibitedCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      userName,
      email,
      image,
      dailyLimit,
      balance,
      height,
      weight,
      age,
      gender,
      const DeepCollectionEquality().hash(_prohibitedIngredients),
      const DeepCollectionEquality().hash(_prohibitedCategories));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {final int? id,
        @JsonKey(name: 'first_name') final String? firstName,
        @JsonKey(name: 'last_name') final String? lastName,
        @JsonKey(name: 'userName') final String? userName,
        @JsonKey(name: 'emailAddress') final String? email,
        @JsonKey(name: 'image') final String? image,
        @JsonKey(name: 'daily_limit') final String? dailyLimit,
        @JsonKey(name: 'balance') final String? balance,
        @JsonKey(name: 'height') final int? height,
        @JsonKey(name: 'weight') final int? weight,
        @JsonKey(name: 'age') final int? age,
        @JsonKey(name: 'gender') final String? gender,
        @JsonKey(name: 'prohibited_ingredients')
        final List<ItemModel>? prohibitedIngredients,
        @JsonKey(name: 'prohibited_categories')
        final List<ItemModel>? prohibitedCategories}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
  _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'userName')
  String? get userName;
  @override
  @JsonKey(name: 'emailAddress')
  String? get email;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'daily_limit')
  String? get dailyLimit;
  @override
  @JsonKey(name: 'balance')
  String? get balance;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(name: 'weight')
  int? get weight;
  @override
  @JsonKey(name: 'age')
  int? get age;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'prohibited_ingredients')
  List<ItemModel>? get prohibitedIngredients;
  @override
  @JsonKey(name: 'prohibited_categories')
  List<ItemModel>? get prohibitedCategories;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
