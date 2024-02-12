// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) {
  return _CollectionModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionModel {
  String get name => throw _privateConstructorUsedError;
  List<PictureModel> get pictureList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionModelCopyWith<CollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionModelCopyWith<$Res> {
  factory $CollectionModelCopyWith(
          CollectionModel value, $Res Function(CollectionModel) then) =
      _$CollectionModelCopyWithImpl<$Res, CollectionModel>;
  @useResult
  $Res call({String name, List<PictureModel> pictureList});
}

/// @nodoc
class _$CollectionModelCopyWithImpl<$Res, $Val extends CollectionModel>
    implements $CollectionModelCopyWith<$Res> {
  _$CollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? pictureList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pictureList: null == pictureList
          ? _value.pictureList
          : pictureList // ignore: cast_nullable_to_non_nullable
              as List<PictureModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionModelImplCopyWith<$Res>
    implements $CollectionModelCopyWith<$Res> {
  factory _$$CollectionModelImplCopyWith(_$CollectionModelImpl value,
          $Res Function(_$CollectionModelImpl) then) =
      __$$CollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<PictureModel> pictureList});
}

/// @nodoc
class __$$CollectionModelImplCopyWithImpl<$Res>
    extends _$CollectionModelCopyWithImpl<$Res, _$CollectionModelImpl>
    implements _$$CollectionModelImplCopyWith<$Res> {
  __$$CollectionModelImplCopyWithImpl(
      _$CollectionModelImpl _value, $Res Function(_$CollectionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? pictureList = null,
  }) {
    return _then(_$CollectionModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pictureList: null == pictureList
          ? _value._pictureList
          : pictureList // ignore: cast_nullable_to_non_nullable
              as List<PictureModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionModelImpl implements _CollectionModel {
  const _$CollectionModelImpl(
      {required this.name, required final List<PictureModel> pictureList})
      : _pictureList = pictureList;

  factory _$CollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionModelImplFromJson(json);

  @override
  final String name;
  final List<PictureModel> _pictureList;
  @override
  List<PictureModel> get pictureList {
    if (_pictureList is EqualUnmodifiableListView) return _pictureList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pictureList);
  }

  @override
  String toString() {
    return 'CollectionModel(name: $name, pictureList: $pictureList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._pictureList, _pictureList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_pictureList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionModelImplCopyWith<_$CollectionModelImpl> get copyWith =>
      __$$CollectionModelImplCopyWithImpl<_$CollectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionModel implements CollectionModel {
  const factory _CollectionModel(
      {required final String name,
      required final List<PictureModel> pictureList}) = _$CollectionModelImpl;

  factory _CollectionModel.fromJson(Map<String, dynamic> json) =
      _$CollectionModelImpl.fromJson;

  @override
  String get name;
  @override
  List<PictureModel> get pictureList;
  @override
  @JsonKey(ignore: true)
  _$$CollectionModelImplCopyWith<_$CollectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
