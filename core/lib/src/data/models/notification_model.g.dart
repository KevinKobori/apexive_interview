// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(Map json) =>
    _$NotificationModelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'type': _$NotificationTypeEnumMap[instance.type]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.offer: 'offer',
};
