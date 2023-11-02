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
  String get imgUrl => throw _privateConstructorUsedError;
  String? get locationUrl => throw _privateConstructorUsedError;
  String? get avaiabilityStatus => throw _privateConstructorUsedError;

  /// example: 80$- 90$ / person
  String get rangePricing => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get tripDuration => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get accomodation => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  List<String> get initenaryList => throw _privateConstructorUsedError;
  List<String> get timeList24H => throw _privateConstructorUsedError;
  List<AddOnModel> get addOn => throw _privateConstructorUsedError;
  List<String>? get reviewIds => throw _privateConstructorUsedError;

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
      String imgUrl,
      String? locationUrl,
      String? avaiabilityStatus,
      String rangePricing,
      String rating,
      String tripDuration,
      String description,
      String accomodation,
      int reviewCount,
      List<String> initenaryList,
      List<String> timeList24H,
      List<AddOnModel> addOn,
      List<String>? reviewIds});
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
    Object? imgUrl = null,
    Object? locationUrl = freezed,
    Object? avaiabilityStatus = freezed,
    Object? rangePricing = null,
    Object? rating = null,
    Object? tripDuration = null,
    Object? description = null,
    Object? accomodation = null,
    Object? reviewCount = null,
    Object? initenaryList = null,
    Object? timeList24H = null,
    Object? addOn = null,
    Object? reviewIds = freezed,
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
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locationUrl: freezed == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avaiabilityStatus: freezed == avaiabilityStatus
          ? _value.avaiabilityStatus
          : avaiabilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      initenaryList: null == initenaryList
          ? _value.initenaryList
          : initenaryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList24H: null == timeList24H
          ? _value.timeList24H
          : timeList24H // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOn: null == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<AddOnModel>,
      reviewIds: freezed == reviewIds
          ? _value.reviewIds
          : reviewIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$PackageModelImplCopyWith(
          _$PackageModelImpl value, $Res Function(_$PackageModelImpl) then) =
      __$$PackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packageId,
      String title,
      String location,
      String imgUrl,
      String? locationUrl,
      String? avaiabilityStatus,
      String rangePricing,
      String rating,
      String tripDuration,
      String description,
      String accomodation,
      int reviewCount,
      List<String> initenaryList,
      List<String> timeList24H,
      List<AddOnModel> addOn,
      List<String>? reviewIds});
}

/// @nodoc
class __$$PackageModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$PackageModelImpl>
    implements _$$PackageModelImplCopyWith<$Res> {
  __$$PackageModelImplCopyWithImpl(
      _$PackageModelImpl _value, $Res Function(_$PackageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? title = null,
    Object? location = null,
    Object? imgUrl = null,
    Object? locationUrl = freezed,
    Object? avaiabilityStatus = freezed,
    Object? rangePricing = null,
    Object? rating = null,
    Object? tripDuration = null,
    Object? description = null,
    Object? accomodation = null,
    Object? reviewCount = null,
    Object? initenaryList = null,
    Object? timeList24H = null,
    Object? addOn = null,
    Object? reviewIds = freezed,
  }) {
    return _then(_$PackageModelImpl(
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
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locationUrl: freezed == locationUrl
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avaiabilityStatus: freezed == avaiabilityStatus
          ? _value.avaiabilityStatus
          : avaiabilityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
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
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      initenaryList: null == initenaryList
          ? _value._initenaryList
          : initenaryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeList24H: null == timeList24H
          ? _value._timeList24H
          : timeList24H // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addOn: null == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<AddOnModel>,
      reviewIds: freezed == reviewIds
          ? _value._reviewIds
          : reviewIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageModelImpl implements _PackageModel {
  const _$PackageModelImpl(
      {required this.packageId,
      required this.title,
      required this.location,
      required this.imgUrl,
      this.locationUrl,
      this.avaiabilityStatus,
      required this.rangePricing,
      required this.rating,
      required this.tripDuration,
      required this.description,
      required this.accomodation,
      required this.reviewCount,
      required final List<String> initenaryList,
      required final List<String> timeList24H,
      required final List<AddOnModel> addOn,
      final List<String>? reviewIds})
      : _initenaryList = initenaryList,
        _timeList24H = timeList24H,
        _addOn = addOn,
        _reviewIds = reviewIds;

  factory _$PackageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageModelImplFromJson(json);

  @override
  final String packageId;
  @override
  final String title;
  @override
  final String location;
  @override
  final String imgUrl;
  @override
  final String? locationUrl;
  @override
  final String? avaiabilityStatus;

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
  @override
  final int reviewCount;
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

  final List<AddOnModel> _addOn;
  @override
  List<AddOnModel> get addOn {
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOn);
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

  @override
  String toString() {
    return 'ProductModel(packageId: $packageId, title: $title, location: $location, imgUrl: $imgUrl, locationUrl: $locationUrl, avaiabilityStatus: $avaiabilityStatus, rangePricing: $rangePricing, rating: $rating, tripDuration: $tripDuration, description: $description, accomodation: $accomodation, reviewCount: $reviewCount, initenaryList: $initenaryList, timeList24H: $timeList24H, addOn: $addOn, reviewIds: $reviewIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageModelImpl &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.locationUrl, locationUrl) ||
                other.locationUrl == locationUrl) &&
            (identical(other.avaiabilityStatus, avaiabilityStatus) ||
                other.avaiabilityStatus == avaiabilityStatus) &&
            (identical(other.rangePricing, rangePricing) ||
                other.rangePricing == rangePricing) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.tripDuration, tripDuration) ||
                other.tripDuration == tripDuration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.accomodation, accomodation) ||
                other.accomodation == accomodation) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality()
                .equals(other._initenaryList, _initenaryList) &&
            const DeepCollectionEquality()
                .equals(other._timeList24H, _timeList24H) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn) &&
            const DeepCollectionEquality()
                .equals(other._reviewIds, _reviewIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      packageId,
      title,
      location,
      imgUrl,
      locationUrl,
      avaiabilityStatus,
      rangePricing,
      rating,
      tripDuration,
      description,
      accomodation,
      reviewCount,
      const DeepCollectionEquality().hash(_initenaryList),
      const DeepCollectionEquality().hash(_timeList24H),
      const DeepCollectionEquality().hash(_addOn),
      const DeepCollectionEquality().hash(_reviewIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      __$$PackageModelImplCopyWithImpl<_$PackageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageModelImplToJson(
      this,
    );
  }
}

abstract class _PackageModel implements ProductModel {
  const factory _PackageModel(
      {required final String packageId,
      required final String title,
      required final String location,
      required final String imgUrl,
      final String? locationUrl,
      final String? avaiabilityStatus,
      required final String rangePricing,
      required final String rating,
      required final String tripDuration,
      required final String description,
      required final String accomodation,
      required final int reviewCount,
      required final List<String> initenaryList,
      required final List<String> timeList24H,
      required final List<AddOnModel> addOn,
      final List<String>? reviewIds}) = _$PackageModelImpl;

  factory _PackageModel.fromJson(Map<String, dynamic> json) =
      _$PackageModelImpl.fromJson;

  @override
  String get packageId;
  @override
  String get title;
  @override
  String get location;
  @override
  String get imgUrl;
  @override
  String? get locationUrl;
  @override
  String? get avaiabilityStatus;
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
  int get reviewCount;
  @override
  List<String> get initenaryList;
  @override
  List<String> get timeList24H;
  @override
  List<AddOnModel> get addOn;
  @override
  List<String>? get reviewIds;
  @override
  @JsonKey(ignore: true)
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
