import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

part 'collection_model.freezed.dart';
part 'collection_model.g.dart';

@freezed
class CollectionModel with _$CollectionModel {
  const factory CollectionModel({
   @JsonKey(name: 'name') required String name,
   @JsonKey(name: 'catalog') required List<PictureModel> catalog,

  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, Object?> json) =>
      _$CollectionModelFromJson(json);
}
