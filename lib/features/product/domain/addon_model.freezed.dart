// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddOnModel _$AddOnModelFromJson(Map<String, dynamic> json) {
  return _AddOnModel.fromJson(json);
}

/// @nodoc
mixin _$AddOnModel {
  /// Add on name, will be displayed as add on name
  String get name => throw _privateConstructorUsedError;

  /// Add on description, will be displayed as tooltip
  String? get description => throw _privateConstructorUsedError;

  /// price value that has been formatted
  ///
  String get pricing => throw _privateConstructorUsedError;

  /// Add on id
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOnModelCopyWith<AddOnModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOnModelCopyWith<$Res> {
  factory $AddOnModelCopyWith(
          AddOnModel value, $Res Function(AddOnModel) then) =
      _$AddOnModelCopyWithImpl<$Res, AddOnModel>;
  @useResult
  $Res call({String name, String? description, String pricing, String id});
}

/// @nodoc
class _$AddOnModelCopyWithImpl<$Res, $Val extends AddOnModel>
    implements $AddOnModelCopyWith<$Res> {
  _$AddOnModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? pricing = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddOnModelImplCopyWith<$Res>
    implements $AddOnModelCopyWith<$Res> {
  factory _$$AddOnModelImplCopyWith(
          _$AddOnModelImpl value, $Res Function(_$AddOnModelImpl) then) =
      __$$AddOnModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description, String pricing, String id});
}

/// @nodoc
class __$$AddOnModelImplCopyWithImpl<$Res>
    extends _$AddOnModelCopyWithImpl<$Res, _$AddOnModelImpl>
    implements _$$AddOnModelImplCopyWith<$Res> {
  __$$AddOnModelImplCopyWithImpl(
      _$AddOnModelImpl _value, $Res Function(_$AddOnModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? pricing = null,
    Object? id = null,
  }) {
    return _then(_$AddOnModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddOnModelImpl implements _AddOnModel {
  const _$AddOnModelImpl(
      {required this.name,
      this.description,
      required this.pricing,
      required this.id});

  factory _$AddOnModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddOnModelImplFromJson(json);

  /// Add on name, will be displayed as add on name
  @override
  final String name;

  /// Add on description, will be displayed as tooltip
  @override
  final String? description;

  /// price value that has been formatted
  ///
  @override
  final String pricing;

  /// Add on id
  @override
  final String id;

  @override
  String toString() {
    return 'AddOnModel(name: $name, description: $description, pricing: $pricing, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOnModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, pricing, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOnModelImplCopyWith<_$AddOnModelImpl> get copyWith =>
      __$$AddOnModelImplCopyWithImpl<_$AddOnModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddOnModelImplToJson(
      this,
    );
  }
}

abstract class _AddOnModel implements AddOnModel {
  const factory _AddOnModel(
      {required final String name,
      final String? description,
      required final String pricing,
      required final String id}) = _$AddOnModelImpl;

  factory _AddOnModel.fromJson(Map<String, dynamic> json) =
      _$AddOnModelImpl.fromJson;

  @override

  /// Add on name, will be displayed as add on name
  String get name;
  @override

  /// Add on description, will be displayed as tooltip
  String? get description;
  @override

  /// price value that has been formatted
  ///
  String get pricing;
  @override

  /// Add on id
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$AddOnModelImplCopyWith<_$AddOnModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
