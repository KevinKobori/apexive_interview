// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionModelImpl _$$CollectionModelImplFromJson(Map json) =>
    _$CollectionModelImpl(
      name: json['name'] as String,
      pictureList: (json['pictureList'] as List<dynamic>)
          .map(
              (e) => PictureModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pictureList': instance.pictureList.map((e) => e.toJson()).toList(),
    };
