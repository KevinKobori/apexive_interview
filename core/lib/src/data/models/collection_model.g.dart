// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionModelImpl _$$CollectionModelImplFromJson(Map json) =>
    _$CollectionModelImpl(
      name: json['name'] as String,
      catalog: (json['catalog'] as List<dynamic>)
          .map(
              (e) => PictureModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$CollectionModelImplToJson(
        _$CollectionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catalog': instance.catalog.map((e) => e.toJson()).toList(),
    };
