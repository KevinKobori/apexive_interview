import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    @JsonKey(name: 'copyright') required String? copyright,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'explanation') required String explanation,
    @JsonKey(name: 'hdurl') required String hdurl,
    @JsonKey(name: 'media_type') required String mediaType, // Changed to snake_case
    @JsonKey(name: 'service_version') required String serviceVersion, // Changed to snake_case
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'url') required String url,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, Object?> json) =>
      _$PictureModelFromJson(json);
}