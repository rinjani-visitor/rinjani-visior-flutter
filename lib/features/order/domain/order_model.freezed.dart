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
  int? get person => throw _privateConstructorUsedError;
  set person(int? value) => throw _privateConstructorUsedError;
  String? get proofOfPayment => throw _privateConstructorUsedError;
  set proofOfPayment(String? value) => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  set date(String value) => throw _privateConstructorUsedError;
  Set<String> get time => throw _privateConstructorUsedError;
  set time(Set<String> value) => throw _privateConstructorUsedError;
  Set<String> get addOnId => throw _privateConstructorUsedError;
  set addOnId(Set<String> value) => throw _privateConstructorUsedError;

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
      int? person,
      String? proofOfPayment,
      String date,
      Set<String> time,
      Set<String> addOnId});
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
    Object? person = freezed,
    Object? proofOfPayment = freezed,
    Object? date = null,
    Object? time = null,
    Object? addOnId = null,
  }) {
    return _then(_value.copyWith(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as int?,
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
      addOnId: null == addOnId
          ? _value.addOnId
          : addOnId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? packageId,
      int? person,
      String? proofOfPayment,
      String date,
      Set<String> time,
      Set<String> addOnId});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = freezed,
    Object? person = freezed,
    Object? proofOfPayment = freezed,
    Object? date = null,
    Object? time = null,
    Object? addOnId = null,
  }) {
    return _then(_$_OrderModel(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      person: freezed == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as int?,
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
      addOnId: null == addOnId
          ? _value.addOnId
          : addOnId // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  _$_OrderModel(
      {this.packageId,
      this.person,
      this.proofOfPayment,
      required this.date,
      required this.time,
      required this.addOnId});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  String? packageId;
  @override
  int? person;
  @override
  String? proofOfPayment;
  @override
  String date;
  @override
  Set<String> time;
  @override
  Set<String> addOnId;

  @override
  String toString() {
    return 'OrderModel(packageId: $packageId, person: $person, proofOfPayment: $proofOfPayment, date: $date, time: $time, addOnId: $addOnId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {String? packageId,
      int? person,
      String? proofOfPayment,
      required String date,
      required Set<String> time,
      required Set<String> addOnId}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String? get packageId;
  set packageId(String? value);
  @override
  int? get person;
  set person(int? value);
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
  Set<String> get addOnId;
  set addOnId(Set<String> value);
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
