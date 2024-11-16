import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

part 'picture_viewmodel.freezed.dart';

@freezed
class PictureViewModel with _$PictureViewModel {
  const factory PictureViewModel({
    required String? copyright,
    required String date,
    required String explanation,
    required String? hdurl,
    required MediaType mediaType,
    required String serviceVersion,
    required String title,
    required String url,
    required double aspectRatio,
  }) = _PictureViewModel;
}
