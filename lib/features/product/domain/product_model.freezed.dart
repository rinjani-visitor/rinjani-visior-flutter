// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _PackageModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get packageId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get locationUrl => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;

  /// example: 80$- 90$ / person
  String get rangePricing => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get tripDuration => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get accomodation => throw _privateConstructorUsedError;
  List<String>? get addOnIds => throw _privateConstructorUsedError;
  List<String>? get reviewIds => throw _privateConstructorUsedError;
  List<String> get initenaryList => throw _privateConstructorUsedError;
  List<String> get timeList24H => throw _privateConstructorUsedError;
  String? get avaiabilityStatus => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String packageId,
      String title,
      String location,
      String? locationUrl,
      String imgUrl,
      String rangePricing,
      String rating,
      String tripDuration,
      String description,
      String accomodation,
      List<String>? addOnIds,
      List<String>? reviewIds,
      List<String> initenaryList,
      List<String> timeList24H,
      String? avaiabilityStatus,
      int reviewCount});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? title = null,
    Object? location = null,
    Object? locationUrl = freezed,
    Object? imgUrl = null,
    Object? rangePricing = null,
    Object? rating = null,
    Object? tripDuration = null,
    Object? description = null,
    Object? accomodation = null,
    Object? addOnIds = freezed,
    Object? reviewIds = freezed,
    Object? initenaryList = null,
    Object? timeList24H = null,
    Object? avaiabilityStatus = freezed,
    Object? reviewCount = null,
  }) {
    return _then(_value.copyWith(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      locationUrl: freezed == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rangePricing: null == rangePricing
          ? _value.rangePricing
          : rangePricing // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tripDuration: null == tripDuration
          ? _value.tripDuration
          : tripDuration // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      accomodation: null == accomodation
          ? _value.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as String,
      addOnIds: freezed == addOnIds
          ? _value.addOnIds
          : addOnIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewIds: freezed == reviewIds
          ? _value.reviewIds
          : reviewIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      initenaryList: null == initenaryList
          ? _value.initenaryList
          : initenaryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList24H: null == timeList24H
          ? _value.timeList24H
          : timeList24H // ignore: cast_nullable_to_non_nullable
              as List<String>,
      avaiabilityStatus: freezed == avaiabilityStatus
          ? _value.avaiabilityStatus
          : avaiabilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_PackageModelCopyWith(
          _$_PackageModel value, $Res Function(_$_PackageModel) then) =
      __$$_PackageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packageId,
      String title,
      String location,
      String? locationUrl,
      String imgUrl,
      String rangePricing,
      String rating,
      String tripDuration,
      String description,
      String accomodation,
      List<String>? addOnIds,
      List<String>? reviewIds,
      List<String> initenaryList,
      List<String> timeList24H,
      String? avaiabilityStatus,
      int reviewCount});
}

/// @nodoc
class __$$_PackageModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_PackageModel>
    implements _$$_PackageModelCopyWith<$Res> {
  __$$_PackageModelCopyWithImpl(
      _$_PackageModel _value, $Res Function(_$_PackageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? title = null,
    Object? location = null,
    Object? locationUrl = freezed,
    Object? imgUrl = null,
    Object? rangePricing = null,
    Object? rating = null,
    Object? tripDuration = null,
    Object? description = null,
    Object? accomodation = null,
    Object? addOnIds = freezed,
    Object? reviewIds = freezed,
    Object? initenaryList = null,
    Object? timeList24H = null,
    Object? avaiabilityStatus = freezed,
    Object? reviewCount = null,
  }) {
    return _then(_$_PackageModel(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      locationUrl: freezed == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rangePricing: null == rangePricing
          ? _value.rangePricing
          : rangePricing // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tripDuration: null == tripDuration
          ? _value.tripDuration
          : tripDuration // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      accomodation: null == accomodation
          ? _value.accomodation
          : accomodation // ignore: cast_nullable_to_non_nullable
              as String,
      addOnIds: freezed == addOnIds
          ? _value._addOnIds
          : addOnIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reviewIds: freezed == reviewIds
          ? _value._reviewIds
          : reviewIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      initenaryList: null == initenaryList
          ? _value._initenaryList
          : initenaryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList24H: null == timeList24H
          ? _value._timeList24H
          : timeList24H // ignore: cast_nullable_to_non_nullable
              as List<String>,
      avaiabilityStatus: freezed == avaiabilityStatus
          ? _value.avaiabilityStatus
          : avaiabilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageModel implements _PackageModel {
  const _$_PackageModel(
      {required this.packageId,
      required this.title,
      required this.location,
      required this.locationUrl,
      required this.imgUrl,
      required this.rangePricing,
      required this.rating,
      required this.tripDuration,
      required this.description,
      required this.accomodation,
      required final List<String>? addOnIds,
      required final List<String>? reviewIds,
      required final List<String> initenaryList,
      required final List<String> timeList24H,
      required this.avaiabilityStatus,
      required this.reviewCount})
      : _addOnIds = addOnIds,
        _reviewIds = reviewIds,
        _initenaryList = initenaryList,
        _timeList24H = timeList24H;

  factory _$_PackageModel.fromJson(Map<String, dynamic> json) =>
      _$$_PackageModelFromJson(json);

  @override
  final String packageId;
  @override
  final String title;
  @override
  final String location;
  @override
  final String? locationUrl;
  @override
  final String imgUrl;

  /// example: 80$- 90$ / person
  @override
  final String rangePricing;
  @override
  final String rating;
  @override
  final String tripDuration;
  @override
  final String description;
  @override
  final String accomodation;
  final List<String>? _addOnIds;
  @override
  List<String>? get addOnIds {
    final value = _addOnIds;
    if (value == null) return null;
    if (_addOnIds is EqualUnmodifiableListView) return _addOnIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _reviewIds;
  @override
  List<String>? get reviewIds {
    final value = _reviewIds;
    if (value == null) return null;
    if (_reviewIds is EqualUnmodifiableListView) return _reviewIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _initenaryList;
  @override
  List<String> get initenaryList {
    if (_initenaryList is EqualUnmodifiableListView) return _initenaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initenaryList);
  }

  final List<String> _timeList24H;
  @override
  List<String> get timeList24H {
    if (_timeList24H is EqualUnmodifiableListView) return _timeList24H;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeList24H);
  }

  @override
  final String? avaiabilityStatus;
  @override
  final int reviewCount;

  @override
  String toString() {
    return 'ProductModel(packageId: $packageId, title: $title, location: $location, locationUrl: $locationUrl, imgUrl: $imgUrl, rangePricing: $rangePricing, rating: $rating, tripDuration: $tripDuration, description: $description, accomodation: $accomodation, addOnIds: $addOnIds, reviewIds: $reviewIds, initenaryList: $initenaryList, timeList24H: $timeList24H, avaiabilityStatus: $avaiabilityStatus, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageModel &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationUrl, locationUrl) ||
                other.locationUrl == locationUrl) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.rangePricing, rangePricing) ||
                other.rangePricing == rangePricing) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.tripDuration, tripDuration) ||
                other.tripDuration == tripDuration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.accomodation, accomodation) ||
                other.accomodation == accomodation) &&
            const DeepCollectionEquality().equals(other._addOnIds, _addOnIds) &&
            const DeepCollectionEquality()
                .equals(other._reviewIds, _reviewIds) &&
            const DeepCollectionEquality()
                .equals(other._initenaryList, _initenaryList) &&
            const DeepCollectionEquality()
                .equals(other._timeList24H, _timeList24H) &&
            (identical(other.avaiabilityStatus, avaiabilityStatus) ||
                other.avaiabilityStatus == avaiabilityStatus) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      packageId,
      title,
      location,
      locationUrl,
      imgUrl,
      rangePricing,
      rating,
      tripDuration,
      description,
      accomodation,
      const DeepCollectionEquality().hash(_addOnIds),
      const DeepCollectionEquality().hash(_reviewIds),
      const DeepCollectionEquality().hash(_initenaryList),
      const DeepCollectionEquality().hash(_timeList24H),
      avaiabilityStatus,
      reviewCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageModelCopyWith<_$_PackageModel> get copyWith =>
      __$$_PackageModelCopyWithImpl<_$_PackageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageModelToJson(
      this,
    );
  }
}

abstract class _PackageModel implements ProductModel {
  const factory _PackageModel(
      {required final String packageId,
      required final String title,
      required final String location,
      required final String? locationUrl,
      required final String imgUrl,
      required final String rangePricing,
      required final String rating,
      required final String tripDuration,
      required final String description,
      required final String accomodation,
      required final List<String>? addOnIds,
      required final List<String>? reviewIds,
      required final List<String> initenaryList,
      required final List<String> timeList24H,
      required final String? avaiabilityStatus,
      required final int reviewCount}) = _$_PackageModel;

  factory _PackageModel.fromJson(Map<String, dynamic> json) =
      _$_PackageModel.fromJson;

  @override
  String get packageId;
  @override
  String get title;
  @override
  String get location;
  @override
  String? get locationUrl;
  @override
  String get imgUrl;
  @override

  /// example: 80$- 90$ / person
  String get rangePricing;
  @override
  String get rating;
  @override
  String get tripDuration;
  @override
  String get description;
  @override
  String get accomodation;
  @override
  List<String>? get addOnIds;
  @override
  List<String>? get reviewIds;
  @override
  List<String> get initenaryList;
  @override
  List<String> get timeList24H;
  @override
  String? get avaiabilityStatus;
  @override
  int get reviewCount;
  @override
  @JsonKey(ignore: true)
  _$$_PackageModelCopyWith<_$_PackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
