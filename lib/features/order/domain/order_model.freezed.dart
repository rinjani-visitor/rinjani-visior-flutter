// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String? get packageId => throw _privateConstructorUsedError;
  set packageId(String? value) => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  set product(ProductModel? value) => throw _privateConstructorUsedError;
  int get person => throw _privateConstructorUsedError;
  set person(int value) => throw _privateConstructorUsedError;
  String? get proofOfPayment => throw _privateConstructorUsedError;
  set proofOfPayment(String? value) => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  set date(String value) => throw _privateConstructorUsedError;
  Set<String> get time => throw _privateConstructorUsedError;
  set time(Set<String> value) => throw _privateConstructorUsedError;
  Set<AddOnModel> get addOn => throw _privateConstructorUsedError;
  set addOn(Set<AddOnModel> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String? packageId,
      ProductModel? product,
      int person,
      String? proofOfPayment,
      String date,
      Set<String> time,
      Set<AddOnModel> addOn});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = freezed,
    Object? product = freezed,
    Object? person = null,
    Object? proofOfPayment = freezed,
    Object? date = null,
    Object? time = null,
    Object? addOn = null,
  }) {
    return _then(_value.copyWith(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as int,
      proofOfPayment: freezed == proofOfPayment
          ? _value.proofOfPayment
          : proofOfPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as Set<AddOnModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? packageId,
      ProductModel? product,
      int person,
      String? proofOfPayment,
      String date,
      Set<String> time,
      Set<AddOnModel> addOn});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = freezed,
    Object? product = freezed,
    Object? person = null,
    Object? proofOfPayment = freezed,
    Object? date = null,
    Object? time = null,
    Object? addOn = null,
  }) {
    return _then(_$OrderModelImpl(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as int,
      proofOfPayment: freezed == proofOfPayment
          ? _value.proofOfPayment
          : proofOfPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as Set<AddOnModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  _$OrderModelImpl(
      {this.packageId,
      this.product,
      this.person = 0,
      this.proofOfPayment,
      required this.date,
      required this.time,
      required this.addOn})
      : super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  String? packageId;
  @override
  ProductModel? product;
  @override
  @JsonKey()
  int person;
  @override
  String? proofOfPayment;
  @override
  String date;
  @override
  Set<String> time;
  @override
  Set<AddOnModel> addOn;

  @override
  String toString() {
    return 'OrderModel(packageId: $packageId, product: $product, person: $person, proofOfPayment: $proofOfPayment, date: $date, time: $time, addOn: $addOn)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  factory _OrderModel(
      {String? packageId,
      ProductModel? product,
      int person,
      String? proofOfPayment,
      required String date,
      required Set<String> time,
      required Set<AddOnModel> addOn}) = _$OrderModelImpl;
  _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String? get packageId;
  set packageId(String? value);
  @override
  ProductModel? get product;
  set product(ProductModel? value);
  @override
  int get person;
  set person(int value);
  @override
  String? get proofOfPayment;
  set proofOfPayment(String? value);
  @override
  String get date;
  set date(String value);
  @override
  Set<String> get time;
  set time(Set<String> value);
  @override
  Set<AddOnModel> get addOn;
  set addOn(Set<AddOnModel> value);
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
