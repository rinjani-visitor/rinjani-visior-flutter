// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  List<PackageModel> get packageList => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get pricingOffer => throw _privateConstructorUsedError;
  String get currencyUnit => throw _privateConstructorUsedError;
  String? get paymentProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {List<PackageModel> packageList,
      String date,
      String time,
      String pricingOffer,
      String currencyUnit,
      String? paymentProvider});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageList = null,
    Object? date = null,
    Object? time = null,
    Object? pricingOffer = null,
    Object? currencyUnit = null,
    Object? paymentProvider = freezed,
  }) {
    return _then(_value.copyWith(
      packageList: null == packageList
          ? _value.packageList
          : packageList // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      pricingOffer: null == pricingOffer
          ? _value.pricingOffer
          : pricingOffer // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _value.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      paymentProvider: freezed == paymentProvider
          ? _value.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingModelCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$_BookingModelCopyWith(
          _$_BookingModel value, $Res Function(_$_BookingModel) then) =
      __$$_BookingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PackageModel> packageList,
      String date,
      String time,
      String pricingOffer,
      String currencyUnit,
      String? paymentProvider});
}

/// @nodoc
class __$$_BookingModelCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$_BookingModel>
    implements _$$_BookingModelCopyWith<$Res> {
  __$$_BookingModelCopyWithImpl(
      _$_BookingModel _value, $Res Function(_$_BookingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageList = null,
    Object? date = null,
    Object? time = null,
    Object? pricingOffer = null,
    Object? currencyUnit = null,
    Object? paymentProvider = freezed,
  }) {
    return _then(_$_BookingModel(
      packageList: null == packageList
          ? _value._packageList
          : packageList // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      pricingOffer: null == pricingOffer
          ? _value.pricingOffer
          : pricingOffer // ignore: cast_nullable_to_non_nullable
              as String,
      currencyUnit: null == currencyUnit
          ? _value.currencyUnit
          : currencyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      paymentProvider: freezed == paymentProvider
          ? _value.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingModel implements _BookingModel {
  const _$_BookingModel(
      {required final List<PackageModel> packageList,
      required this.date,
      required this.time,
      required this.pricingOffer,
      required this.currencyUnit,
      required this.paymentProvider})
      : _packageList = packageList;

  factory _$_BookingModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookingModelFromJson(json);

  final List<PackageModel> _packageList;
  @override
  List<PackageModel> get packageList {
    if (_packageList is EqualUnmodifiableListView) return _packageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packageList);
  }

  @override
  final String date;
  @override
  final String time;
  @override
  final String pricingOffer;
  @override
  final String currencyUnit;
  @override
  final String? paymentProvider;

  @override
  String toString() {
    return 'BookingModel(packageList: $packageList, date: $date, time: $time, pricingOffer: $pricingOffer, currencyUnit: $currencyUnit, paymentProvider: $paymentProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingModel &&
            const DeepCollectionEquality()
                .equals(other._packageList, _packageList) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pricingOffer, pricingOffer) ||
                other.pricingOffer == pricingOffer) &&
            (identical(other.currencyUnit, currencyUnit) ||
                other.currencyUnit == currencyUnit) &&
            (identical(other.paymentProvider, paymentProvider) ||
                other.paymentProvider == paymentProvider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_packageList),
      date,
      time,
      pricingOffer,
      currencyUnit,
      paymentProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingModelCopyWith<_$_BookingModel> get copyWith =>
      __$$_BookingModelCopyWithImpl<_$_BookingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingModelToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {required final List<PackageModel> packageList,
      required final String date,
      required final String time,
      required final String pricingOffer,
      required final String currencyUnit,
      required final String? paymentProvider}) = _$_BookingModel;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$_BookingModel.fromJson;

  @override
  List<PackageModel> get packageList;
  @override
  String get date;
  @override
  String get time;
  @override
  String get pricingOffer;
  @override
  String get currencyUnit;
  @override
  String? get paymentProvider;
  @override
  @JsonKey(ignore: true)
  _$$_BookingModelCopyWith<_$_BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
